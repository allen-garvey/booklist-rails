class Book < ActiveRecord::Base
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
	
	after_initialize :init
	def init
		self.date_added ||= Date.today
	end
	def to_s
		self.title
	end
	
end
