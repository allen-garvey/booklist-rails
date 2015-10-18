class SettingsController < ApplicationController
	def fields
		@fields = ['Author', 'Book', 'Book_Location', 'Classification', 'Genre', 'Library', 'List', 'List_Book', 'Location', 'Rating']
	end
end
