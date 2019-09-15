FactoryBot.define do
  factory :company do
    number { Faker::PhoneNumber.phone_number_with_country_code }
    name { Faker::Company.name }
    description { "Le dieu du football" }
    status { 1 }
    admin { FactoryBot.create(:admin) }  
    country { FactoryBot.create(:country) }
    sub_sector { FactoryBot.create(:sub_sector) }
  end
end
