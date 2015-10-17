class Library < ActiveRecord::Base
	include NormalizeBlankValues
	validates :name, presence: true
	validates :name, uniqueness: true
	has_many :locations
	def to_s
		self.name
	end
end
