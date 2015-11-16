require 'rails_helper'

RSpec.describe Page, type: :model do
  include_examples "a slugged item"
  context 'attributes' do
    it { is_expected.to respond_to :title }
    it { is_expected.to respond_to :text }
    it { is_expected.to respond_to :visible }
    it { is_expected.to respond_to :user_id }
    it { is_expected.to respond_to :position }
    it { is_expected.to respond_to :image }
    it { is_expected.to respond_to :remove_image }

    it { is_expected.to belong_to :user }
  end

  context 'validation' do
    it { is_expected.to validate_presence_of :title }
    it { is_expected.to validate_presence_of :text }

    context 'factories' do
      it 'should have a valid generic factory' do
        expect(FactoryGirl.build :page).to be_valid
      end
    end
  end
end
