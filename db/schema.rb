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

ActiveRecord::Schema.define(version: 20200520003008) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "adoption_applications", force: :cascade do |t|
    t.string "name"
    t.string "address"
    t.string "city"
    t.string "state"
    t.string "zip"
    t.string "phone_number"
    t.string "description"
  end

  create_table "pet_applications", force: :cascade do |t|
    t.bigint "pet_id"
    t.bigint "adoption_application_id"
    t.string "approval_status", default: "unapproved"
    t.index ["adoption_application_id"], name: "index_pet_applications_on_adoption_application_id"
    t.index ["pet_id"], name: "index_pet_applications_on_pet_id"
  end

  create_table "pets", force: :cascade do |t|
    t.string "image"
    t.string "name"
    t.string "approximate_age"
    t.string "sex"
    t.string "name_of_shelter"
    t.string "description"
    t.bigint "shelter_id"
    t.string "adoption_status", default: "adoptable"
    t.index ["shelter_id"], name: "index_pets_on_shelter_id"
  end

  create_table "shelter_reviews", force: :cascade do |t|
    t.string "title"
    t.string "rating"
    t.string "content"
    t.string "image"
    t.bigint "shelter_id"
    t.index ["shelter_id"], name: "index_shelter_reviews_on_shelter_id"
  end

  create_table "shelters", force: :cascade do |t|
    t.string "name"
    t.string "address"
    t.string "state"
    t.string "city"
    t.string "zip"
  end

  add_foreign_key "pet_applications", "adoption_applications"
  add_foreign_key "pet_applications", "pets"
  add_foreign_key "pets", "shelters"
  add_foreign_key "shelter_reviews", "shelters"
end
