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

ActiveRecord::Schema.define(version: 20201218090915) do

  create_table "carts", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "line_items", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer  "product_id"
    t.integer  "cart_id"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.integer  "quantity",   default: 1
    t.integer  "order_id"
    t.index ["cart_id"], name: "index_line_items_on_cart_id", using: :btree
    t.index ["order_id"], name: "index_line_items_on_order_id", using: :btree
    t.index ["product_id"], name: "index_line_items_on_product_id", using: :btree
  end

  create_table "orders", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string   "name"
    t.text     "address",    limit: 65535
    t.string   "email"
    t.integer  "pay_type"
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  create_table "products", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string   "title"
    t.text     "description", limit: 65535
    t.string   "image_url"
    t.decimal  "price",                     precision: 10
    t.datetime "created_at",                               null: false
    t.datetime "updated_at",                               null: false
  end

  add_foreign_key "line_items", "carts"
  add_foreign_key "line_items", "orders"
  add_foreign_key "line_items", "products"
end
