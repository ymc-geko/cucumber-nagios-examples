Then /^the page should contain "(.*)"$/ do |text|
  #puts current_url.to_s
  puts response.body.to_s
  response.body.to_s.should =~ /#{text}/m
end

Given /^I navigate to dfs path "(.*)" on "(.*)"$/ do |dir,server|
  link="http://"+server+"/browseDirectory.jsp?dir="+dir
  visit link
end
