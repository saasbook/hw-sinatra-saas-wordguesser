require 'webmock/cucumber'

Before do
  stub_request(:post, "http://watchout4snakes.com/wo4snakes/Random/RandomWord").to_return(:status => 200, :headers => {}, :body => "testword")
end
