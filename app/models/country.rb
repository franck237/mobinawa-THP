class Country < ApplicationRecord

	#Code validation: it is mendatory to have a code  with a length between 1 and 3
	validates :code,
	presence: true,
    length: { in: 1..4 }

	#name validation: it is mendatory to have a name for a Country
	validates :name,
	uniqueness: true

	#Flag validation: it is mendatory to have a flag for a Country
	validates :flag,
	uniqueness: true

	#Status validation: it is mendatory to have a status for a Country
	validates :status, inclusion: { in: [ true, false ] }

	#Digit validation: it is mendatory to have a digit for a Country
	validates :digit,
	presence: true,
	numericality: {only_integer: true }

	#Associations: One user have many Admin and many companies
	has_many :admins
	has_many :companies
end

