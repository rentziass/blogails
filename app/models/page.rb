class Page < ActiveRecord::Base
  searchkick autocomplete: ["title"]
  extend FriendlyId
  include Sluggable

  belongs_to :user
  friendly_id :title, use: [:slugged, :finders]

  validates :title, :text, presence: true

  has_attached_file :image, styles: {
    thumb: "200x200>",
    medium: "500x500#",
    large: "1000x1000>"
  }, :path => "blogails/:class/:attachment/:id/:style/:filename.:extension", :url => ":s3_domain_url"

  # Validate the attached image is image/jpg, image/png, etc
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/

  # TODO this has to be a scope
  def self.page_visible
    where("visible = ?", true)
  end

################ REMOVE IMAGE #############
  attr_writer :remove_image

  def remove_image
    @remove_image || false
  end

  before_validation { self.image.clear if self.remove_image == "1"}

end
