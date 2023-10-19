class AddNumberRoomToSchools < ActiveRecord::Migration[7.0]
  def change
    add_column :schools, :number_room, :integer
  end
end
