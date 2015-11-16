class Category < ActiveRecord::Base
  has_many :article_categories
  has_many :articles, through: :article_categories, dependent: :destroy

  include HasStandardImage
  include ImageRemovable

  validates_presence_of :title, :description
end
