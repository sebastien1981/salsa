class DropSchoolClassLevels < ActiveRecord::Migration[7.0]
  def change
    drop_table :school_class_levels
  end
end
