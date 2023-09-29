class CreateSchoolClassTypeOfDances < ActiveRecord::Migration[7.0]
  def change
    create_table :school_class_type_of_dances do |t|
      t.references :level, null: false, foreign_key: true
      t.references :type_of_dance, null: false, foreign_key: true

      t.timestamps
    end
  end
end
