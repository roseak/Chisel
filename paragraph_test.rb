gem 'minitest', '~> 5.0'
require 'minitest/autorun'
require 'minitest/pride'
require './paragraph'

class ParagraphTest < Minitest::Test
  def test_it_puts_on_the_paragraph_tags
    paragraphs = Paragraph.new
    assert_equal "<p>\nThis is a paragraph\n</p>", paragraphs.paragraph_tags("This is a paragraph")
  end
end
