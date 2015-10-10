class CreateRatings < ActiveRecord::Migration
  def change
    create_table :ratings do |t|
      t.integer :post_rating
      t.references :book, index: true, foreign_key: true
      t.date :date_added

      t.timestamps null: false
    end
  end
end
