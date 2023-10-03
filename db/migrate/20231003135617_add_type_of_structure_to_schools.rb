class AddTypeOfStructureToSchools < ActiveRecord::Migration[7.0]
  def change
    add_column :schools, :type_of_structure, :string
  end
end
