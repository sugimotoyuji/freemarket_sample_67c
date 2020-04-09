class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :items
  has_many :orders,dependent: :destroy
  has_many :profits
  has_many :points
  has_many :communicatiuons,dependent: :destroy
  has_many :likes,dependent: :destroy
  has_many :flags,dependent: :destroy
  has_many :message_items,through: :messages,source: :items
  has_many :like_items,through: :likes,source: :items
  has_many :flag_items,through: :flags,source: :items
  has_many :addresses
  has_many :todo_lists
  belongs_to :rate
  belongs_to :payment_information,dependent: :destroy
end
