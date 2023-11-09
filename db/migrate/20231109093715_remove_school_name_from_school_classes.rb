class RemoveSchoolNameFromSchoolClasses < ActiveRecord::Migration[7.0]
  def change
    remove_column :school_classes, :school_name, :string
  end
end
