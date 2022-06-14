class CartItem < ApplicationRecord
  has_many :items
  belongs_to :customer
end
