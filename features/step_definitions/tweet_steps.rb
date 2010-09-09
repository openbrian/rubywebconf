Given /^an empty tweet stream$/ do
  Tweet.destroy_all
end

Then /^I should see (\d+) tweets?$/ do |num_tweets|
  page.should have_css('.tweet', :count => num_tweets.to_i)
end

Given /^I have tweeted "([^"]*)"$/ do |body|
  Tweet.create! :body => body
end
