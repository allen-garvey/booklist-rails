class AddPreRatingToBooks < ActiveRecord::Migration
  def change
    add_column :books, :pre_rating, :integer
  end
end
