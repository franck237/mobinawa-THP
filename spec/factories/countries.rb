FactoryBot.define do
  factory :country do
    code { "+33" }
    name { Faker::Address.country }
    flag { Faker::Nation.flag }
    status { false }
    digit { 9 }
  end
end
