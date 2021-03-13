FactoryBot.define do
  factory :user_purchase do
    post_code        { Randwordjp.zip(opts = {hyphen: true }) }
    area_id          { Faker::Number.between(from: 2, to: 48) }
    city             { Gimei.address.city.kanji }
    address          { Gimei.town.kanji + '1-1-1'}
    building_name    { Gimei.town.kanji + 'ビル101号室'}
    phone_number     { '090' + Faker::Number.(digits: 8) }
    user_id          {Faker::Number.number(digits: 1) }
    item_id          {Faker::Number.number(digits: 1) }
    token            {"tok_abcdefghijk00000000000000000"}
  end
end
