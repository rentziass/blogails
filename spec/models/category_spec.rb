require 'rails_helper'

RSpec.describe Category, type: :model do
  context 'attributes' do
    it { is_expected.to respond_to :title }
    it { is_expected.to respond_to :description }
    it { is_expected.to respond_to :image }

    it { is_expected.to have_many :articles }
  end

  context 'validation' do
    it { is_expected.to validate_presence_of :title }
    it { is_expected.to validate_presence_of :description }

    context 'factories' do
      it 'should have a valid factory' do
        expect(FactoryGirl.build :category).to be_valid
      end
    end
  end
end
