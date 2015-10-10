class SettingsController < ApplicationController
	def fields
		@fields = ['Author', 'Book', 'Classification', 'Genre', 'List', 'Rating']
	end
end
