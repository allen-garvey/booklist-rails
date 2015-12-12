class Location < ActiveRecord::Base
	def self.default_order
		self.joins(:library).order('libraries.name asc, name asc')
	end
	belongs_to :library
	validates :name, presence: true
	validates :library_id, presence: true
	validates :name, uniqueness: {scope: :library_id}

	has_many :book_locations, dependent: :destroy
	has_many :books, -> {order 'books.title'} ,through: :book_locations
	
	def to_s
		"#{self.library} - #{self.name}"
	end
	def short_name
		self.name
	end
end
