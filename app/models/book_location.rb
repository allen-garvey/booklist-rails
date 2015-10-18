class BookLocation < ActiveRecord::Base
  include NormalizeBlankValues
  belongs_to :book
  belongs_to :location
  validates :book_id, presence: true
  validates :location_id, presence: true
  validates :book_id, uniqueness: {scope: :location_id}

  def to_s
  	"#{self.book} #{self.location}"
  end
end
