class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  with_options presence: true do
    validates :items_name, :items_info, :image
    with_options numericality: { other_than: 0, message: "can't be blank" } do
      validates :category_id, :items_status_id, :shipping_fee_id, :prefecture_id, :shipping_date_id
    end
    validates :items_price,
              numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999,
                              message: 'is invalid. Input half-width numbers' }
  end
end
