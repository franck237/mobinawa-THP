FactoryBot.define do
  factory :sector do
    name { Faker::Commerce.department(max: 1) }
    icon { "https://www.locallien.fr/uploads/Jeunes%20-%20Activite%CC%81s%20loisirs.png" }
  end
end