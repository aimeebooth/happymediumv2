FactoryGirl.define do
  factory :post do
    category
    # title Faker::Name.title
    # body Faker::Lorem.paragraph
    title "test"
    body "test description"

    trait :archived do
      archived true
    end
    
    trait :uncategorized do
      category nil
    end
  end
end