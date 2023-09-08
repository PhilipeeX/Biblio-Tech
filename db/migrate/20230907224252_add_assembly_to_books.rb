class AddAssemblyToBooks < ActiveRecord::Migration[7.0]
  def change
    add_reference :books, :assembly, null: false, foreign_key: true
  end
end
