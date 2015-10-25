class BookLocation < ActiveRecord::Base
    include NormalizeBlankValues
    def self.default_order
        self.order(id: :desc)
    end
    belongs_to :book
    belongs_to :location
    validates :book_id, presence: true
    validates :location_id, presence: true
    validates :book_id, uniqueness: {scope: :location_id}

    def calculated_call_num
        if self.call_number
  		    self.call_number
        elsif self.book.author
  		    if self.book.author.last
  			   self.book.author.last
  		    else
  			   self.book.author.first
  		    end
        else
  		    nil
        end
    end

    def to_s
        if calculated_call_num
            "#{self.book} #{self.location} - #{calculated_call_num}"
        else
            "#{self.book} #{self.location}"
        end
    end
end
