class Article < ActiveRecord::Base
  extend FriendlyId

  has_many :article_categories
  has_many :categories, through: :article_categories
  has_many :comments, dependent: :destroy
  belongs_to :user

  friendly_id :title, use: [:slugged, :finders]

########### ARTICOLI VISIBILI SOLO CON ORARIO E DATA MINORE/UGUALE
  def self.available
    where("date <= ?", Time.now)
  end

########### Slug change on update ################
  attr_writer :use_slug

  def use_slug
    @use_slug || true
  end

  def should_generate_new_friendly_id?
    slug.blank? || title_changed? if use_slug == '1'
  end

end
