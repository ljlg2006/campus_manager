class CreateCourses < ActiveRecord::Migration
  def self.up
    create_table :courses do |t|
      t.column:room_id, :integer, :null => false
      t.column:semester_id, :integer, :null => false
      t.column:name, :string, :null => false
      t.column:description, :text, :null => false

      t.timestamps
    end
  end

  def self.down
    drop_table :courses
  end
end
