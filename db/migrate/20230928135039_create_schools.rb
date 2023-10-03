class CreateSchools < ActiveRecord::Migration[7.0]
  def change
    create_table :schools do |t|
      t.string :name
      t.string :approval_number
      t.string :phone_number
      t.string :address_mail_pdt
      t.string :phone_number_pdt

      t.timestamps
    end
  end
end
