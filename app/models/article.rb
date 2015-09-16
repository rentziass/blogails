class Article < ActiveRecord::Base
  extend FriendlyId

  has_many :article_categories
  has_many :categories, through: :article_categories, dependent: :destroy
  belongs_to :user

  friendly_id :title, use: [:slugged, :finders]

end
