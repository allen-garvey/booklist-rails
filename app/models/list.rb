class List < ActiveRecord::Base
	validates :name, presence: true
	validates :name, uniqueness: true
	# has_many :books
	def to_s
		self.name
	end
end