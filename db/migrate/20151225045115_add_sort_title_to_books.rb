class AddSortTitleToBooks < ActiveRecord::Migration
  def change
    add_column :books, :sort_title, :string
  end
end
