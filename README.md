# README
    @likes = Like.where(user_id: @user.id)
    
    @items = []
    @likes.each do |like|
      @items << Item.find(like.item_id)
    end

    ##likesテーブルからログインしているユーザーのidが入っているレコードを取得してくる
    ##ユーザーがいいねしたアイテムのこレードをアイテムテーブルから取得してくる eachを使って処理を行う
    where  find  find_by


This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

## users テーブル
|Column|Type|Options|
|------|----|-------|
|nickname|string|null:false|
|first_name|string|null:false|
|first_name_reading|string|null:false|
|last_name|string|null:false|
|last_name_reading|string|null:false|
|email|string|null:false,unique|
|password|string|null:false|
|telephone|string|null:false|
|address_id|string|foreign_key: true|
|introduction|text|
|birth_year|integer|null:false|
|birth_month|integer|null:false|
|birth_day|integer|null:false|
|reset_password_token|string|
|reset_password_sent_at|daytime|
|avatar|text|
|point_amount|integer|
|profit_amount|integer|
|payment_information|reference|foreign_key: true|

### Association
- has_many :items
- has_many :orders,dependent: :destroy
- has_many :profits
- has_many :points
- has_many :communicatiuons,dependent: :destroy
- has_many :likes,dependent: :destroy
- has_many :flags,dependent: :destroy
- has_many :message_items,through::messages,source::items
- has_many :like_items,through::likes,source::items
- has_many :flag_items,through::flags,source::items
- has_many :addresses
- has_many :todo_lists
- belongs_to :rate
- belongs_to :payment_information,dependent: :destroy

## Todo_listsテーブル
|Column|Type|Options|
|------|----|-------|
|user|reference|null:false,foreign_key: true|
|list|text|null:false|

### Association
- belongs_to :user

## ratesテーブル
|Column|Type|Options|
|------|----|-------|
|rating|string|

### Association
- has_many :items
- has_many :users

## rate_countsテーブル
|Column|Type|Options|
|------|----|-------|
|rating|reference|foreign_key: true|
|user|reference|foreign_key: true|
|item|reference|foreign_key: true|
|message|text	|null:false|
|seller_or_buyer|boolean|

### Association
- has_many :items
- has_many :users

## addressテーブル
|Column|Type|Options|
|------|----|-------|
|city|string|null:false|
|adress|string|null:false|
|building|string|
|zip_code|integer|null:false|
### Association
- belongs_to :users
- gemのactive_hashを用いて都道府県を記載する

## pointsテーブル
|Column|Type|Options|
|------|----|-------|
|amount|integer|
|user|reference|foreign_key: true|
|point_status|reference|foreign_key: true|

### Association
- belongs_to :user
- belongs_to :point_status

## point_statusesテーブル
|Column|Type|Options|
|------|----|-------|
|point_status|string|

### Association
- has_many :points

## profitsテーブル
|Column|Type|Options|
|------|----|-------|
|profit|integer|
|user|reference|foreign_key: true|
|item|reference|foreign_key: true|
|expiration_date|daytime|
|profit_is_vaild|boolean|

### Association
- belongs_to :item
- belongs_to :user

## communicationsテーブル
|Column|Type|Options|
|------|----|-------|
|message|text|
|user|reference|foreign_key: true|
|item|reference|foreign_key: true|
|seller_or_buyer|boolean|
|order_status|reference|foreign_key: true|

### Association
- belongs_to :item
- belongs_to :user
- belongs_to :order_status

## likesテーブル
|Column|Type|Options|
|------|----|-------|
|user|reference|foreign_key: true|
|item|reference|foreign_key: true|

### Association
- belongs_to :item
- belongs_to :user

## flagsテーブル
|Column|Type|Options|
|------|----|-------|
|user|reference|foreign_key: true|
|item|reference|foreign_key: true|

### Association
- belongs_to :item
- belongs_to :user



## itemsテーブル
|Column|Type|Options|
|------|----|-------|
|user|reference|null:false,foreign_key:ture|
|name|string|null:false|
|price|integer|null:false|
|description|text|null:false|
|category|reference|null:false,foreign_key: true|
|brand|reference|foreign_key: true|
|size|reference|null:false,foreign_key: true|
|condition|reference|foreign_key: true|
|delivery_charge|reference|foreign_key: true|
|prefecure|reference|foreign_key: true|
|delivery_dates|reference|foreign_key: true|
|delivery_ways|reference|foreign_key: true|
|order_status|reference|foreign_key: true|

### Association
- has_many :item_images,dependent: :destroy
- has_many :communications,dependent: :destroy
- has_many :likes
- has_many :flags
- has_many :message_users,through::messages,source::user
- has_many :like_users,through::likes,source::user
- has_many :flag_users,through::flags,source::user
- belongs_to :order
- belongs_to :profit 
- belongs_to :prefecture
- belongs_to :user
- belongs_to :category
- belongs_to :brand
- belongs_to :condition
- belongs_to :delivery_charge
- belongs_to :delivery_date
- belongs_to :order_status
- belongs_to_active_hash :size
- belongs_to :delivery_way
- gemのactive_hashを用いて都道府県を記載する

## item_imageテーブル
|Column|Type|Options|
|------|----|-------|
|image|text|null:false|
|item|reference|null:false, foreign_key:true|

### Association
- belongs_to :item

## ordersテーブル
|Column|Type|Options|
|------|----|-------|
|user|references|null: false, foreign_key: true|
|item|references|null: false, foreign_key: true|
|first_name_delivery|string|null:false|
|first_name_reading_delivery|string|null:false|
|last_name_delivery	|string|null:false|
|last_name_reading_delivery|string|null:false|
|prefecture|reference|foreign_key: true|
|city_delivery|string|null:false|
|adress_delivery|string|null:false|
|building_delivery|string|
|zip_code_delivery|integer|null:false|
|telephone_delivery|integer|
|payment_method|integer|
|user_point|boolean|
|point|integer|

### Association
- belongs_to :user
- belongs_to :item
- has_many :rate_counts

## categoriesテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null:false|
|ancestry|string|null:false|

### Association
- has_many :items

## sizesテーブル
|Column|Type|Options|
|------|----|-------|
|size_category|reference|foreign_key:ture|
|size|string|null:false|

### Association
- belongs_to :size_category
- has_many :items

## sizesテーブル(active_hash)
|Column|Type|Options|
|------|----|-------|
|size|string|null:false

### Association
- has_many :item

## brandsテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|

### Association
- has_many :items

## conditionsテーブル
|Column|Type|Options|
|------|----|-------|
|condition|string|

### Association
- has_many :items

## delivery_chargesテーブル
|Column|Type|Options|
|------|----|-------|
|charge|string|

### Association
- has_many :items

## delivery_datesテーブル
|Column|Type|Options|
|------|----|-------|
|date|string|

### Association
- has_many :items

## delivery_waysテーブル
|Column|Type|Options|
|------|----|-------|
|way|string|

### Association
- has_many :items

## order_statusesテーブル
|Column|Type|Options|
|------|----|-------|
|order_status|string|

### Association
- has_many :items
- has_many :communications

## payment_informationsテーブル
|Column|Type|Options|
|------|----|-------|
|card_number|integer|
|vaild_year|integer|
|valid_month|integer|
|cvc|integer|
|user|reference|foreign_key:ture|

### Association
- belongs_to :user