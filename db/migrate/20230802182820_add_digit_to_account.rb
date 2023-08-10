class AddDigitToAccount < ActiveRecord::Migration[7.0]
  def change
    add_column :accounts, :digit, :string
  end
end
