class SettingsController < ApplicationController
	def fields
		@fields = ['Book', 'Author', 'Classification', 'Genre']
	end
end
