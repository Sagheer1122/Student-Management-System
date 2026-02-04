class AddStudentIdToStudents < ActiveRecord::Migration[8.1]
  def change
    add_column :students, :student_id, :string unless column_exists?(:students, :student_id)
  end
end
