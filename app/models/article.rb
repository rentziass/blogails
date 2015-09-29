class Article < ActiveRecord::Base
  extend FriendlyId

  has_many :article_categories
  has_many :categories, through: :article_categories
  belongs_to :user

  # COMMENTI
  acts_as_commontable

  friendly_id :title, use: [:slugged, :finders]

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
