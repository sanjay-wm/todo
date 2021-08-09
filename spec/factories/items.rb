FactoryBot.define do
  factory :item do
    title { Faker::Lorem.word }
    status { 'start' }

    factory :item_with_tags do
      after(:create) do |item|
        create(:tag, item: item)
      end
    end
  end
end
