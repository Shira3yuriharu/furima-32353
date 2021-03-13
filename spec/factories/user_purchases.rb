FactoryBot.define do
  factory :user_purchase do
    post_code        { Faker::Number.number(digits: 7).to_s.insert(3, '-') }
    area_id          { Faker::Number.between(from: 2, to: 48) }
    city             { Gimei.address.city.kanji }
    address          { Gimei.town.kanji + '1-1-1' }
    building_name    { Gimei.town.kanji + 'ビル101号室' }
    phone_number     { "0#{rand(7..9)}0#{rand(1_000_000..99_999_999)}" }
    # user_id          {Faker::Number.number(digits: 1) }
    # item_id          {Faker::Number.number(digits: 1) }
    token            { 'tok_abcdefghijk00000000000000000' }
  end
end
