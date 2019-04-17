
require "polleverywhere"

PollEverywhere.config do
  username  ENV['poll_username']
  password  ENV['poll_password']
  url       "https://www.polleverywhere.com"
end