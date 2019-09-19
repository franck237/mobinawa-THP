class Admin < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :number, presence: true
  validates :password, length: { minimum: 8 }
  validates :firstname, presence: true
  validates :lastname, presence: true
  validates :function, presence: true

  belongs_to :country
  has_many :companies
  has_many :products, through: :companies

  # Active Storage
  has_one_attached :photo_admin 

  #Useful in order to send an email to an admin after creating an account
  after_create :welcome_send

  def fullname
  	firstname.capitalize + " " + lastname.upcase
  end

  def welcome_send
    AdminMailer.welcome_email(self).deliver_now
  end

  def thumbnail
    return self.photo_admin.variant(resize: '200x200').processed
  end
end
