shared_examples "a slugged item" do
  describe 'attributes' do
    it { is_expected.to respond_to :slug }
    it { is_expected.to respond_to :should_generate_new_friendly_id? }
    it { is_expected.to respond_to :use_slug }
  end
end
