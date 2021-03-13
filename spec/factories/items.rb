FactoryBot.define do
  factory :item do
    name                  { Faker::Name.name }
    explain               { Faker::Food.sushi }
    category_id             { Faker::Number.between(from: 2, to: 11) }
    status_id              { Faker::Number.between(from: 2, to: 7) }
    method_of_payment_id   { Faker::Number.between(from: 2, to: 3) }
    area_id                { Faker::Number.between(from: 2, to: 48) }
    day_required_id        { Faker::Number.between(from: 2, to: 4) }
    price { Faker::Number.between(from: 300, to: 9_999_999) }
    after(:build) do |item|
      item.image.attach(io: File.open('spec/fixtures/ルンパッパ.png'), filename: 'ルンパッパ.png')
    end
  end
end
