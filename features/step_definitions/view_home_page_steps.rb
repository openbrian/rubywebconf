Given /^the following view_home_pages:$/ do |view_home_pages|
  ViewHomePage.create!(view_home_pages.hashes)
end

When /^I delete the (\d+)(?:st|nd|rd|th) view_home_page$/ do |pos|
  visit view_home_pages_path
  within("table tr:nth-child(#{pos.to_i+1})") do
    click_link "Destroy"
  end
end

Then /^I should see the following view_home_pages:$/ do |expected_view_home_pages_table|
  expected_view_home_pages_table.diff!(tableish('table tr', 'td,th'))
end
