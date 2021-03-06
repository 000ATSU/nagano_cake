class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :first_name_kana, presence: true
  validates :last_name_kana, presence: true
  validates :email, presence: true
  validates :postal_code, length: {maximum: 7}
  validates :address, presence: true
  validates :telephone_number, presence: true

  has_many :cart_items
  has_many :addresses
  has_many :orders

  def display_name
    first_name + last_name
  end

end
