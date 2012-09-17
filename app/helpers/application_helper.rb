module ApplicationHelper

	def show_notice
		message = ""

		if flash[:notice]
			message = "<div class=\"alert alert-success\">" + flash[:notice] + "</div>"
		end

		return message.html_safe
	end

	def show_error
		message = ""

		if flash[:error]
			message = "<div class=\"alert alert-error\">" + flash[:error] + "</div>"
		end

		return message.html_safe
	end

	def show_errors
		message = ""

		if !flash[:errors].nil? && flash[:errors].length > 0 
			message << "<div class=\"alert alert-error\">"
			flash[:errors].each do |error|
				message << error + "<br />"
			end
			message << "</div>"
		end

		return message.html_safe
	end

end
