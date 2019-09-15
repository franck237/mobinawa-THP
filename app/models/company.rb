class Company < ApplicationRecord
  belongs_to :sub_sector
  belongs_to :admin
  belongs_to :country
end
