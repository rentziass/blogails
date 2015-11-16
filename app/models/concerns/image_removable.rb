module ImageRemovable
  extend ActiveSupport::Concern

  included do
    attr_writer :remove_image
  end

  def remove_image
    @remove_image || false
  end

  before_validation { self.image.clear if self.remove_image == "1"}
end
