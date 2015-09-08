class Admin::CategoryImage < ActiveRecord::Base
  belongs_to :category

  has_attached_file :image, styles: {
    thumb: '200x200>',
    medium: '500x500#',
    large: '1000x1000>'
  }, :path => "blogails/:class/:attachment/:id/:style/:filename.:extension", :url => ":s3_domain_url"

# Validate the attached image is image/jpg, image/png, etc
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/
end
