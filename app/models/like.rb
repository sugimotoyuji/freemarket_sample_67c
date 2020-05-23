class Like < ApplicationRecord
  belongs_to :item, counter_cache: :likes_count
  belongs_to :user

  validates_uniqueness_of :item_id, scope: :user_id
end
