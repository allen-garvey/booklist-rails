class Rating < ActiveRecord::Base
	def self.default_order
		self.order(date_added: :desc)
	end
	belongs_to :book
	validates :post_rating, presence: true
	validates :book_id, presence: true
	validates :post_rating, numericality: {only_integer: true, less_than_or_equal_to: Book.pre_rating_max, greater_than_or_equal_to: Book.pre_rating_min}
	
	after_initialize :init
	def init
		self.date_added ||= Date.today
	end
	def to_s
		"#{self.book} #{self.post_rating} #{self.date_added.strftime('%m/%d/%Y')}"
	end
end
