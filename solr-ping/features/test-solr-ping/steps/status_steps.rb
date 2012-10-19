require 'nokogiri'

# steps go here!
Then /^the status should show "(.*)"$/ do |status_val|
  xml = Nokogiri::XML(response.body.to_s).slop!
  stat = xml.response.str("[@name='status']").content
  puts stat
  stat.should =~ /#{status_val}/m
end
