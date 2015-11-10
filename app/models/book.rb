class Book < ActiveRecord::Base
	include NormalizeBlankValues
	def self.default_order
		self.order(title: :asc)
	end
	def self.pre_rating_min
		1
	end
	def self.pre_rating_max
		100
	end

	validates :title, presence: true
	validates :pre_rating, numericality: {allow_blank: true, only_integer: true, less_than_or_equal_to: Book.pre_rating_max, greater_than_or_equal_to: Book.pre_rating_min}
	belongs_to :author
	belongs_to :classification
	belongs_to :genre
	
	has_many :ratings, dependent: :destroy
	
	has_many :list_books, dependent: :destroy
	has_many :lists, through: :list_books
	
	has_many :book_locations, dependent: :destroy
	has_many :locations, through: :book_locations
	
	after_initialize :init
	before_save :check_active

	def init
		self.date_added ||= Date.today
		if self.active.nil?
			self.active = true
		end
	end
	def check_active
		if self.active.nil?
			self.active = "false" #required for boolean to work correctly with postgres for some reason
		end
	end
	def to_s
		self.title
	end
	def active?
		self.active
	end
end
