class RemoveTypeOfDanceFromSchoolClasses < ActiveRecord::Migration[7.0]
  def change
    remove_column :school_classes, :type_of_dance, :string
  end
end
