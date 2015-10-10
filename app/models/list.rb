class List < ActiveRecord::Base
	validates :name, presence: true
	validates :name, uniqueness: true
	has_many :list_books, dependent: :destroy
	has_many :books, through: :list_books
	def to_s
		self.name
	end
end