class ReportingController < ApplicationController
	def index
		@current_year = Time.now.year
		@current_ratings_num = Rating.where('extract(year from date_added) = ?', @current_year).count
		@current_ratings_average = (Rating.where('extract(year from date_added) = ?', @current_year).average(:post_rating) * 100).round / 100.0
		@current_ratings_max = Rating.where('extract(year from date_added) = ?', @current_year).order(post_rating: :desc).first
		@current_ratings_min = Rating.where('extract(year from date_added) = ?', @current_year).order(:post_rating).first
	end
end