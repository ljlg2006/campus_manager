class CreateBuildings < ActiveRecord::Migration
  def self.up
    create_table :buildings do |t|
      t.column:code, :string, :null => false
      t.column:name, :string, :null => false
      t.column:description, :text, :null => false

      t.timestamps
    end
  end

  def self.down
    drop_table :buildings
  end
end
