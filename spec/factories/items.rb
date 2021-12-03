FactoryBot.define do
  factory :item do
    items_name       { Faker::Lorem.characters(number: 1..40) }
    items_info       { Faker::Lorem.characters(number: 1..999) }
    category_id      { Faker::Number.between(from: 1, to: 10) }
    items_status_id  { Faker::Number.between(from: 1, to: 6) }
    shipping_fee_id  { Faker::Number.between(from: 1, to: 2) }
    prefecture_id    { Faker::Number.between(from: 1, to: 47) }
    shipping_date_id { Faker::Number.between(from: 1, to: 3) }
    items_price      { Faker::Number.between(from: 300, to: 9_999_999) }

    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
