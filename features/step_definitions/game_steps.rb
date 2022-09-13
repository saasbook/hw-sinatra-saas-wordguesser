require 'uri'
require 'cgi'
require File.expand_path(File.join(File.dirname(__FILE__), "..", "support", "paths"))

def filtered_page(selector)
  selector ? page.find(selector): page
end

When /^I start a new game with word "(.*)"$/ do |word|
  stub_request(:post, "http://randomword.saasbook.info/RandomWord").
    to_return(:status => 200, :headers => {}, :body => word)
  visit '/new'
  click_button "New Game"
end

When /^I guess "(.*)"(?: again)?$/ do |letter|
  letter.downcase!
  fill_in("guess", :with => letter)
  click_button("Guess!")
end

When /^I make the following guesses:(.*)$/ do |guesses|
  guesses = guesses.gsub(' ', '').split(',')
  guesses.each do |letter|
    fill_in("guess", :with => letter)
    click_button("Guess!")
  end
end

Then /^the server should(.not)? respond with status (\d+)$/ do |see, status|
  if see and see.strip == 'not'
    page.status_code.should_not eql(status.to_i)
  else
    page.status_code.should eql(status.to_i)
  end
end

Then /^the word should read "(.*)"$/ do |word|
  expect(page.find('span.word').text).to eql(word)
end

Then /^the wrong guesses should include:(.*)$/ do |guesses|
  guesses = guesses.gsub(' ', '').split(',')
  guesses.each do |guess|
    expect(page.find('span.guesses')).to have_text(guess)
  end
end

When /^I guess "(.*)" (.*) times in a row$/ do |letter, num|
  letter.downcase!
  num.to_i.times do
    fill_in("guess", :with => letter)
    click_button("Guess!")
  end
end

When /^I try to go to the URL "(.*)"$/ do |url|
  visit url
end

Given /^(?:|I )am on (.+)$/ do |page_name|
  visit path_to(page_name)
end

Then /^(?:|I )should be on (.+)$/ do |page_name|
  current_path = URI.parse(current_url).path
  expect(current_path).to eql(path_to(page_name))
end

Then /^(?:|I )should see "([^\"]*)"(?: within "([^\"]*)")?$/ do |text, selector|
  expect(filtered_page(selector)).to have_text(text)
end

When /^(?:|I )press "([^\"]*)"(?: within "([^\"]*)")?$/ do |button, selector|
  filtered_page(selector).click_button(button)
end
