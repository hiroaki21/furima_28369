FactoryBot.define do
  factory :item do
    title                     { 'title' }
    introduce                 { 'hfaksg' }
    category_id               { '3' }
    status_id                 { '4' }
    fee_burden_id             { '2' }
    ship_origin_id            { '13' }
    ship_date_id              { '3' }
    price                     { '32233' }
    association :user
  end
end
