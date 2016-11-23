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

ActiveRecord::Schema.define(version: 20161123200946) do

  create_table "comments", force: :cascade do |t|
    t.text     "content"
    t.string   "ancestry"
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
    t.integer  "task_id"
    t.integer  "user_id"
    t.integer  "cached_votes_total", default: 0
    t.integer  "cached_votes_score", default: 0
    t.integer  "cached_votes_up",    default: 0
    t.integer  "cached_votes_down",  default: 0
    t.index ["ancestry"], name: "index_comments_on_ancestry"
    t.index ["cached_votes_down"], name: "index_comments_on_cached_votes_down"
    t.index ["cached_votes_score"], name: "index_comments_on_cached_votes_score"
    t.index ["cached_votes_total"], name: "index_comments_on_cached_votes_total"
    t.index ["cached_votes_up"], name: "index_comments_on_cached_votes_up"
    t.index ["task_id"], name: "index_comments_on_task_id"
    t.index ["user_id"], name: "index_comments_on_user_id"
  end

  create_table "follows", force: :cascade do |t|
    t.string   "followable_type",                 null: false
    t.integer  "followable_id",                   null: false
    t.string   "follower_type",                   null: false
    t.integer  "follower_id",                     null: false
    t.boolean  "blocked",         default: false, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["followable_id", "followable_type"], name: "fk_followables"
    t.index ["follower_id", "follower_type"], name: "fk_follows"
  end

  create_table "groups", force: :cascade do |t|
    t.string   "name"
    t.string   "area"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.text     "description"
    t.string   "picture"
    t.boolean  "private"
  end

  create_table "invitations", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "member_id"
    t.integer  "user_id"
    t.integer  "group_id"
    t.boolean  "checked"
  end

  create_table "members", force: :cascade do |t|
    t.integer  "group_id"
    t.integer  "user_id"
    t.boolean  "admin"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean  "pending"
    t.index ["group_id", "user_id"], name: "index_members_on_group_id_and_user_id", unique: true
    t.index ["group_id"], name: "index_members_on_group_id"
    t.index ["user_id"], name: "index_members_on_user_id"
  end

  create_table "tasks", force: :cascade do |t|
    t.string   "title"
    t.string   "priority"
    t.datetime "deadline"
    t.text     "description"
    t.integer  "group_id"
    t.integer  "user_id"
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
    t.boolean  "active",         default: true
    t.integer  "comments_count", default: 0
    t.index ["group_id"], name: "index_tasks_on_group_id"
    t.index ["user_id"], name: "index_tasks_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.string   "course"
    t.string   "organization"
    t.datetime "created_at",                        null: false
    t.datetime "updated_at",                        null: false
    t.string   "password_digest"
    t.string   "remember_digest"
    t.string   "activation_digest"
    t.boolean  "activated",         default: false
    t.datetime "activated_at"
    t.string   "reset_digest"
    t.datetime "reset_sent_at"
    t.index ["email"], name: "index_users_on_email", unique: true
  end

  create_table "votes", force: :cascade do |t|
    t.string   "votable_type"
    t.integer  "votable_id"
    t.string   "voter_type"
    t.integer  "voter_id"
    t.boolean  "vote_flag"
    t.string   "vote_scope"
    t.integer  "vote_weight"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["votable_id", "votable_type", "vote_scope"], name: "index_votes_on_votable_id_and_votable_type_and_vote_scope"
    t.index ["voter_id", "voter_type", "vote_scope"], name: "index_votes_on_voter_id_and_voter_type_and_vote_scope"
  end

end
