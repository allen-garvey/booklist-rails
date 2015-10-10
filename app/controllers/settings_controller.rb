class SettingsController < ApplicationController
	def fields
		@fields = ['Author', 'Book', 'Classification', 'Genre', 'List', 'List_Book', 'Rating']
	end
end
