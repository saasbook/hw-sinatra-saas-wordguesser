#require 'simplecov'
#SimpleCov.start

require File.join(File.dirname(__FILE__), '..', 'app.rb')

require 'sinatra'
require 'rack/test'
require 'webmock/rspec'
require 'byebug'

# setup test environment
set :environment, :test
set :run, false
set :raise_errors, true
set :logging, false

use Rack::Session::Cookie

def app
  HangpersonApp.new!
end

def session
  last_request.env['rack.session']
end

# The following lines disable web usage and causes the external API to be stubbed out,
# eliminating randomness to aid in testing
def stub_random_word(word)
  stub_request(:post, 'http://watchout4snakes.com/wo4snakes/Random/RandomWord').to_return(:body => word)
end

WebMock.disable_net_connect!(allow_localhost: true)

RSpec.configure do |config|
  config.include Rack::Test::Methods
  config.before(:each) do
    stub_request(:post, "http://watchout4snakes.com/wo4snakes/Random/RandomWord").to_return(:body => "foobar")
  end
  config.color = true
end
