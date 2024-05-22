# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.1].define(version: 2024_03_15_014404) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "administrative_units", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "name"
    t.string "initials"
    t.string "code"
    t.uuid "organism_id", null: false
    t.uuid "created_by"
    t.uuid "modified_by"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["organism_id"], name: "index_administrative_units_on_organism_id"
  end

  create_table "catalog_data", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.uuid "catalog_id", null: false
    t.json "tuples"
    t.uuid "created_by"
    t.uuid "modified_by"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["catalog_id"], name: "index_catalog_data_on_catalog_id"
  end

  create_table "catalogs", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.uuid "created_by"
    t.uuid "modified_by"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "data_dictionaries", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "version"
    t.uuid "modification_type_id", null: false
    t.string "description"
    t.uuid "catalog_id", null: false
    t.uuid "created_by"
    t.uuid "modified_by"
    t.boolean "current_version", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["catalog_id"], name: "index_data_dictionaries_on_catalog_id"
    t.index ["modification_type_id"], name: "index_data_dictionaries_on_modification_type_id"
  end

  create_table "data_dictionary_fields", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.uuid "data_dictionary_id", null: false
    t.string "field_name"
    t.uuid "field_type_id", null: false
    t.string "field_description"
    t.uuid "created_by"
    t.uuid "modified_by"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["data_dictionary_id"], name: "index_data_dictionary_fields_on_data_dictionary_id"
    t.index ["field_type_id"], name: "index_data_dictionary_fields_on_field_type_id"
  end

  create_table "field_types", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.uuid "created_by"
    t.uuid "modified_by"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "modification_types", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.uuid "created_by"
    t.uuid "modified_by"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "organisms", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "name"
    t.string "initials"
    t.string "code"
    t.uuid "created_by"
    t.uuid "modified_by"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "administrative_units", "organisms"
  add_foreign_key "catalog_data", "catalogs"
  add_foreign_key "data_dictionaries", "catalogs"
  add_foreign_key "data_dictionaries", "modification_types"
  add_foreign_key "data_dictionary_fields", "data_dictionaries"
  add_foreign_key "data_dictionary_fields", "field_types"
end
