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

ActiveRecord::Schema[8.1].define(version: 2026_08_05_143650) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "pg_catalog.plpgsql"

  create_table "families", force: :cascade do |t|
    t.string "aikotoba"
    t.datetime "created_at", null: false
    t.string "email"
    t.string "password_digest"
    t.datetime "updated_at", null: false
    t.index ["aikotoba"], name: "index_families_on_aikotoba", unique: true
    t.index ["email"], name: "index_families_on_email", unique: true
  end

  create_table "speakers", force: :cascade do |t|
    t.boolean "active", default: true
    t.datetime "created_at", null: false
    t.bigint "family_id", null: false
    t.string "name"
    t.string "notification_email"
    t.boolean "notifications_enabled", default: true
    t.time "notify_at", default: "2000-01-01 15:00:00", null: false
    t.string "slug"
    t.datetime "updated_at", null: false
    t.index ["family_id"], name: "index_speakers_on_family_id"
    t.index ["slug"], name: "index_speakers_on_slug", unique: true
  end

  add_foreign_key "speakers", "families"
end
