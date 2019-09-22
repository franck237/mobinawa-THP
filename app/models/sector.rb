class Sector < ApplicationRecord
	validates :name, uniqueness: true
	validates :icon, presence: true

	has_many :sub_sectors
	has_many :companies, through: :sub_sectors
end
