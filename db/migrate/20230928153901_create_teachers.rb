class CreateTeachers < ActiveRecord::Migration[7.0]
  def change
    create_table :teachers do |t|
      t.string :first_name
      t.string :last_name
      t.date :date_of_birth
      t.string :phone_number
      t.string :address_mail
      t.string :specialty

      t.timestamps
    end
  end
end
