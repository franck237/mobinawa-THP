# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'
require 'activerecord-reset-pk-sequence'

Product.destroy_all
Company.destroy_all
Admin.destroy_all
SubSector.destroy_all
Sector.destroy_all
Country.destroy_all

#Allow us to reset id for every objet that we destroy! So when we run db:seed again we restart with id 1 (not with id 234 for example)
Product.reset_pk_sequence
Company.reset_pk_sequence
Admin.reset_pk_sequence
SubSector.reset_pk_sequence
Sector.reset_pk_sequence
Country.reset_pk_sequence

# Creation of 3 countries
	france = Country.create!(code: "+33", name: "France", flag: "icons/flags/fr.png", status: true, digit: 10)
	cameroun = Country.create!(code: "+237", name: "Cameroun", flag: "icons/flags/cm.png", status: true, digit: 8)
	nigeria = Country.create!(code: "+234", name: "Nigeria", flag: "icons/flags/ng.png", status: true, digit: 8)

# Creation of 12 sectors
	i = 0
	4.times do
	sector = Sector.create!(name: Faker::Company.industry + (i+1).to_s, icon: "icons/figma/icon-school.png")
	i =+ 1
	end

	i = 4
	4.times do
	sector = Sector.create!(name: Faker::Company.industry + (i+1).to_s, icon: "icons/figma/icon-build.png")
	i =+ 1
	end

	i = 8
	4.times do
	sector = Sector.create!(name: Faker::Commerce.department(max: 4) + (i+1).to_s, icon: "icons/figma/icon-health.png")
	i =+ 1
	end

# Creation of 2 sub_sectors by sectors = 24 sub_sectors
	sectors = Sector.all
	i = 0
	12.times do
		2.times do
		sub_sector = SubSector.create!(name: Faker::Company.type, sector_id: sectors[i].id)
		end
	i = i + 1
	end

# Creation of 2 admins & companies by sub_sectors by countries = 144 companies & products by companies = 288 products
	sub_sectors = SubSector.all
	i = 0
	e = 1
	24.times do
		2.times do
			firstname = Faker::Name.first_name
			lastname = Faker::Name.last_name
			admin = Admin.create!(number: "06" + Faker::Number.number(digits: france.digit - 2).to_s, email: firstname + "." + lastname + "@" + Faker::Internet.domain_name, password: Faker::Internet.password(min_length: 8), firstname: firstname, lastname: lastname, function: Faker::Company.profession, country_id: france.id)
			company = Company.create!(number: Faker::Number.leading_zero_number(digits: france.digit), name: Faker::Company.name, email: "contact" + e.to_s + "@" + Faker::Internet.domain_name, website: "www." + Faker::Internet.domain_name, logo: Faker::Company.logo, status: 1, description: Faker::Company.catch_phrase, sub_sector_id: sub_sectors[i].id, admin_id: admin.id, country_id: france.id)
			2.times do
			product = Product.create!(title: Faker::Commerce.product_name, description: Faker::Lorem.sentence(word_count: 7, supplemental: false, random_words_to_add: 4), price: Faker::Commerce.price(range: 0..30, as_string: false), image_product: Faker::Avatar.image(size: "50x50", format: "jpg"), quantity: rand(20), status: true, company_id: company.id)
			end
			firstname = Faker::Name.first_name
			lastname = Faker::Name.last_name
			admin = Admin.create!(number: "6" + Faker::Number.number(digits: cameroun.digit - 1).to_s, email: firstname + "." + lastname + "@" + Faker::Internet.domain_name, password: Faker::Internet.password(min_length: 8), firstname: firstname, lastname: lastname, function: Faker::Company.profession, country_id: cameroun.id)
			company = Company.create!(number: "2" + Faker::Number.leading_zero_number(digits: cameroun.digit - 1).to_s, name: Faker::Company.name, email: "contact" + e.to_s + "@" + Faker::Internet.domain_name, website: "www." + Faker::Internet.domain_name, logo: Faker::Company.logo, status: 1, description: Faker::Company.catch_phrase, sub_sector_id: sub_sectors[i].id, admin_id: admin.id, country_id: cameroun.id)
			2.times do
			product = Product.create!(title: Faker::Commerce.product_name, description: Faker::Lorem.sentence(word_count: 7, supplemental: false, random_words_to_add: 4), price: Faker::Commerce.price(range: 0..30, as_string: false), image_product: Faker::Avatar.image(size: "50x50", format: "jpg"), quantity: rand(20), status: true, company_id: company.id)
			end
			firstname = Faker::Name.first_name
			lastname = Faker::Name.last_name
			admin = Admin.create!(number: "6" + Faker::Number.leading_zero_number(digits: nigeria.digit - 1).to_s, email: firstname + "." + lastname + "@" + Faker::Internet.domain_name, password: Faker::Internet.password(min_length: 8), firstname: firstname, lastname: lastname, function: Faker::Company.profession, country_id: nigeria.id)
			company = Company.create!(number: "3" + Faker::Number.leading_zero_number(digits: nigeria.digit - 1).to_s, name: Faker::Company.name, email: "contact" + e.to_s + "@" + Faker::Internet.domain_name, website: "www." + Faker::Internet.domain_name, logo: Faker::Company.logo, status: 1, description: Faker::Company.catch_phrase, sub_sector_id: sub_sectors[i].id, admin_id: admin.id, country_id: nigeria.id)
			2.times do
			product = Product.create!(title: Faker::Commerce.product_name, description: Faker::Lorem.sentence(word_count: 7, supplemental: false, random_words_to_add: 4), price: Faker::Commerce.price(range: 0..30, as_string: false), image_product: Faker::Avatar.image(size: "50x50", format: "jpg"), quantity: rand(20), status: true, company_id: company.id)
		end
		e += 1
		end
	i = i + 1
	end

	# Creation of 3 super admins
#	admin1 = Admin.create!(number: "0751597396", email: "franck.kamanou@gmail.com", password: "mobinawa", firstname: "Franck", lastname: "KAMANOU", function: "CEO", country_id: france.id)
#	admin2 = Admin.create!(number: "0631237396", email: "yvonvotrementor@gmail.com", password: "mobinawa", firstname: "Yvon", lastname: "EKWALLA", function: "CTO", country_id: france.id)
#	admin3 = Admin.create!(number: "0611422900", email: "mylondo.o@gmail.com", password: "mobinawa", firstname: "Outalianh", lastname: "MYLONDO", function: "CFO", country_id: france.id)
