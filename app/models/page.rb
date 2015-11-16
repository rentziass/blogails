class Page < ActiveRecord::Base
  searchkick autocomplete: ["title"]
  extend FriendlyId
  include Sluggable
  include HasStandardImage
  include ImageRemovable

  belongs_to :user
  friendly_id :title, use: [:slugged, :finders]

  validates :title, :text, presence: true

  scope :visible, lambda {
    where(visible: true)
  }
end
