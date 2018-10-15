class CreateUsers < ActiveRecord::Migration
  def self.up
    create_table :users do |t|
      t.string :first_name
      t.string :middle_name
      t.string :last_name
      t.date :date_of_birth
      t.string :address
      t.string :contact_number
      t.string :email
      t.string :encrypted_password
      t.string :gender
      t.boolean :is_admin
      t.integer :user_determin_id
      t.string :user_determin_type
      t.references :user_determin
      t.timestamps
    end
  end

  def self.down
    drop_table :users
  end
end
