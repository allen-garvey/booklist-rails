class SuperSearch
	def self.url
		"http://search.startpage.dev/"
	end
	def self.query_param_for(item_name)
		item_name.gsub(/\s+/, '+')
	end
	def self.url_for(item_name)
		"#{SuperSearch.url}index.php?q=#{SuperSearch.query_param_for(item_name)}"
	end
	def self.url_for_engine(engine_key, item_name)
		SuperSearch.url + engine_key + '/' + SuperSearch.query_param_for(item_name)
	end
end