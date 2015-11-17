class Option < ActiveRecord::Base
  # TODO: rinominare analitics
  def view_attributes
    attributes.except("id", "created_at", "updated_at")
  end
end
