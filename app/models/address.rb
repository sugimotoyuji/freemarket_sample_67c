class Address < ApplicationRecord
  belongs_to :user, optional: true
  validates :shipping_first_name, :shipping_first_name_reading, :shipping_last_name, :shipping_last_name_reading, :zip_code, :prefecture, :city, :address ,presence: true
end