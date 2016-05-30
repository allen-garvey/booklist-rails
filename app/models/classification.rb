class Classification < ActiveRecord::Base
	include DefaultSearchString
	def self.default_order
		self.order(name: :asc)
	end
	validates :name, presence: true
	validates :name, uniqueness: true
	has_many :books
	def to_s
		self.name
	end
end
