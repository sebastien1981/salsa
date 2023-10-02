class DropLevels < ActiveRecord::Migration[7.0]
  def change
    drop_table :levels
  end
end
