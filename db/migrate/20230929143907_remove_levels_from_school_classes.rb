class RemoveLevelsFromSchoolClasses < ActiveRecord::Migration[7.0]
  def change
    remove_column :school_classes, :levels, :string
  end
end
