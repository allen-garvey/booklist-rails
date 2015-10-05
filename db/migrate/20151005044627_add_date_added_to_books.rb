class AddDateAddedToBooks < ActiveRecord::Migration
  def change
    add_column :books, :date_added, :date
  end
end
