class RenameColumnOfMedicalreports < ActiveRecord::Migration
  def self.up
    rename_column :medicalreports, :records_file_name, :record_file_name
  end

  def self.down
    rename_column :medicalreports, :record_file_name, :records_file_name
  end
end
