class CreateAccounts < ActiveRecord::Migration[7.0]
  def change
    create_table :accounts do |t|
      t.references :supplier, null: false, foreign_key: true
      t.string :bank
      t.integer :number

      t.timestamps
    end
  end
end