class HomeController < ApplicationController
	def index
		item_due_soon = LibraryItem.item_due_soon
        if item_due_soon
        	flash[:info] = "Due back soon: #{item_due_soon}"
    	end
    end
end
