class ReportingController < ApplicationController
	def index
		@current_year = Time.now.year
		@current_ratings_num = Rating.where('extract(year from date_added) = ?', @current_year).count
		@current_ratings_average = (Rating.where('extract(year from date_added) = ?', @current_year).average(:post_rating) * 100).round / 100.0
		@top_ratings = Rating.where('extract(year from date_added) = ?', @current_year).order(post_rating: :desc, created_at: :desc).take(10)
		@current_ratings_max = @top_ratings.first
		@current_ratings_min = Rating.where('extract(year from date_added) = ?', @current_year).order(:post_rating).first


		#Raw query is: (note will only work on postgres because of generate_series function, 
		# and there may be weird issues if the first week of the year is considered week 53)
		# SELECT week_list.weeks, COALESCE(week_ratings_list.books, 0) 
		# 	FROM (SELECT weeks FROM generate_series(1,53) AS weeks) week_list 
		# 	LEFT JOIN 
		# 		(SELECT extract(week FROM date_added) :: BIGINT AS week, count(*) as books 
		# 			FROM ratings 
		# 			WHERE extract(YEAR FROM date_added) = '2017' 
		# 			GROUP BY week 
		# 			ORDER BY week) AS week_ratings_list 
		# 		ON week_list.weeks = week_ratings_list.week
		# 	LIMIT (SELECT EXTRACT(WEEK FROM current_timestamp));

		books_by_week_query = <<-EOS
			SELECT week_list.weeks, COALESCE(week_ratings_list.books, 0) FROM (SELECT weeks FROM generate_series(1,53) AS weeks) week_list 
				LEFT JOIN 
					(SELECT extract(week FROM date_added) :: BIGINT AS week, count(*) as books 
						FROM ratings 
						WHERE extract(YEAR FROM date_added) = '#{@current_year}' 
						GROUP BY week 
						ORDER BY week) AS week_ratings_list 
					ON week_list.weeks = week_ratings_list.week
				LIMIT (SELECT EXTRACT(WEEK FROM current_timestamp));
		EOS
		@books_by_week = Rating.connection.select_rows(books_by_week_query)
		

		@books_by_week = @books_by_week.map { |e| [e[0], e[1].to_i]  }
		@books_by_week.unshift ['Week', 'Books Read']

	end
end