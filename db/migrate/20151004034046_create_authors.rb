class CreateAuthors < ActiveRecord::Migration
  def change
    create_table :authors do |t|
      t.string :last
      t.string :first
      t.string :middle

      t.timestamps null: false
    end
  end
end
