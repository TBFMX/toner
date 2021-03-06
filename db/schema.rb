# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20150122174224) do

  create_table "brands", force: true do |t|
    t.string   "name"
    t.string   "logo_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "carts", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "cartuchos", force: true do |t|
    t.string   "title"
    t.text     "description"
    t.string   "image_url"
    t.string   "brand"
    t.string   "model"
    t.string   "color"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.decimal  "price_40",        precision: 8, scale: 2
    t.decimal  "price_21",        precision: 8, scale: 2
    t.decimal  "price_10",        precision: 8, scale: 2
    t.string   "clave"
    t.integer  "rendimiento"
    t.string   "impresoras"
    t.string   "precio_original"
    t.decimal  "price"
  end

  create_table "data_files", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "line_items", force: true do |t|
    t.integer  "cartucho_id"
    t.integer  "cart_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "quantity",    default: 1
  end

  add_index "line_items", ["cart_id"], name: "index_line_items_on_cart_id"
  add_index "line_items", ["cartucho_id"], name: "index_line_items_on_cartucho_id"

  create_table "printers", force: true do |t|
    t.string   "brand_name"
    t.string   "model"
    t.string   "brand_model"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "brand_id"
  end

end
