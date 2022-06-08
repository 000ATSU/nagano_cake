class AddItemIdToCartItems < ActiveRecord::Migration[6.1]
  def change
    add_column :cart_items, :items_id, :integer, null: false
    add_column :cart_items, :customer_id, :integer, null: false
  end
end
