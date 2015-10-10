class SettingsController < ApplicationController
	def fields
		@fields = ['Book', 'Author', 'Classification']
	end
end
