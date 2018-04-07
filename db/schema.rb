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

ActiveRecord::Schema.define(version: 20180407093405) do

  create_table "client_recruit_relations", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "user_id"
    t.bigint "recruit_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["recruit_id"], name: "index_client_recruit_relations_on_recruit_id"
    t.index ["user_id"], name: "index_client_recruit_relations_on_user_id"
  end

  create_table "fields", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "messages", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "from_id"
    t.bigint "to_id"
    t.string "body"
    t.bigint "recruit_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["from_id"], name: "fk_rails_2bcf7eed31"
    t.index ["recruit_id"], name: "index_messages_on_recruit_id"
    t.index ["to_id"], name: "fk_rails_5eb9eebc29"
  end

  create_table "ranks", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "field_id"
    t.integer "rank"
    t.integer "from_id"
    t.integer "to_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["field_id"], name: "index_ranks_on_field_id"
  end

  create_table "recruits", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "title", null: false
    t.bigint "field_id"
    t.string "detail", null: false
    t.integer "status", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["field_id"], name: "index_recruits_on_field_id"
  end

  create_table "user_fields", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "user_id"
    t.bigint "field_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["field_id"], name: "index_user_fields_on_field_id"
    t.index ["user_id"], name: "index_user_fields_on_user_id"
  end

  create_table "users", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "name", null: false
    t.string "university", null: false
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
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "worker_recruit_relations", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "user_id"
    t.bigint "recruit_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["recruit_id"], name: "index_worker_recruit_relations_on_recruit_id"
    t.index ["user_id"], name: "index_worker_recruit_relations_on_user_id"
  end

  add_foreign_key "client_recruit_relations", "recruits"
  add_foreign_key "client_recruit_relations", "users"
  add_foreign_key "messages", "recruits"
  add_foreign_key "messages", "users", column: "from_id"
  add_foreign_key "messages", "users", column: "to_id"
  add_foreign_key "ranks", "fields"
  add_foreign_key "recruits", "fields"
  add_foreign_key "user_fields", "fields"
  add_foreign_key "user_fields", "users"
  add_foreign_key "worker_recruit_relations", "recruits"
  add_foreign_key "worker_recruit_relations", "users"
end
