class OrderShippingAddress
  include ActiveModel::Model
  attr_accessor :postal_code, :prefecture_id, :city, :house_number,
                :building_name, :phone_number, :token, :item_id, :user_id

  with_options presence: true do
    validates :token, :city, :house_number, :user_id, :item_id
    validates :postal_code,
              format: { with: /\A[0-9]{3}-[0-9]{4}\z/,
                        message: 'is invalid. Include hyphen(-) & half-width numbers(e.g. 000-0000)' }
    validates :phone_number,
              format: { with: /\A\d{10}$|^\d{11}\z/,
                        message: 'is invalid. Input only half-width numbers(digits: 10~11)' }
  end
  validates :prefecture_id, numericality: { other_than: 0, message: "can't be blank" }

  def save
    order = Order.create(item_id: item_id, user_id: user_id)
    ShippingAddress.create(
      postal_code: postal_code,
      prefecture_id: prefecture_id,
      city: city,
      house_number: house_number,
      building_name: building_name,
      phone_number: phone_number,
      order_id: order.id
    )
  end
end
