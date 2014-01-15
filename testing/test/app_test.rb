require "test/unit"
require_relative "../app"

class AppTest < Test::Unit::TestCase

  def test_something
    assert true
  end

  def test_foo
    app = App.new
    assert_equal "a string", app.foo
  end

end
