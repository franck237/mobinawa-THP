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

  #Useful in order to send an email to an admin after creating an account
  after_create :welcome_send

  def fullname
  	firstname + " " + lastname
  end

  def welcome_send
    AdminMailer.welcome_email(self).deliver_now
  end
end
