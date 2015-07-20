gem 'minitest', '~> 5.0'
require 'minitest/autorun'
require 'minitest/pride'
require './parser'

class ParserTest < Minitest::Test
  def test_it_breaks_the_text_into_chunks_based_on_double_line_break
    text = Parser.new
    assert_equal ["Text", "Broken", "On the Double"], text.break_into_chunks("Text\n\nBroken\n\nOn the Double")
  end

  def test_if_hash_creates_header
    text = Parser.new
    assert_equal ["<h1>Header</h1>"], text.parser(["#Header"])
  end

  def test_if_a_star_at_the_front_creates_an_unordered_list
    text = Parser.new
    assert_equal ["<ul>\n<li>list</li>\n</ul>"], text.parser(["* list"])
  end

  def test_if_a_one_at_the_front_creates_an_ordered_list
    text = Parser.new
    assert_equal ["<ol>\n<li>list</li>\n</ol>"], text.parser(["1. list"])
  end

  def test_if_paragraph_tags_are_put_if_other_conditions_arent_met
    text = Parser.new
    assert_equal ["<p>\nparagraph\n</p>"], text.parser(["paragraph"])
  end

  def test_it_comes_back_together_with_double_line_breaks
    text = Parser.new
    assert_equal "Text \n\nput back \n\ntogether.", text.back_together(["Text ", "put back ", "together."])
  end

  def test_it_adds_em_tags
    text = Parser.new
    assert_equal "<p>\nText <em>em</em> tags\n</p>", text.parsed("Text *em* tags")
  end

  def test_it_adds_strong_tags
    text = Parser.new
    assert_equal "<p>\nText <strong>strong</strong> tags\n</p>", text.parsed("Text **strong** tags")
  end

  def test_it_comes_together
    text = Parser.new
    assert_equal "<h1>Head</h1>\n\n<p>\nParagraph <em>em</em> <strong>strong</strong>\n</p>\n\n<ol>\n<li>ordered</li>\n</ol>\n\n<ul>\n<li>unordered</li>\n</ul>", text.parsed("#Head\n\nParagraph *em* **strong**\n\n1. ordered\n\n* unordered")
  end
end
