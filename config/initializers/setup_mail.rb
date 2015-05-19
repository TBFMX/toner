ActionMailer::Base.delivery_method = :smtp
ActionMailer::Base.smtp_settings = {
    :address => ENV["SMTP_ADDRESS"],
    :port => 587,
    :domain => "gmail.com",
    :user_name => ENV["SMTP_USER"],
    :password => ENV["SMTP_PASSWORD"],
    :authentication => :plain,
    :enable_starttls_auto => true
}