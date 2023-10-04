class AddEndOfTimeToSchoolClass < ActiveRecord::Migration[7.0]
  def change
    add_column :school_classes, :beginning_of_time, :time
    add_column :school_classes, :end_of_time, :time
  end
end
