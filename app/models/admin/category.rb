class Admin::Category < ActiveRecord::Base
  validates_presence_of :title, :description
  
end
