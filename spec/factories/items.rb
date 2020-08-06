FactoryBot.define do
  factory :item do
    title                     { Faker::Name.name }
    introduce                 { Faker::Lorem.sentence}
    category_id               { Faker::Number.within(range: 2..11)}
    status_id                 { Faker::Number.within(range: 2..7)}
    fee_burden_id             { Faker::Number.within(range: 2..3) }
    ship_origin_id            { Faker::Number.within(range: 2..48) }
    ship_date_id              { Faker::Number.within(range: 2..4) }
    price                     { Faker::Number.within(range: 300..9999999) }
  end
end
