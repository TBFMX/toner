class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  include CurrentCart
  before_action :set_cart

	require 'mail'
		Mail.defaults do
		  delivery_method :smtp, { :address   => "smtp.sendgrid.net",
		                           :port      => 587,
		                           :domain    => "tbf.mx",
								   :user_name => "davidzu",
								   :password => "Mictlan9",
		                           :authentication => :login,
		                           :enable_starttls_auto => true }
		end

		# mail = Mail.deliver do
		#   to 'yourRecipient@domain.com'
		#   from 'Your Name <name@domain.com>'
		#   subject 'This is the subject of your email'
		#   text_part do
		#     body 'Hello world in text'
		#   end
		#   html_part do
		#     content_type 'text/html; charset=UTF-8'
		#     body '<b>Hello world in HTML</b>'
		#   end
		# end

end
