class DropSchoolClassTeachers < ActiveRecord::Migration[7.0]
  def change
    drop_table :school_class_teachers
  end
end
