module ApplicationHelper
	def titulo_entero(page_title)
		titulo_base = "Tuiter_v2"
		if page_title.empty?
			titulo_base
		else
			"#{titulo_base} | #{page_title}"
		end
	end
end
