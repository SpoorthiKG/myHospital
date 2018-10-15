class CreateDoctors < ActiveRecord::Migration
  def self.up
    create_table :doctors do |t|
      t.string :first_name
      t.string :middle_name
      t.string :last_name
      t.date :date_of_birth
      t.string :address
      t.string :contact_number
      t.string :email
      t.string :gender
      t.string :qualification
      t.string :experience
      t.string :encrypted_password
      t.references :department

      t.timestamps
    end
  end

  def self.down
    drop_table :doctors
  end
end
