module ApplicationHelper
	def titulo_entero(page_title)
		titulo_base = "Tuiter Reloaded"
		if page_title.empty?
			titulo_base
		else
			"#{titulo_base} | #{page_title}"
		end
	end
end
