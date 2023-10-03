class AddRoomNumberToSchoolClasses < ActiveRecord::Migration[7.0]
  def change
    add_column :school_classes, :room_number, :integer
  end
end
