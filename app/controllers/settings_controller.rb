class SettingsController < ApplicationController
	def fields
		@fields = [
					'Author', 
					'Book', 
					'Book_Location', 
					'Classification', 
					'Genre', 
					'Library', 
					'Library_Item', 
					'List', 
					'List_Book', 
					'Location', 
					'Rating'
				]
	end
end
