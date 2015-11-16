class Page < ActiveRecord::Base
  searchkick autocomplete: ['title']
  extend FriendlyId
  belongs_to :user
  friendly_id :title, use: [:slugged, :finders]

  validates :title, :text, presence: true

  has_attached_file :image, styles: {
    thumb: '200x200>',
    medium: '500x500#',
    large: '1000x1000>'
  }, :path => "blogails/:class/:attachment/:id/:style/:filename.:extension", :url => ':s3_domain_url'

  # Validate the attached image is image/jpg, image/png, etc
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/

  # TODO this has to be a scope
  def self.page_visible
    where('visible = ?', true)
  end

  ########### Slug change on update ################
  attr_writer :use_slug

  def use_slug
    @use_slug || true
  end

  # TODO What's this for?
  def should_generate_new_friendly_id?
    slug.blank? || title_changed? if use_slug == '1'
  end

################ REMOVE IMAGE #############
  attr_writer :remove_image

  def remove_image
    @remove_image || false
  end

  before_validation { self.image.clear if self.remove_image == '1'}

end
