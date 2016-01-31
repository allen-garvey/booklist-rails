class Library < ActiveRecord::Base
	def self.default_order
		self.order(name: :asc)
	end
	include NormalizeBlankValues
	validates :name, presence: true
	validates :name, uniqueness: true
	has_many :locations, -> { order :name }
	def to_s
		self.name
	end
end
