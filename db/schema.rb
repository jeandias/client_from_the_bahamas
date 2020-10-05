# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20_201_005_115_034) do
  create_table 'additional_clients', force: :cascade do |t|
    t.integer 'invoice_id', null: false
    t.integer 'client_id', null: false
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.index ['client_id'], name: 'index_additional_clients_on_client_id'
    t.index ['invoice_id'], name: 'index_additional_clients_on_invoice_id'
  end

  create_table 'clients', force: :cascade do |t|
    t.integer 'fiscal_id'
    t.string 'name'
    t.string 'email'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
  end

  create_table 'invoices', force: :cascade do |t|
    t.integer 'client_id', null: false
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.index ['client_id'], name: 'index_invoices_on_client_id'
  end

  add_foreign_key 'additional_clients', 'clients'
  add_foreign_key 'additional_clients', 'invoices'
  add_foreign_key 'invoices', 'clients'
end
