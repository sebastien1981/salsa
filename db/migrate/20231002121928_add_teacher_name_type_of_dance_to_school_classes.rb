class AddTeacherNameTypeOfDanceToSchoolClasses < ActiveRecord::Migration[7.0]
  def change
    add_column :school_classes, :teacher_name, :string
    add_column :school_classes, :type_of_dance, :string
  end
end
