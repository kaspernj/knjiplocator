class Iplocator
	def request_init
		_session[:locale] = "en_GB" if !_session[:locale]
	end
	
	def header(str)
		return "<h1>#{str}</h1>"
	end
	
	def boxt(str, width = "100%")
		html = "<table style=\"width: #{width}; border: 1px solid black;\">"
		html += "<tr>"
		html += "<td><b>#{str}</b></td>"
		html += "</tr><tr>"
		html += "<td>"
		
		return html
	end
	
	def boxb
		return "</td></tr></table>"
	end
	
	def user
		return false if !_session[:user_id]
		return $ob.get(:User, _session[:user_id])
	end
	
	def require_admin
		_kas.redirect("/?show=users_login") if _session[:user_id].to_i <= 0
	end
end