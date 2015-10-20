class Library < ActiveRecord::Base
	include NormalizeBlankValues
	#the name for the library that will act as the bookshelf
	def self.bookshelf_name
		'Allen'
	end
	validates :name, presence: true
	validates :name, uniqueness: true
	has_many :locations
	def to_s
		self.name
	end
end
