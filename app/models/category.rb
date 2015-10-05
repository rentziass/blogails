class Category < ActiveRecord::Base
  has_many :article_categories
  has_many :articles, through: :article_categories, dependent: :destroy

  validates_presence_of :title, :description

  has_many :category_images

  accepts_nested_attributes_for :category_images, allow_destroy: true
end
