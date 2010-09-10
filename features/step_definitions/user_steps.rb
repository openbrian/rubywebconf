Given /^I am logged in as '(\S+)'$/ do |username|
  User.find_or_create_by_name username
  $username = username
end

Given /^'(\S+)' is following '(\S+)'$/ do |follower_name, followee_name|
  follower = User.find_or_create_by_name follower_name
  followee = User.find_or_create_by_name followee_name
  Follow.create! :follower => follower, :followee => followee
end