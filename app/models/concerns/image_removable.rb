module ImageRemovable
  extend ActiveSupport::Concern

  included do
    attr_writer :remove_image
    before_validation { image.clear if remove_image == "1" }
  end

  def remove_image
    @remove_image || false
  end
end
