class OrderDetail < ApplicationRecord
  belongs_to :order
  belongs_to :item

  enum production_status: { impossible_product: 0, wait_product: 1, in_production: 2, product_complet: 3 }

  def subtotal
    (item.price * 1.1).floor * quantity
  end

end
