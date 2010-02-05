class CreateStudents < ActiveRecord::Migration
  def self.up
    create_table :students do |t|
      t.column:user_id, :integer, :null => false
      t.column:course_id, :integer, :null => false

      t.timestamps
    end
  end

  def self.down
    drop_table :students
  end
end
