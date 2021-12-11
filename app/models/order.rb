class Order < ApplicationRecord
  belongs_to :item
  belongs_to :user
  has_one    :shipping_addresses

  attr_accessor :token
end
