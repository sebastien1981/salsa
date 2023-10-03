class DropSchoolTypeOfDances < ActiveRecord::Migration[7.0]
  def change
    drop_table :school_class_type_of_dances
  end
end
