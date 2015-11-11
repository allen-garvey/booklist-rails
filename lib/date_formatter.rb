#class to create string format for dates
class DateFormatter
	#takes date object and returns string representation
	def self.default_format(date)
		if date.nil?
			nil
		else
			date.strftime('%m/%d/%Y')
		end
	end
end