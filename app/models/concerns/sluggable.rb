module Sluggable
  extend ActiveSupport::Concern

  included do
    attr_writer :use_slug
  end

  def use_slug
    @use_slug || true
  end

  def should_generate_new_friendly_id?
    slug.blank? || title_changed? if use_slug == "1"
  end
end
