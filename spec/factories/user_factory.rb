FactoryGirl.define do
  factory :user do
    email Faker::Internet.email
    password Faker::Name.name

    trait :admin do
      admin true
    end

  end
end