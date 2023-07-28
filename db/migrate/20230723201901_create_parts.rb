class CreateParts < ActiveRecord::Migration[7.0]
  def change
    create_table :parts do |t|
      t.references :supplier, null: false, foreign_key: true
      t.string :title
      t.string :description

      t.timestamps
    end
  end
end
