class AddColumnToSlots < ActiveRecord::Migration
  def self.up
    add_column :slots , :is_booked, :boolean
  end

  def self.down
    remove_column :slots , :is_booked, :boolean
  end
end
