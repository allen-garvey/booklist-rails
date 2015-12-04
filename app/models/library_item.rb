class LibraryItem < ActiveRecord::Base
  def self.default_order
		self.order(due_date: :asc)
	end
	belongs_to :library
	validates :library_id, presence: true
	validates :due_date, presence: true
	validates :due_date, uniqueness: {scope: :library_id}
	validates :items, numericality: {only_integer: true, greater_than_or_equal_to: 1, allow_nil: true}
	validate :due_date_cannot_be_in_the_past
	def to_s
		"#{self.library} #{DateFormatter.default_format(self.due_date)}"
	end

	def due_date_cannot_be_in_the_past
		if !due_date.blank? and due_date < Date.today
			errors.add(:due_date, "can't be in the past") 
  		end
  	end
end
