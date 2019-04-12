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

ActiveRecord::Schema.define(version: 2019_04_12_084826) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "antonymes", force: :cascade do |t|
    t.bigint "nuance_id"
    t.string "anto"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "order", default: 20
    t.index ["nuance_id"], name: "index_antonymes_on_nuance_id"
  end

  create_table "dictionaries", force: :cascade do |t|
    t.string "lang"
    t.string "welcome"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "exemples", force: :cascade do |t|
    t.bigint "nuance_id"
    t.string "exemple_fr"
    t.string "exemple_cb"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "order", default: 20
    t.index ["nuance_id"], name: "index_exemples_on_nuance_id"
  end

  create_table "listes", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id"
    t.index ["user_id"], name: "index_listes_on_user_id"
  end

  create_table "nuances", force: :cascade do |t|
    t.bigint "word_id"
    t.bigint "user_id"
    t.string "nature_fr"
    t.string "nature_cb"
    t.text "commentaire"
    t.string "remarque"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "order", default: 20
    t.index ["user_id"], name: "index_nuances_on_user_id"
    t.index ["word_id"], name: "index_nuances_on_word_id"
  end

  create_table "registres", force: :cascade do |t|
    t.bigint "nuance_id"
    t.string "reg"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "order", default: 20
    t.index ["nuance_id"], name: "index_registres_on_nuance_id"
  end

  create_table "selections", force: :cascade do |t|
    t.bigint "nuance_id"
    t.bigint "liste_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["liste_id"], name: "index_selections_on_liste_id"
    t.index ["nuance_id"], name: "index_selections_on_nuance_id"
  end

  create_table "specials", force: :cascade do |t|
    t.bigint "nuance_id"
    t.string "char"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "order", default: 20
    t.index ["nuance_id"], name: "index_specials_on_nuance_id"
  end

  create_table "synonymes", force: :cascade do |t|
    t.bigint "nuance_id"
    t.string "syno"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "order", default: 20
    t.index ["nuance_id"], name: "index_synonymes_on_nuance_id"
  end

  create_table "traductions", force: :cascade do |t|
    t.bigint "nuance_id"
    t.string "trad"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "order", default: 20
    t.index ["nuance_id"], name: "index_traductions_on_nuance_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "status"
    t.string "provider"
    t.string "uid"
    t.string "facebook_picture_url"
    t.string "first_name"
    t.string "last_name"
    t.string "token"
    t.datetime "token_expiry"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "variantes", force: :cascade do |t|
    t.bigint "nuance_id"
    t.string "var"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "order", default: 20
    t.index ["nuance_id"], name: "index_variantes_on_nuance_id"
  end

  create_table "words", force: :cascade do |t|
    t.string "word"
    t.integer "click", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "dictionary_id"
    t.index ["dictionary_id"], name: "index_words_on_dictionary_id"
  end

  add_foreign_key "antonymes", "nuances"
  add_foreign_key "exemples", "nuances"
  add_foreign_key "listes", "users"
  add_foreign_key "nuances", "users"
  add_foreign_key "nuances", "words"
  add_foreign_key "registres", "nuances"
  add_foreign_key "selections", "listes"
  add_foreign_key "selections", "nuances"
  add_foreign_key "specials", "nuances"
  add_foreign_key "synonymes", "nuances"
  add_foreign_key "traductions", "nuances"
  add_foreign_key "variantes", "nuances"
  add_foreign_key "words", "dictionaries"
end
