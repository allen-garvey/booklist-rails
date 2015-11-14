class ChangeBooksActiveColumnNull < ActiveRecord::Migration
  def change
  	change_column_null(:books, :active, false, true)
  end
end
