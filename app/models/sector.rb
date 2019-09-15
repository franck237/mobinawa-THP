class Sector < ApplicationRecord
	validates :name, uniqueness: true
	validates :icon, presence: true

	has_many :sub_sectors
end
