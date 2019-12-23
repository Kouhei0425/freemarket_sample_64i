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

ActiveRecord::Schema.define(version: 20191220063707) do

  create_table "addresses", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "family_name",  null: false
    t.string   "first_name",   null: false
    t.string   "family_kana",  null: false
    t.string   "first_kana",   null: false
    t.string   "post",         null: false
    t.string   "prefecture",   null: false
    t.string   "city",         null: false
    t.string   "address",      null: false
    t.string   "buil",         null: false
    t.integer  "user_id",      null: false
    t.string   "phone_number", null: false
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.index ["user_id"], name: "index_addresses_on_user_id", using: :btree
  end

  create_table "areas", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name",       null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "brands", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name",       null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "buy_addresses", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "post",       null: false
    t.string   "prefecture", null: false
    t.string   "city",       null: false
    t.string   "address",    null: false
    t.string   "buil"
    t.integer  "buy_id",     null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["buy_id"], name: "index_buy_addresses_on_buy_id", using: :btree
  end

  create_table "buy_credits", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "buy_id",      null: false
    t.string   "card_id",     null: false
    t.string   "customer_id", null: false
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["buy_id"], name: "index_buy_credits_on_buy_id", using: :btree
  end

  create_table "buys", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "good_id",    null: false
    t.integer  "user_id",    null: false
    t.integer  "price",      null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["good_id"], name: "index_buys_on_good_id", using: :btree
    t.index ["user_id"], name: "index_buys_on_user_id", using: :btree
  end

  create_table "categories", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name"
    t.integer  "parent_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["parent_id"], name: "index_categories_on_parent_id", using: :btree
  end

  create_table "category_goods", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "category_id", null: false
    t.integer  "good_id",     null: false
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["category_id", "good_id"], name: "index_category_goods_on_category_id_and_good_id", unique: true, using: :btree
    t.index ["category_id"], name: "index_category_goods_on_category_id", using: :btree
    t.index ["good_id"], name: "index_category_goods_on_good_id", using: :btree
  end

  create_table "credits", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "customer_id", null: false
    t.string   "card_id",     null: false
    t.integer  "user_id",     null: false
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["user_id"], name: "index_credits_on_user_id", using: :btree
  end

  create_table "goods", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name",                     null: false
    t.string   "size"
    t.integer  "price",                    null: false
    t.text     "method",     limit: 65535, null: false
    t.text     "ship",       limit: 65535, null: false
    t.text     "status",     limit: 65535, null: false
    t.text     "burden",     limit: 65535, null: false
    t.text     "explain",    limit: 65535, null: false
    t.integer  "user_id",                  null: false
    t.integer  "brand_id"
    t.integer  "area_id",                  null: false
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.index ["area_id"], name: "index_goods_on_area_id", using: :btree
    t.index ["brand_id"], name: "index_goods_on_brand_id", using: :btree
    t.index ["user_id"], name: "index_goods_on_user_id", using: :btree
  end

  create_table "images", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "image",      null: false
    t.integer  "good_id",    null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["good_id"], name: "index_images_on_good_id", using: :btree
  end

  create_table "sns_credentials", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "provider"
    t.string   "uid"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_sns_credentials_on_user_id", using: :btree
  end

  create_table "users", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "nick_name",                           null: false
    t.string   "email",                  default: "", null: false
    t.string   "family_name",                         null: false
    t.string   "first_name",                          null: false
    t.string   "family_kana",                         null: false
    t.string   "first_kana",                          null: false
    t.integer  "birthday_year",                       null: false
    t.integer  "birthday_month",                      null: false
    t.integer  "birthday_date",                       null: false
    t.string   "phone_number",                        null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

  add_foreign_key "addresses", "users"
  add_foreign_key "buy_addresses", "buys"
  add_foreign_key "buy_credits", "buys"
  add_foreign_key "buys", "goods"
  add_foreign_key "buys", "users"
  add_foreign_key "categories", "categories", column: "parent_id"
  add_foreign_key "category_goods", "categories"
  add_foreign_key "category_goods", "goods"
  add_foreign_key "credits", "users"
  add_foreign_key "goods", "areas"
  add_foreign_key "goods", "brands"
  add_foreign_key "goods", "users"
  add_foreign_key "images", "goods"
  add_foreign_key "sns_credentials", "users"
end
