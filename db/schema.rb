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

ActiveRecord::Schema.define(version: 20_210_123_210_204) do
  # These are extensions that must be enabled in order to support this database
  enable_extension 'plpgsql'

  create_table 'items', force: :cascade do |t|
    t.string 'name'
    t.string 'icon'
    t.string 'item_class'
    t.string 'item_subclass'
    t.integer 'sell_price'
    t.string 'quality'
    t.integer 'item_level'
    t.integer 'required_level'
    t.string 'slot'
    t.string 'item_link'
    t.integer 'content_phase'
    t.string 'unique_name'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
  end

  create_table 'tooltip_labels', force: :cascade do |t|
    t.string 'label'
    t.string 'format'
    t.integer 'item_id', null: false
  end
end
