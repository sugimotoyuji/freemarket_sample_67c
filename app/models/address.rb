class Address < ApplicationRecord
  belongs_to :user, optional: true
  validates :zip_code, :city, :address ,presence: true
end
