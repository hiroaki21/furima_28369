FactoryBot.define do
  factory :user do
    nickname              {Faker::Name.name}
    email                 {Faker::Internet.free_email}
    password              {Faker::Internet.password(min_length: 6)}
    password_confirmation {password}
    last_name             {"漢字ひらがカナ"}
    first_name            {"カンジ平仮名かな"}
    last_name_kana        {"アイウエ"}
    first_name_kana       {"ワヲン"}
    birth_date            {Faker::Date.between(from:'1930-01-01',to:'2015-12-31')}
  end  
end