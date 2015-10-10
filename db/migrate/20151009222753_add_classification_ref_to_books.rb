class AddClassificationRefToBooks < ActiveRecord::Migration
  def change
    add_reference :books, :classification, index: true, foreign_key: true
  end
end
