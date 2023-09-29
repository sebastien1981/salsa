class CreateSchoolClassLevels < ActiveRecord::Migration[7.0]
  def change
    create_table :school_class_levels do |t|
      t.references :level, null: false, foreign_key: true
      t.references :school_class, null: false, foreign_key: true

      t.timestamps
    end
  end
end
