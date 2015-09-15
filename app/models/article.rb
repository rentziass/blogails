class Article < ActiveRecord::Base
  has_many :article_categories
  has_many :categories, through: :article_categories, dependent: :destroy
end
