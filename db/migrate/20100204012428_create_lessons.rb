class CreateLessons < ActiveRecord::Migration
  def self.up
    create_table :lessons do |t|
      t.column:course_id, :integer, :null => false
      t.column:name, :string, :null => false
      t.column:description, :text, :null => false

      t.timestamps
    end
  end

  def self.down
    drop_table :lessons
  end
end
