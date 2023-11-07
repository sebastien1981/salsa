class AddIdCreatePlToSchools < ActiveRecord::Migration[7.0]
  def change
    add_column :schools, :idcreatepl, :integer
  end
end
