class Book < ActiveRecord::Base
	include NormalizeBlankValues
	def self.default_order
		self.order(sort_title: :asc)
	end
	def self.active_ordered(is_active)
		self.where('active = ?', is_active).order(sort_title: :asc)
	end
	def self.bookshelf_books
		self.where(active: true).where(on_bookshelf: true).order(sort_title: :asc)
	end
	def self.pre_rating_min
		1
	end
	def self.pre_rating_max
		100
	end
	def self.default_index_params
		{active: true}
	end

	validates :title, presence: true
	validates :pre_rating, numericality: {allow_blank: true, only_integer: true, less_than_or_equal_to: Book.pre_rating_max, greater_than_or_equal_to: Book.pre_rating_min}
	belongs_to :author
	belongs_to :classification
	belongs_to :genre
	
	has_many :ratings, dependent: :destroy
	
	has_many :list_books, dependent: :destroy
	has_many :lists, through: :list_books
	
	has_many :book_locations, dependent: :destroy
	has_many :locations, through: :book_locations
	
	after_initialize :init
	before_save :update_active
	before_save :update_on_bookshelf
	before_save :update_sort_title
	before_save :check_boolean

	def init
		self.date_added ||= Date.today
		self.sort_title ||= self.calculate_sort_title
		if self.active.nil?
			self.active = true
		end
		if self.on_bookshelf.nil?
			self.on_bookshelf = false
		end
	end
	#required for false boolean to work correctly with postgres for some reason
	def check_boolean
		if self.active.nil?
			self.active = "false"
		end
		if self.on_bookshelf.nil?
			self.on_bookshelf = "false"
		end
	end
	def update_sort_title
		if self.changed.include? 'title'
			self.sort_title = self.calculate_sort_title
		end
	end
	#book can't be on bookshelf if it is not active
	def update_active
		if self.changed.include? 'active' and !self.changed.include? 'on_bookshelf' and !self.active
			self.on_bookshelf = "false" #required for postgres
		end
	end
	#book must be active if it is on bookshelf
	def update_on_bookshelf
		if self.changed.include? 'on_bookshelf' and self.on_bookshelf
			self.active = "true"
		end
	end
	def to_s
		if self.subtitle
			"#{self.title}: #{self.subtitle}"
		else
			self.title
		end
	end
	def active?
		self.active
	end
	def on_bookshelf?
		self.on_bookshelf
	end
	def looking_for?
		self.active? and !self.on_bookshelf?
	end
	def calculate_sort_title
		self.title.gsub /^(the|a|an)\s+/i, ''
	end
end
