class CreateAuthors < ActiveRecord::Migration[7.0]
  def change
    create_table :authors do |t|
      t.string :nome
      t.string :biography
      t.string :nationality
      t.date :birth_date
      t.string :literary_genre
      t.text :bibliography
      t.string :contacts

      t.timestamps
    end
  end
end
