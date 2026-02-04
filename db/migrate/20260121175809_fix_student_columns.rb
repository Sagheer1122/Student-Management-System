class FixStudentColumns < ActiveRecord::Migration[8.1]
  def change
    add_column :students, :student_id, :string
    change_column :students, :enrollment_date, :date
  end
end
