class AddAddressToSchools < ActiveRecord::Migration[7.0]
  def change
    add_column :schools, :address, :string
  end
end
