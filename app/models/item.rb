class Item < ApplicationRecord
  belongs_to       :user
  has_one_attached :image
  has_one          :order

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :items_status
  belongs_to :shipping_fee
  belongs_to :prefecture
  belongs_to :shipping_date

  with_options presence: true do
    validates :items_name, :items_info, :image
    validates :items_price,
              numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999,
                              message: 'is invalid. Input half-width numbers (between 300 ~ 9,999,999)' }
  end
  with_options numericality: { other_than: 0, message: "can't be blank" } do
    validates :category_id, :items_status_id, :shipping_fee_id, :prefecture_id, :shipping_date_id
  end
end
