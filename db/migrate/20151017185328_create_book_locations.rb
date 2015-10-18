class CreateBookLocations < ActiveRecord::Migration
  def change
    create_table :book_locations do |t|
      t.references :book, index: true, foreign_key: true
      t.references :location, index: true, foreign_key: true
      t.string :call_number

      t.timestamps null: false
    end
  end
end
