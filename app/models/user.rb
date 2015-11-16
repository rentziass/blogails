class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :authored_articles, foreign_key: "author_id", class_name: "Article"
  has_many :enclosures
  has_many :links
  has_many :pages
  has_many :comments
  belongs_to :role

  ############ VISUALIZZA NOME UTENTE CHE HA COMMENTATO ##########
  def display_name
    "#{first_name} #{last_name.first}."
  end

  ############ RUOLO DI DEFAULT PER I NUOVI UTENTI ##########
  before_create :set_default_role

  private

  def set_default_role
    self.role ||= Role.find_by_name("admin")
  end

end
