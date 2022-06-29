class Order < ApplicationRecord
  belongs_to :customer
  has_many :order_details
  enum method_of_payment: { credit_card: 0, transfer: 1 }
  enum order_status: { wait_deposit: 0, payment_confirm: 1, in_production: 2, preparing_ship: 3, sent: 4 }
  
end
