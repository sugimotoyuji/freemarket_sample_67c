class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,:omniauthable, omniauth_providers: [:facebook, :google_oauth2]
       

  validates :nickname, :first_name, :first_name_reading, :last_name, :last_name_reading, :telephone, :birth_year, :birth_month, :birth_day, presence: true
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, uniqueness: true, format: { with: VALID_EMAIL_REGEX }
  validates :password, length: { minimum: 8 }
  has_one  :address
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
  has_many :todo_lists
  has_many :sns_credentials
end