ActionMailer::Base.delivery_method = :smtp
ActionMailer::Base.smtp_settings = { :address   => "smtp.sendgrid.net",
		                           :port      => 587,
		                           :domain    => "tbf.mx",
								   :user_name => "davidzu",
								   :password => "Mictlan9",
		                           :authentication => :login,
		                           :enable_starttls_auto => true 
}
 