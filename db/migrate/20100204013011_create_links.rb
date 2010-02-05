class CreateLinks < ActiveRecord::Migration
  def self.up
    create_table :links do |t|
      t.column:course_id, :integer, :null => false
      t.column:name, :string, :null => false
      t.column:url, :string, :null => false

      t.timestamps
    end
  end

  def self.down
    drop_table :links
  end
end
