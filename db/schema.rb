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

ActiveRecord::Schema[7.1].define(version: 2025_02_11_171001) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "distritos", force: :cascade do |t|
    t.string "nome"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "estudobiblicos", force: :cascade do |t|
    t.string "nome"
    t.text "descricao"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "estudousers", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "visitabiblico_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_estudousers_on_user_id"
    t.index ["visitabiblico_id"], name: "index_estudousers_on_visitabiblico_id"
  end

  create_table "igrejas", force: :cascade do |t|
    t.string "nome"
    t.bigint "distrito_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["distrito_id"], name: "index_igrejas_on_distrito_id"
  end

  create_table "itemestudobiblicos", force: :cascade do |t|
    t.string "descricao"
    t.bigint "estudobiblico_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["estudobiblico_id"], name: "index_itemestudobiblicos_on_estudobiblico_id"
  end

  create_table "ministroubiblicos", force: :cascade do |t|
    t.string "conteudo"
    t.date "data"
    t.bigint "visitaigreja_id", null: false
    t.bigint "visitabiblico_id", null: false
    t.bigint "estudobiblico_id", null: false
    t.bigint "itemestudobiblico_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["estudobiblico_id"], name: "index_ministroubiblicos_on_estudobiblico_id"
    t.index ["itemestudobiblico_id"], name: "index_ministroubiblicos_on_itemestudobiblico_id"
    t.index ["visitabiblico_id"], name: "index_ministroubiblicos_on_visitabiblico_id"
    t.index ["visitaigreja_id"], name: "index_ministroubiblicos_on_visitaigreja_id"
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

  create_table "visitabiblicos", force: :cascade do |t|
    t.bigint "visitaigreja_id", null: false
    t.bigint "estudobiblico_id", null: false
    t.date "data_inicio"
    t.date "data_fim"
    t.text "descricao"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["estudobiblico_id"], name: "index_visitabiblicos_on_estudobiblico_id"
    t.index ["visitaigreja_id"], name: "index_visitabiblicos_on_visitaigreja_id"
  end

  create_table "visitaigrejas", force: :cascade do |t|
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
    t.text "observacao"
    t.bigint "igreja_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["igreja_id"], name: "index_visitaigrejas_on_igreja_id"
  end

  create_table "visitouigrejas", force: :cascade do |t|
    t.bigint "igreja_id", null: false
    t.bigint "visitaigreja_id", null: false
    t.date "data"
    t.string "descricao"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["igreja_id"], name: "index_visitouigrejas_on_igreja_id"
    t.index ["visitaigreja_id"], name: "index_visitouigrejas_on_visitaigreja_id"
  end

  add_foreign_key "estudousers", "users"
  add_foreign_key "estudousers", "visitabiblicos"
  add_foreign_key "igrejas", "distritos"
  add_foreign_key "itemestudobiblicos", "estudobiblicos"
  add_foreign_key "ministroubiblicos", "estudobiblicos"
  add_foreign_key "ministroubiblicos", "itemestudobiblicos"
  add_foreign_key "ministroubiblicos", "visitabiblicos"
  add_foreign_key "ministroubiblicos", "visitaigrejas"
  add_foreign_key "users", "igrejas"
  add_foreign_key "visitabiblicos", "estudobiblicos"
  add_foreign_key "visitabiblicos", "visitaigrejas"
  add_foreign_key "visitaigrejas", "igrejas"
  add_foreign_key "visitouigrejas", "igrejas"
  add_foreign_key "visitouigrejas", "visitaigrejas"
end
