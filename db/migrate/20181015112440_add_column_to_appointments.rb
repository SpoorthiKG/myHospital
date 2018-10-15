class AddColumnToAppointments < ActiveRecord::Migration
  def self.up
    add_column :appointments , :is_booked, :boolean
  end

  def self.down
    remove_column :appointments , :is_booked, :boolean
  end
end
