Given /^an empty tweet stream$/ do
  Tweet.destroy_all
end

Then /^I should see (\d+) tweets?$/ do |num_tweets|
  tweets = Nokogiri(page.body) / '.tweet'
  tweets.should have(num_tweets.to_i).items
end

Given /^I have tweeted "([^"]*)"$/ do |body|
  Tweet.create! :body => body
end

Given /^(\d+) minutes later I tweeted "([^"]*)"$/ do |num_minutes, body|
  Timecop.travel num_minutes.to_i.from_now
  Tweet.create! :body => body
end

Then /^I should see the following tweets in order:$/ do |table|
  tweets = (Nokogiri(page.body) / '.tweet').map(&:content)
  tweets.should == table.hashes.map {|t| t['tweet'] }
end