class Comment < ActiveRecord::Base
  belongs_to :article
  belongs_to :user

########### VISUALIZZA NOME SE LOGGATO E "ANONIMO" SE NON LOGGATO PER CHI HA COMMENTATO UN ARTICOLO ###########
  def author_name
    user.nil? ? 'Anonimo' : user.display_name
  end

end
