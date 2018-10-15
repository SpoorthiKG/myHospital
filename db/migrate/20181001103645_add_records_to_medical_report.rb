class AddRecordsToMedicalReport < ActiveRecord::Migration
  def self.up
    add_column :medicalreports, :record_file_name,    :string
    add_column :medicalreports, :record_content_type, :string
    add_column :medicalreports, :record_file_size,    :integer
    add_column :medicalreports, :record_updated_at,   :datetime
  end

  def self.down
     remove_column  :medicalreports, :record_file_name
    remove_column  :medicalreports, :record_content_type
    remove_column  :medicalreports, :record_file_size
   remove_column  :medicalreports, :record_updated_at
  end
end
