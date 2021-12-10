class ShippingAddress < ApplicationRecord
  belongs_to :order

  validates :postal_code, :city, :house_number, :building_name, :phone_number, presence: true
  validates :prefecture_id, numericality: { other_than: 0, message: "can't be blank" }
end
