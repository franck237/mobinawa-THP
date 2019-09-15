FactoryBot.define do
  factory :product do
    title { "MyString" }
    description { "MyText" }
    price { "9.99" }
    image_product { "MyString" }
    quantity { 1 }
    status { false }
    company { nil }
  end
end
