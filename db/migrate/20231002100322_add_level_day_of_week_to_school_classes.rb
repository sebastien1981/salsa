class AddLevelDayOfWeekToSchoolClasses < ActiveRecord::Migration[7.0]
  def change
    add_column :school_classes, :day_of_week, :string
  end
end
