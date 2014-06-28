module ApplicationHelper

	def flash_alert(msg, type="info")

		html = "<div class='alert alert-#{type} alert-dismissable'>"
    html +=  "<button type=button class=close data-dismiss=alert aria-hidden=true>&times;</button>"
    html +=  msg
    html += "</div>"

    return raw(html)

	end

end
