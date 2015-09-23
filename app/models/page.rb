class Page < ActiveRecord::Base
  extend FriendlyId

  belongs_to :user

  friendly_id :title, use: [:slugged, :finders]

  ########### Slug change on update ################
  attr_writer :use_slug

  def use_slug
    @use_slug || true
  end

  def should_generate_new_friendly_id?
    slug.blank? || title_changed? if use_slug == '1'
  end

end
