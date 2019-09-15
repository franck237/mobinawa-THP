class SubSector < ApplicationRecord
	validates :name, presence: true
  belongs_to :sector
end
