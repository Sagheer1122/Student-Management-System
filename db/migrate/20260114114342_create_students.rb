class CreateStudents < ActiveRecord::Migration[8.1]
  def change
    create_table :students do |t|
      t.string :name
      t.string :email
      t.string :class_name
      t.string :roll_number
      t.string :status
      t.string :enrollment_date
      t.timestamps
    end
  end
end
