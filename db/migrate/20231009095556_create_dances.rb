class CreateDances < ActiveRecord::Migration[7.0]
  def change
    create_table :dances do |t|
      t.string :fullname

      t.timestamps
    end
  end
end
