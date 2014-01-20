ENV['RACK_ENV'] = 'test'
require 'sinatra'
require File.expand_path(File.join(File.dirname(__FILE__), '../app'))
require 'test/unit'
require 'rack/test'
require 'mocha/setup'

class MyAppTest < Test::Unit::TestCase
  include Rack::Test::Methods

  def app
    Sinatra::Application
  end

  def setup
  end

  def test_root
    get '/'
    assert_match 'Hello', last_response.body
  end

end
