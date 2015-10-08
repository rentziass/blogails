class Enclosure < ActiveRecord::Base
  validates_presence_of :title, :description
  belongs_to :user
  has_attached_file :file, styles: {
    thumb: '200x200>',
    medium: '500x500#',
    large: '1000x1000>'
  }, :path => "blogails/:class/:attachment/:id/:style/:filename.:extension", :url => ":s3_domain_url"

  # Validate the attached image is image/jpg, image/png, etc
  do_not_validate_attachment_file_type :file

end
