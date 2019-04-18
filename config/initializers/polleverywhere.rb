
require "polleverywhere"

if Rails.env.development?
	poll_username = Rails.application.secrets.poll_username
	poll_password = Rails.application.secrets.poll_password
end

if Rails.env.production?
	poll_username = ENV['poll_username']
	poll_password = ENV['poll_password']
end

raise "invalid creds" unless poll_username != nil

PollEverywhere.config do
  username  poll_username
  password  poll_password
  url       "https://www.polleverywhere.com"
end