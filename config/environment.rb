# Load the Rails application.
require_relative "application"

# Initialize the Rails application.
Rails.application.initialize!

ActionMailer::Base.smtp_settings = {
    :port       => ENV['MAILGUN_SMTP_PORT'],
    :address    => ENV['MAILGUN_SMTP_SERVER'],
    :user_name  => ENV['MAILGUN_SMTP_LOGIN'],
    :password   => ENV['MAILGUN_SMTP_PASSWORD'],
    :domain     => 'obscure-fortress-44914-2a5f16fdaefe.herokuapp.com',
    :authentication => :plain,
}
ActionMailer::Base.delivery_method = :smtp