class CreateLibraryItems < ActiveRecord::Migration
  def change
    create_table :library_items do |t|
      t.references :library, index: true, foreign_key: true
      t.date :due_date
      t.integer :items

      t.timestamps null: false
    end
  end
end
