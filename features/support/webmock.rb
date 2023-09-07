require 'webmock/cucumber'

Before do
  stub_request(:post, "http://randomword.saasbook.info/RandomWord").to_return(:status => 200, :headers => {}, :body => "testword")
end
