class Author < ActiveRecord::Base
	include NormalizeBlankValues
	def self.default_order
		self.order(last: :asc, first: :asc, middle: :asc)
	end
	validates :first, presence: true
	has_many :books
	def full_name
		name = self.first;
		name = "#{name} #{formatted_middle}" if formatted_middle
		name = "#{name} #{self.last}" if self.last
		name
	end
	def list_name
		name = self.first
		name = "#{self.last}, #{name}" if self.last
		name = "#{name} #{formatted_middle}" if formatted_middle
		name
	end
	def formatted_middle
		unless self.middle
			return self.middle
		end
		if self.middle =~ /^\w$/
			formatted_middle = self.middle + '.'
		else
			formatted_middle = self.middle
		end
	end
	def to_s
		full_name
	end
end
