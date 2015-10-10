class CreateListBooks < ActiveRecord::Migration
  def change
    create_table :list_books do |t|
      t.references :book, index: true, foreign_key: true
      t.references :list, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
