class Product < ApplicationRecord

	#Tilte validation: it is mendatory to have a title for a Product
	validates :title,
	presence: true

	#Description validation: it is mendatory to have an description for a Product
	validates_length_of :description, minimum: 5

    #Price validation: it is mendatory to have a price for a product and also that price need to be decimal
    validates :price, numericality: { greater_than_or_equal_to: 0 }

	#Image_product validation: it is mendatory to have an image for a Product
	validates :image_product,
	presence: true

	#Quantity validation: it is mendatory to have a quantity for a Product
	validates :quantity,
	presence: true,
	numericality: {only_integer: true }

	#Status validation: it is mendatory to have a status for a Product
	validates :status, inclusion: { in: [ true, false ] }


	#Associations: One company belong to one Admin, une sub_sector and one country	
	belongs_to :company

end
