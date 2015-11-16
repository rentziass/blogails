class Article < ActiveRecord::Base
  searchkick autocomplete: ["title"]
  extend FriendlyId
  include Sluggable
  include HasStandardImage
  include ImageRemovable

  has_many :article_categories
  has_many :categories, through: :article_categories
  has_many :comments, dependent: :destroy
  belongs_to :author, class_name: "User"

  validates :title, presence: true

  friendly_id :title, use: [:slugged, :finders]

  scope :available, -> {
    where("date <= ?", Time.now)
  }
  scope :visible, -> {
    where(visible: true)
  }
  scope :in_evidence, -> {
    where(evidence: true)
  }

  default_value_for :date do
    Time.now
  end
end
