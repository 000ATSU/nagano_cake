class ChangeCloumnsNotnullAddAddresses < ActiveRecord::Migration[6.1]
  def change
     change_column :addresses, :customer_id, :integer, null: false
  end
end
