class AddReleaseDateToBooks < ActiveRecord::Migration
  def change
    add_column :books, :release_date, :date
  end
end
