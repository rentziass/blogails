class Page < ActiveRecord::Base
  extend FriendlyId
  belongs_to :user
  friendly_id :title, use: [:slugged, :finders]
  
  has_attached_file :image, styles: {
    thumb: '200x200>',
    medium: '500x500#',
    large: '1000x1000>'
  }, :path => "blogails/:class/:attachment/:id/:style/:filename.:extension", :url => ":s3_domain_url"

  # Validate the attached image is image/jpg, image/png, etc
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/

  def self.page_visible
    where("visible = ?", true)
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
