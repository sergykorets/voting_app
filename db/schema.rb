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

ActiveRecord::Schema.define(version: 20160909082315) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"
  enable_extension "unaccent"

  create_table "candidate_participations", force: :cascade do |t|
    t.integer  "candidate_id"
    t.integer  "election_part_id"
    t.text     "description"
    t.text     "visions"
    t.integer  "votes"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "position"
  end

  add_index "candidate_participations", ["candidate_id"], name: "index_candidate_participations_on_candidate_id", using: :btree
  add_index "candidate_participations", ["election_part_id"], name: "index_candidate_participations_on_election_part_id", using: :btree

  create_table "candidates", force: :cascade do |t|
    t.string   "name_firstname"
    t.string   "name_lastname"
    t.string   "address"
    t.integer  "birth_year"
    t.string   "photo_file_name"
    t.string   "photo_content_type"
    t.integer  "photo_file_size"
    t.datetime "photo_updated_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "photo_crop_x"
    t.integer  "photo_crop_y"
    t.integer  "photo_crop_w"
    t.integer  "photo_crop_h"
    t.string   "name_title"
  end

  create_table "election_parts", force: :cascade do |t|
    t.integer  "election_id"
    t.string   "name"
    t.integer  "max_votes_for_candidate"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "election_parts", ["election_id"], name: "index_election_parts_on_election_id", using: :btree

  create_table "elections", force: :cascade do |t|
    t.string   "name"
    t.date     "votable_from"
    t.date     "votable_to"
    t.datetime "invitation_sent_at"
    t.datetime "results_sent_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "content"
  end

  create_table "elections_voters", id: false, force: :cascade do |t|
    t.integer "election_id"
    t.integer "voter_id"
  end

  create_table "notification_receivers", force: :cascade do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "sent_at"
    t.datetime "received_at"
    t.integer  "notification_id"
    t.integer  "user_id"
    t.string   "state"
  end

  create_table "notification_templates", force: :cascade do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "key"
    t.string   "description"
    t.string   "subject"
    t.text     "message"
  end

  create_table "notifications", force: :cascade do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "kind"
    t.string   "subject"
    t.text     "message"
    t.string   "url"
    t.integer  "author_id"
  end

  create_table "queue_classic_jobs", id: :bigserial, force: :cascade do |t|
    t.text     "q_name",                         null: false
    t.text     "method",                         null: false
    t.json     "args",                           null: false
    t.datetime "locked_at"
    t.integer  "locked_by"
    t.datetime "created_at",   default: "now()"
    t.datetime "scheduled_at", default: "now()"
  end

  add_index "queue_classic_jobs", ["q_name", "id"], name: "idx_qc_on_name_only_unlocked", where: "(locked_at IS NULL)", using: :btree
  add_index "queue_classic_jobs", ["scheduled_at", "id"], name: "idx_qc_on_scheduled_at_only_unlocked", where: "(locked_at IS NULL)", using: :btree

  create_table "users", force: :cascade do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "email"
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "locked_at"
    t.string   "name_firstname"
    t.string   "name_lastname"
    t.string   "role"
    t.integer  "person_id"
    t.string   "person_type"
    t.string   "login"
  end

  create_table "voters", force: :cascade do |t|
    t.string "name_firstname"
    t.string "name_lastname"
    t.string "email"
  end

  create_table "votes", force: :cascade do |t|
    t.integer  "voter_id"
    t.integer  "candidate_id"
    t.integer  "election_part_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "votes", ["candidate_id"], name: "index_votes_on_candidate_id", using: :btree
  add_index "votes", ["election_part_id"], name: "index_votes_on_election_part_id", using: :btree
  add_index "votes", ["voter_id"], name: "index_votes_on_voter_id", using: :btree

  add_foreign_key "candidate_participations", "candidates"
  add_foreign_key "candidate_participations", "election_parts"
  add_foreign_key "election_parts", "elections"
  add_foreign_key "votes", "candidates"
  add_foreign_key "votes", "election_parts"
  add_foreign_key "votes", "voters"
end
