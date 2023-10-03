class AddTeacherNameTypeOfDanceToSchoolClasses < ActiveRecord::Migration[7.0]
  def change
    add_column :school_classes, :teacher_name, :string
  end
end
