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

ActiveRecord::Schema[7.1].define(version: 2025_02_09_164326) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "distritos", force: :cascade do |t|
    t.string "nome"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "igrejas", force: :cascade do |t|
    t.string "nome"
    t.bigint "distrito_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["distrito_id"], name: "index_igrejas_on_distrito_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "nome"
    t.integer "tipo"
    t.string "telefone"
    t.bigint "igreja_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["igreja_id"], name: "index_users_on_igreja_id"
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "visita", force: :cascade do |t|
    t.string "nome"
    t.string "apelido"
    t.string "telefone"
    t.integer "whatsapp_telefone"
    t.string "cep"
    t.string "logradouro"
    t.string "numero"
    t.string "bairro"
    t.string "cidade"
    t.string "estado"
    t.string "latitude"
    t.string "longitude"
    t.bigint "igreja_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["igreja_id"], name: "index_visita_on_igreja_id"
  end

  add_foreign_key "igrejas", "distritos"
  add_foreign_key "users", "igrejas"
  add_foreign_key "visita", "igrejas"
end
