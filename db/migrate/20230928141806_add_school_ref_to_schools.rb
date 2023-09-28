class AddSchoolRefToSchools < ActiveRecord::Migration[7.0]
  def change
    add_reference :schools, :school, null: true, foreign_key: true
  end
end
