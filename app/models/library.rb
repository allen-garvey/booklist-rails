class Library < ActiveRecord::Base
	validates :name, presence: true
	validates :name, uniqueness: true
	def to_s
		self.name
	end
end
