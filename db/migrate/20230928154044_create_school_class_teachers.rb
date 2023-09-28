class CreateSchoolClassTeachers < ActiveRecord::Migration[7.0]
  def change
    create_table :school_class_teachers do |t|
      t.references :teacher, null: false, foreign_key: true
      t.references :school_class, null: false, foreign_key: true

      t.timestamps
    end
  end
end
