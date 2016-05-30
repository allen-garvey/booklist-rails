class ListBook < ActiveRecord::Base
	include DefaultSearchString
	def self.default_order
		self.order(id: :desc)
	end
	belongs_to :book
	belongs_to :list
	validates :book_id, presence: true
	validates :list_id, presence: true
	validates :book_id, uniqueness: {scope: :list_id}
	def to_s
		"#{self.list} #{self.book}"
	end
end
