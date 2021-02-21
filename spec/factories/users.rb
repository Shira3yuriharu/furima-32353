FactoryBot.define do
  factory :user do
    nickname              { Faker::Name.name }
    email                 { Faker::Internet.free_email }
    password              { '1a' + Faker::Internet.password(min_length: 4) }
    password_confirmation { password }
    lastname              { Gimei.last.kanji }
    firstname             { Gimei.first.kanji }
    lastname_kana         { Gimei.last.katakana }
    firstname_kana        { Gimei.first.katakana }
    birthday              { Faker::Date.in_date_period }
  end
end
