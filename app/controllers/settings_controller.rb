class SettingsController < ApplicationController
	def fields
		@fields = ['Author', 'Book', 'Classification', 'Genre', 'Library', 'List', 'List_Book', 'Rating']
	end
end
