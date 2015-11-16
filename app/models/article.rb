class Article < ActiveRecord::Base
  searchkick autocomplete: ["title"]
  extend FriendlyId
  include Sluggable

  has_many :article_categories
  has_many :categories, through: :article_categories
  has_many :comments, dependent: :destroy
  belongs_to :author, class_name: "User"

  validates :title, presence: true

  friendly_id :title, use: [:slugged, :finders]

  has_attached_file :image, styles: {
    thumb: "200x200>",
    medium: "500x500#",
    large: "1000x1000>"
  }, path: "blogails/:class/:attachment/:id/:style/:filename.:extension", url: ":s3_domain_url"

  # Validate the attached image is image/jpg, image/png, etc
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/

  scope :available, -> {
    where("date <= ?", Time.now)
  }
  scope :visible, -> {
    where(visible: true)
  }
  scope :in_evidence, -> {
    where(evidence: true)
  }

  ################ REMOVE IMAGE #############
  attr_writer :remove_image

  def remove_image
    @remove_image || false
  end

  before_validation { self.image.clear if self.remove_image == "1"}
end
