class CreateSchoolClasses < ActiveRecord::Migration[7.0]
  def change
    create_table :school_classes do |t|
      t.string :type_of_dance
      t.string :level
      t.string :school_name
      t.references :school, null: false, foreign_key: true

      t.timestamps
    end
  end
end
