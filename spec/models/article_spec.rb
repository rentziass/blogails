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
    it { is_expected.to respond_to :user_id }
    it { is_expected.to respond_to :summary }
    it { is_expected.to respond_to :name }
    it { is_expected.to respond_to :image }
    it { is_expected.to respond_to :draft }

    it { is_expected.to have_many :categories }
    it { is_expected.to have_many :comments }
    it { is_expected.to belong_to :user }
  end

  context "validation" do
    # TODO: cosa si valida?
    context "factories" do
      it "should have a valid factory" do
        expect(FactoryGirl.build :article).to be_valid
      end
    end
  end
end
