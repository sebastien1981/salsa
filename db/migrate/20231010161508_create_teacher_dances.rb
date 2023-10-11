class CreateTeacherDances < ActiveRecord::Migration[7.0]
  def change
    create_table :teacher_dances do |t|
      t.references :teacher, null: false, foreign_key: true
      t.references :dance, null: false, foreign_key: true

      t.timestamps
    end
  end
end
