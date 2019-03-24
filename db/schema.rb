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

ActiveRecord::Schema.define(version: 2019_03_24_124039) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "antonymes_kor", force: :cascade do |t|
    t.bigint "nuance_id"
    t.string "antonym"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["nuance_id"], name: "index_antonymes_kor_on_nuance_id"
  end

  create_table "exemples_kor", force: :cascade do |t|
    t.bigint "nuance_id"
    t.text "exemple_cible"
    t.text "exemple_traduction"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["nuance_id"], name: "index_exemples_kor_on_nuance_id"
  end

  create_table "hanjas", force: :cascade do |t|
    t.bigint "nuance_id"
    t.string "hanja"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["nuance_id"], name: "index_hanjas_on_nuance_id"
  end

  create_table "nuances_kor", force: :cascade do |t|
    t.bigint "word_id"
    t.bigint "user_id"
    t.string "nature_francais"
    t.string "nature_cible"
    t.string "traduction"
    t.text "commentaire"
    t.string "remarque"
    t.string "image_url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_nuances_kor_on_user_id"
    t.index ["word_id"], name: "index_nuances_kor_on_word_id"
  end

  create_table "synonymes_kor", force: :cascade do |t|
    t.bigint "nuance_id"
    t.string "synonyme"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["nuance_id"], name: "index_synonymes_kor_on_nuance_id"
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

  create_table "words_kor", force: :cascade do |t|
    t.string "word"
    t.integer "click"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "antonymes_kor", "nuances_kor", column: "nuance_id"
  add_foreign_key "exemples_kor", "nuances_kor", column: "nuance_id"
  add_foreign_key "hanjas", "nuances_kor", column: "nuance_id"
  add_foreign_key "nuances_kor", "users"
  add_foreign_key "nuances_kor", "words_kor", column: "word_id"
end
