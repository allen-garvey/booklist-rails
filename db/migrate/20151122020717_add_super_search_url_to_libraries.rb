class AddSuperSearchUrlToLibraries < ActiveRecord::Migration
  def change
    add_column :libraries, :super_search_url, :string
  end
end
