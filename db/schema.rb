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

ActiveRecord::Schema.define(version: 2019_03_24_225018) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "hanjas", force: :cascade do |t|
    t.bigint "kor_nuance_id"
    t.string "hanja"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["kor_nuance_id"], name: "index_hanjas_on_kor_nuance_id"
  end

  create_table "kor_antonymes", force: :cascade do |t|
    t.bigint "kor_nuance_id"
    t.string "antonyme"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["kor_nuance_id"], name: "index_kor_antonymes_on_kor_nuance_id"
  end

  create_table "kor_exemples", force: :cascade do |t|
    t.bigint "kor_nuance_id"
    t.text "exemple_cible"
    t.text "exemple_traduction"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["kor_nuance_id"], name: "index_kor_exemples_on_kor_nuance_id"
  end

  create_table "kor_nuances", force: :cascade do |t|
    t.bigint "kor_word_id"
    t.bigint "user_id"
    t.string "nature_francais"
    t.string "nature_cible"
    t.string "traduction"
    t.text "commentaire"
    t.string "remarque"
    t.string "image_url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["kor_word_id"], name: "index_kor_nuances_on_kor_word_id"
    t.index ["user_id"], name: "index_kor_nuances_on_user_id"
  end

  create_table "kor_synonymes", force: :cascade do |t|
    t.bigint "kor_nuance_id"
    t.string "synonyme"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["kor_nuance_id"], name: "index_kor_synonymes_on_kor_nuance_id"
  end

  create_table "kor_words", force: :cascade do |t|
    t.string "word"
    t.integer "click"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "hanjas", "kor_nuances"
  add_foreign_key "kor_antonymes", "kor_nuances"
  add_foreign_key "kor_exemples", "kor_nuances"
  add_foreign_key "kor_nuances", "kor_words"
  add_foreign_key "kor_nuances", "users"
end
