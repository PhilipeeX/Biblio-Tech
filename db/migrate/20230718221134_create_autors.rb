class CreateAutors < ActiveRecord::Migration[7.0]
  def change
    create_table :autors do |t|
      t.string :name
      t.integer :age
      t.string :country

      t.timestamps
    end
  end
end
