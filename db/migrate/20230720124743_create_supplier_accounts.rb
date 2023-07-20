class CreateSupplierAccounts < ActiveRecord::Migration[7.0]
  def change
    create_table :supplier_accounts do |t|
      t.integer :account
      t.references :supplier, null: false, foreign_key: true

      t.timestamps
    end
  end
end
