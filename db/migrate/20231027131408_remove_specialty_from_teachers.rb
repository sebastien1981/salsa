class RemoveSpecialtyFromTeachers < ActiveRecord::Migration[7.0]
  def change
    remove_column :teachers, :specialty, :string
  end
end
