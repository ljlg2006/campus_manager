class CreateInstructors < ActiveRecord::Migration
  def self.up
    create_table :instructors do |t|
      t.column:user_id, :integer, :null => false
      t.column:course_id, :integer, :null => false

      t.timestamps
    end
  end

  def self.down
    drop_table :instructors
  end
end
