# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20200418054718) do

  create_table "addresses", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "shipping_first_name",         null: false
    t.string   "shipping_first_name_reading", null: false
    t.string   "shipping_last_name",          null: false
    t.string   "shipping_last_name_reading",  null: false
    t.string   "zip_code",                    null: false
    t.string   "prefecture",                  null: false
    t.string   "city",                        null: false
    t.string   "address",                     null: false
    t.string   "building"
    t.string   "shipping_telephone"
    t.integer  "user_id"
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.index ["user_id"], name: "index_addresses_on_user_id", using: :btree
  end

  create_table "brands", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "categories", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name",       null: false
    t.string   "ancestry"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "conditions", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "condition",  null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "delivery_charges", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "charge",     null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "delivery_dates", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "date",       null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "delivery_ways", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "way"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "item_images", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "item_id",    null: false
    t.string   "image",      null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["item_id"], name: "index_item_images_on_item_id", using: :btree
  end

  create_table "items", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "user_id",                                      null: false
    t.integer  "category_id",                                  null: false
    t.integer  "size_id",                                      null: false
    t.integer  "condition_id",                                 null: false
    t.integer  "delivery_charge_id",                           null: false
    t.integer  "delivery_date_id",                             null: false
    t.integer  "delivery_way_id",                              null: false
    t.integer  "order_status_id",                  default: 1
    t.string   "brand_id"
    t.string   "name",                                         null: false
    t.integer  "price",                                        null: false
    t.text     "description",        limit: 65535,             null: false
    t.datetime "created_at",                                   null: false
    t.datetime "updated_at",                                   null: false
    t.index ["user_id"], name: "index_items_on_user_id", using: :btree
  end

  create_table "order_statuses", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "order_status"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "sizes", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "size",       null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "nickname",                                          null: false
    t.string   "first_name",                                        null: false
    t.string   "first_name_reading",                                null: false
    t.string   "last_name",                                         null: false
    t.string   "last_name_reading",                                 null: false
    t.string   "email",                                default: "", null: false
    t.string   "encrypted_password",                   default: "", null: false
    t.string   "telephone",                                         null: false
    t.text     "introduction",           limit: 65535
    t.integer  "birth_year",                                        null: false
    t.integer  "birth_month",                                       null: false
    t.integer  "birth_day",                                         null: false
    t.text     "avatar",                 limit: 65535
    t.integer  "point_amount"
    t.integer  "profit_amount"
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at",                                        null: false
    t.datetime "updated_at",                                        null: false
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

  add_foreign_key "addresses", "users"
  add_foreign_key "item_images", "items"
  add_foreign_key "items", "users"
end
