# README

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

# DB設計

## users テーブル
|Column|Type|Options|
|------|----|-------|
|nickname|string|null:false|
|first_name|string|null:false|
|first_name_kana|string|null:false|
|last_name|string|null:false|
|last_name_kana|string|null:false|
|email|string|null:false,unique|

### Association
- has_many :items
- has_many :orders

## itemsテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|reference|null:false,foreign_key:ture|
|name|string|null:false|
|price|integer|null:false|
|description|text|null:false|

### Association
- has_many :item_images
- belongs_to :order
- belongs_to :user

## item_imageテーブル
|Column|Type|Options|
|------|----|-------|
|image|text|null:false|
|item_id|reference|null:false, foreign_key:true|

### Association
- belongs_to :item

## ordersテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|references|null: false, foreign_key: true|
|item_id|references|null: false, foreign_key: true|

### Association
- belongs_to :user
- belongs_to :item