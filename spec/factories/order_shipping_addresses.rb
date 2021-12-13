FactoryBot.define do
  factory :order_shipping_address do
    token         { 'tok_abcdefghijk00000000000000000' }
    postal_code   { '123-4567' }
    prefecture_id { Faker::Number.between(from: 1, to: 47) }
    city          { '新江戸市' }
    house_number  { '1-1' }
    building_name { '長屋303' }
    phone_number  { Faker::Number.leading_zero_number(digits: 11) }
  end
end
