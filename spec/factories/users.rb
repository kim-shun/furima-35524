FactoryBot.define do
  factory :user do
    nickname { Faker::Name.initials(number: 2) }
    last_name { '山田' }
    first_name { '太郎' }
    last_name_kana { 'ヤマダ' }
    first_name_kana { 'タロウ' }
    birth_date { Faker::Date.birthday } # Date.between(from: '2014-09-23', to: '2014-09-25')のような制限を設けるべき？
    email { Faker::Internet.free_email }
    password = 'a1' + Faker::Internet.password(min_length: 6)
    password { password }
    password_confirmation { password }
  end
end
