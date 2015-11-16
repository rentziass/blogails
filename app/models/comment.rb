class Comment < ActiveRecord::Base
  belongs_to :article
  belongs_to :user

  def author_name
    user.nil? ? "Anonimo" : user.display_name
  end
end
