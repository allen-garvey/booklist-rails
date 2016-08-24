class ReportingController < ApplicationController
	def index
		@current_year = Time.now.year
		@current_ratings_num = Rating.where('extract(year from date_added) = ?', @current_year).count
		@current_ratings_average = (Rating.where('extract(year from date_added) = ?', @current_year).average(:post_rating) * 100).round / 100.0
		@top_ratings = Rating.where('extract(year from date_added) = ?', @current_year).order(post_rating: :desc, created_at: :desc).take(10)
		@current_ratings_max = @top_ratings.first
		@current_ratings_min = Rating.where('extract(year from date_added) = ?', @current_year).order(:post_rating).first

		@books_by_week = Rating.connection.select_rows("SELECT extract(week FROM date_added) :: BIGINT AS week, count(*) as books FROM ratings WHERE extract(YEAR FROM date_added) = '#{@current_year}' GROUP BY week ORDER BY week")
		@books_by_week = @books_by_week.map { |e| [e[0], e[1].to_i]  }
		@books_by_week.unshift ['Week', 'Books Read']

	end
end