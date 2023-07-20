class CreateAssemblies < ActiveRecord::Migration[7.0]
  def change
    create_table :assemblies do |t|
      t.string :title
      t.text :description
      t.date :date
      t.string :version

      t.timestamps
    end
  end
end
