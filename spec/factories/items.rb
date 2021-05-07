FactoryBot.define do
  factory :item do
    name {Faker::Lorem.word}
    info {Faker::Lorem.sentence}
    price {Faker::Number.number} #もっと適切な値があるかも
    category_id {Faker::Number.between(from: 2, to: 6)}
    sales_status_id {Faker::Number.between(from: 2, to: 4)}
    shipping_fee_status_id {Faker::Number.between(from: 2, to: 4)}
    prefecture_id {Faker::Number.between(from: 2, to: 48)}
    scheduled_delivery_id {Faker::Number.between(from: 2, to: 4)}
    association :user #紐づいていないかも

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
