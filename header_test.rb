gem 'minitest', '~>5.0'
require 'minitest/autorun'
require 'minitest/pride'
require './header'

class HeaderTest < Minitest::Test

  def test_it_puts_on_header_tags
    headers = Header.new
    assert_equal "<h1>This is a header</h1>", headers.header_tags("#This is a header")
  end

  def test_it_puts_the_right_header_number_depending_on_the_hash_number
    headers = Header.new
    assert_equal "<h3>This is a 3 hashed header</h3>", headers.header_tags("###This is a 3 hashed header")
  end

end
