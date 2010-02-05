class CreateSemesters < ActiveRecord::Migration
  def self.up
    create_table :semesters do |t|
      t.column:name, :string, :null => false
      t.column:start_date, :date, :null => false
      t.column:end_date, :date, :null => false

      t.timestamps
    end
  end

  def self.down
    drop_table :semesters
  end
end
