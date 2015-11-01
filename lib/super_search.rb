class SuperSearch
	def self.url_for(item_name)
		"http://localhost/super-search/index.php?q=#{item_name.gsub(/\s+/, '+')}"
	end
end