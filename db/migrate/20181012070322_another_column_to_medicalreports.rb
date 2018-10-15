class AnotherColumnToMedicalreports < ActiveRecord::Migration
  def self.up
    add_column :medicalreports, :comments, :string
  end

  def self.down
    remove_column :medicalreports, :comments, :string
  end
end
