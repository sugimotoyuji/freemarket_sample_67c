class Address < ApplicationRecord
  belongs_to :user, optional: true
  validates :zipcode, :city, :address ,presence: true
end
