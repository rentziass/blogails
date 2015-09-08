class Admin::Category < ActiveRecord::Base
  validates_presence_of :title, :description
  has_many :category_images
  accepts_nested_attributes_for :category_images, :allow_destroy => true
end
