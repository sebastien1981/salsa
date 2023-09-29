class RemoveHourlyFromSchoolClass < ActiveRecord::Migration[7.0]
  def change
    remove_column :school_classes, :hourly, :string
  end
end
