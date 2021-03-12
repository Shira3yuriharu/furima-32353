FactoryBot.define do
  factory :user_purchase do
    post_code
    area_id          { Faker::Number.between(from: 2, to: 48) }
    city
    address
    building_name
    phone_number


  end
end
