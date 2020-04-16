class Item < ApplicationRecord
  has_many :item_images,dependent: :destroy
  accepts_nested_attributes_for :item_images, allow_destroy: true
  has_many :communications,dependent: :destroy
  has_many :likes
  has_many :flags
  has_many :message_users,through: :messages,source: :user
  has_many :like_users,through: :likes,source: :user
  has_many :flag_users,through: :flags,source: :user
  belongs_to :order ,optional: true
  belongs_to :profit ,optional: true
  belongs_to :user
  belongs_to :category
  belongs_to :brand,optional: true
  accepts_nested_attributes_for :brand
 

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :size
  belongs_to_active_hash :condition
  belongs_to_active_hash :delivery_date
  belongs_to_active_hash :delivery_charge
  belongs_to_active_hash :delivery_way
  belongs_to_active_hash :order_status

  with_options presence: true do
    validates :item_image_ids
    validates :name
    validates :description ,length: { maximum: 1000 }
    validates :category
    validates :size_id
    validates :condition_id
    validates :delivery_charge_id
    validates :delivery_way_id
    validates :delivery_date_id
    validates :price
   

  end


end
