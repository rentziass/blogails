class Article < ActiveRecord::Base
  searchkick autocomplete: ["title"]
  extend FriendlyId

  has_many :article_categories
  has_many :categories, through: :article_categories
  has_many :comments, dependent: :destroy
  # TODO: questo e l'autore? Se sì ti consiglio di chiamare la relazione author altrimenti tra un po" è un casino
  belongs_to :user

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

  ########### Slug change on update ################
  attr_writer :use_slug

  def use_slug
    @use_slug || true
  end

  def should_generate_new_friendly_id?
    slug.blank? || title_changed? if use_slug == "1"
  end

  ################ REMOVE IMAGE #############
  attr_writer :remove_image

  def remove_image
    @remove_image || false
  end

  before_validation { self.image.clear if self.remove_image == "1"}
end
