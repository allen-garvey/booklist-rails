class Library < ActiveRecord::Base
	def self.default_order
		self.order(name: :asc)
	end
	include NormalizeBlankValues
	#the name for the library that will act as the bookshelf
	def self.bookshelf_name
		'Allen'
	end
	validates :name, presence: true
	validates :name, uniqueness: true
	has_many :locations, -> { order :name }
	def to_s
		self.name
	end
end
