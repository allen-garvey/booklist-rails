class LibraryItem < ActiveRecord::Base
	include DefaultSearchString
  	def self.default_order
		self.order(due_date: :asc)
	end
	#returns single library item that is due soon or nil
  	def self.item_due_soon
  		due_soon_items = LibraryItem.where("due_date <= ?", Date.today + 3.days).order("due_date ASC").limit(1)
        if !due_soon_items.empty?
        	due_soon_items[0]
        else
        	nil
    	end
  	end

  	def self.default_due_date
  		3.weeks.from_now.strftime("%Y-%m-%d")
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
