class CreateRooms < ActiveRecord::Migration
  def self.up
    create_table :rooms do |t|
      t.column:building_id, :integer, :null => false
      t.column:name, :string, :null => false
      t.column:description, :text, :null => false

      t.timestamps
    end
  end

  def self.down
    drop_table :rooms
  end
end
