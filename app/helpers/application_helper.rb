module ApplicationHelper
	def currentPage(path)
	  "current" if current_page?(path)
	end
end
