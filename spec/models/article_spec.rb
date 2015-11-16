require "rails_helper"

RSpec.describe Article, type: :model do
  include_examples "a slugged item"
  context "attributes" do
    it { is_expected.to respond_to :title }
    it { is_expected.to respond_to :text }
    it { is_expected.to respond_to :evidence }
    it { is_expected.to respond_to :visible }
    it { is_expected.to respond_to :date }
    it { is_expected.to respond_to :commentable }
    it { is_expected.to respond_to :tag }
    it { is_expected.to respond_to :author_id }
    it { is_expected.to respond_to :summary }
    it { is_expected.to respond_to :image }

    it { is_expected.to have_many :categories }
    it { is_expected.to have_many :comments }
    it { is_expected.to belong_to :author }
  end

  context "validation" do
    context "factories" do
      it "should have a valid factory" do
        expect(FactoryGirl.build :article).to be_valid
      end
    end
  end

  context 'scopes' do
    describe 'visible' do
      it 'should respond' do
        expect(Article).to respond_to :visible
      end
      it 'should return all articles with visible true' do
        visible = FactoryGirl.create_list :article, 5, visible: true
        FactoryGirl.create_list :article, 5, visible: false
        expect(Article.visible).to match_array visible
      end
    end

    describe 'available' do
      it 'should respond' do
        expect(Article).to respond_to :available
      end
      it 'should return articles with date < the now' do
        available = FactoryGirl.create_list :article, 5, date: Time.now - 5.days
        FactoryGirl.create_list :article, 5, date: Time.now + 5.days
        expect(Article.available).to match_array available
      end
    end

    describe 'in_evidence' do
      it 'should respond' do
        expect(Article).to respond_to :in_evidence
      end
      it 'should return articles where evidence: true' do
        in_evidence = FactoryGirl.create_list :article, 5, evidence: true
        FactoryGirl.create_list :article, 5, evidence: false
        expect(Article.in_evidence).to match_array in_evidence
      end
    end
  end
end
