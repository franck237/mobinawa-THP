class SubSector < ApplicationRecord
	validates :name, presence: true
  belongs_to :sector
  has_many :companies
end
