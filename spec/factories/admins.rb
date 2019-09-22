FactoryBot.define do
  factory :admin do
  	number { Faker::PhoneNumber.phone_number_with_country_code }
    password { "password1" }
    firstname { Faker::Name.first_name }
    lastname { Faker::Name.last_name }
    function { "CEO" }
    email { Faker::Internet.email }
    country { FactoryBot.create(:country) }

  end
end
