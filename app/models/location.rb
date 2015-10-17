class Location < ActiveRecord::Base
  belongs_to :library
  validates :name, presence: true
  validates :library_id, presence: true
  validates :name, uniqueness: {scope: :library_id}
	def to_s
		"#{self.library} - #{self.name}"
	end
end
