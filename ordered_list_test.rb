gem 'minitest', '~> 5.0'
require 'minitest/autorun'
require 'minitest/pride'
require './ordered_list'

class OrderedListTest < Minitest::Test
  def test_it_splits_on_the_new_line
    text = OrderedList.new
    assert_equal ["1. list one", "2. list two"], text.break_into_lines("1. list one\n2. list two")
  end

  def test_it_changes_the_number_to_li_tags
    text = OrderedList.new
    assert_equal ["<li>subbed out</li>"], text.list_tags(["1. subbed out"])
  end

  def test_it_adds_ol_tags_to_ends_of_array
    text = OrderedList.new
    assert_equal ["<ol>", "<li>list</li>", "<li>list</li>", "</ol>"], text.ol_tags(["<li>list</li>", "<li>list</li>"])
  end

  def test_it_comes_back_together_on_new_line
    text = OrderedList.new
    assert_equal "text\ntogether\nagain", text.back_together_chunks(["text", "together", "again"])
  end 

  def test_it_comes_together_as_a_list_with_tags
    text = OrderedList.new
    assert_equal "<ol>\n<li>item one</li>\n<li>item two</li>\n</ol>", text.ordered_tags("1. item one\n2. item two")
  end
end
