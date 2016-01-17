class HomeController < ApplicationController
	def index
		item_due_soon = LibraryItem.item_due_soon
        if item_due_soon
        	flash[:info] = view_context.link_to "Due back soon: #{item_due_soon}", item_due_soon
    	end
    end
end
