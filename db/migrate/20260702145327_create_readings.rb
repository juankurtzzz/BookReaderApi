class CreateReadings < ActiveRecord::Migration[8.1]
  def change
    create_table :readings do |t|
      t.references :book, null: false, foreign_key: true
      t.string :status
      t.integer :current_page
      t.datetime :started_at
      t.datetime :finished_at
      t.integer :rating
      t.text :personal_note

      t.timestamps
    end
  end
end
