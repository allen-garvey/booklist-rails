class AddOnBookshelfToBooks < ActiveRecord::Migration
  def change
    add_column :books, :on_bookshelf, :boolean
  end
end
