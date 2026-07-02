class CreateBooks < ActiveRecord::Migration[8.1]
  def change
    create_table :books do |t|
      t.string :title
      t.text :description
      t.string :author
      t.integer :pages
      t.string :category
      t.string :status

      t.timestamps
    end
  end
end
