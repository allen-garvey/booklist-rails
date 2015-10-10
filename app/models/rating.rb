class Rating < ActiveRecord::Base
  belongs_to :book
  validates :post_rating, presence: true
  validate :book_id, presence: true
  validates :post_rating, numericality: {only_integer: true, less_than_or_equal_to: Book.pre_rating_max, greater_than_or_equal_to: Book.pre_rating_min}
end
