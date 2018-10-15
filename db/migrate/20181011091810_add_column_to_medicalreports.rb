class AddColumnToMedicalreports < ActiveRecord::Migration
  def self.up
    add_column :medicalreports, :medication , :string
  end

  def self.down
    remove_column :medicalreports, :medication, :string
  end
end
