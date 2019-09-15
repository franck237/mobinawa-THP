FactoryBot.define do
  factory :sub_sector do
    name { "Football" }
    sector { FactoryBot.create(:sector) }
  end
end
