class Enclosure < ActiveRecord::Base
  validates_presence_of :title, :description
  belongs_to :user
  has_attached_file :file, styles: {
    thumb: "200x200>",
    medium: "500x500#",
    large: "1000x1000>"
  }, :path => "blogails/:class/:attachment/:id/:style/:filename.:extension", :url => ":s3_domain_url"

  # Validate the attached file is image/jpg, image/png, pdf
  validates_attachment_content_type :file, :content_type => ["image/jpeg","image/png","application/pdf"]
end
