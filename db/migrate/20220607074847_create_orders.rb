class CreateOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :orders do |t|
      t.string :shipping_zip_code, null: false
      t.string :shipping_address, null: false
      t.string :delivery_name, null: false
      t.integer :method_of_payment, null: false, default: 0
      t.integer :postage, null: false
      t.integer :payment_amount, null: false
      t.integer :order_status, null: false,  default: 0
      t.integer :product_total, null: false
      t.timestamps
    end
  end
end
