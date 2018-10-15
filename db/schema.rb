# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of Active Record to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20181015112440) do

  create_table "appointments", :force => true do |t|
    t.date     "appointment_date"
    t.integer  "doctor_id"
    t.integer  "patient_id"
    t.integer  "slot_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "is_booked"
  end

  create_table "beds", :force => true do |t|
    t.integer  "bed_number"
    t.boolean  "vacant"
    t.integer  "room_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "departments", :force => true do |t|
    t.string   "name"
    t.string   "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "discharged_patients", :force => true do |t|
    t.date     "admitted_on"
    t.date     "discharged_on"
    t.integer  "patient_id"
    t.integer  "bed_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "doctor_suggested_patients", :force => true do |t|
    t.boolean  "to_be_admitted"
    t.integer  "patient_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "doctor_id"
  end

  create_table "doctors", :force => true do |t|
    t.string   "first_name"
    t.string   "middle_name"
    t.string   "last_name"
    t.date     "date_of_birth"
    t.string   "address"
    t.string   "contact_number"
    t.string   "email"
    t.string   "gender"
    t.string   "qualification"
    t.string   "experience"
    t.string   "encrypted_password"
    t.integer  "department_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "medicalreports", :force => true do |t|
    t.integer  "patient_id"
    t.integer  "doctor_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "record_file_name"
    t.string   "record_content_type"
    t.integer  "record_file_size"
    t.datetime "record_updated_at"
    t.string   "medication"
    t.string   "comments"
  end

  create_table "patient_to_beds", :force => true do |t|
    t.date     "admitted_on"
    t.boolean  "vacated"
    t.integer  "patient_id"
    t.integer  "bed_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "patients", :force => true do |t|
    t.string   "first_name"
    t.string   "middle_name"
    t.string   "last_name"
    t.date     "date_of_birth"
    t.string   "address"
    t.string   "contact_number"
    t.string   "email"
    t.string   "gender"
    t.string   "blood_group"
    t.string   "encrypted_password"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "rooms", :force => true do |t|
    t.integer  "room_number"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "slots", :force => true do |t|
    t.time     "slot_start_time"
    t.time     "slot_end_time"
    t.date     "slot_date"
    t.integer  "doctor_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "is_booked"
  end

  create_table "users", :force => true do |t|
    t.string   "first_name"
    t.string   "middle_name"
    t.string   "last_name"
    t.date     "date_of_birth"
    t.string   "address"
    t.string   "contact_number"
    t.string   "email"
    t.string   "encrypted_password"
    t.string   "gender"
    t.boolean  "is_admin"
    t.integer  "user_determin_id"
    t.string   "user_determin_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
