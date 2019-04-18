
require "polleverywhere"

raise "invalid creds" unless ENV['poll_password'] != nil

PollEverywhere.config do
  username  ENV['poll_username']
  password  ENV['poll_password']
  url       "https://www.polleverywhere.com"
end