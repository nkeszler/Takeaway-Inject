require 'mail'

module Email

	options = {:address => "smtp.gmail.com",
			   :port => 587,
			   :user_name => ENV["EMAIL"],
			   :password => ENV["PASSWORD"],
			   :authentication => 'plain',
			   :enable_starttls_auto => true}

	Mail.defaults do
		delivery_method :smtp, options
	end

	def create_email
		body_text = "Your order has been placed, and will be delivered by #{Time.now + 60*60}"
		mail = Mail.deliver do
			to 		"nkeszler10@gmail.com"
			from	"nkeszler10@gmail.com"
			subject "TEST"
			body 	body_text
		end
	end

end