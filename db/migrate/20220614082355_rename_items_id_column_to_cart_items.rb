class RenameItemsIdColumnToCartItems < ActiveRecord::Migration[6.1]
  def change
    rename_column :cart_items, :items_id, :item_id
  end
end
