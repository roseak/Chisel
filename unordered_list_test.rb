gem 'minitest', '~> 5.0'
require 'minitest/autorun'
require 'minitest/pride'
require './unordered_list'

class UnorderedListTest < Minitest::Test
  def test_it_splits_on_the_new_line
    text = UnorderedList.new
    assert_equal ["1. list one", "2. list two"], text.break_into_lines("1. list one\n2. list two")
  end

  def test_it_changes_the_number_to_li_tags
    text = UnorderedList.new
    assert_equal ["<li>subbed out</li>"], text.list_tags(["* subbed out"])
  end

  def test_it_adds_ul_tags_to_ends_of_array
    text = UnorderedList.new
    assert_equal ["<ul>", "<li>list</li>", "<li>list</li>", "</ul>"], text.ul_tags(["<li>list</li>", "<li>list</li>"])
  end

  def test_it_comes_back_together_on_new_line
    text = UnorderedList.new
    assert_equal "text\ntogether\nagain", text.back_together_chunks(["text", "together", "again"])
  end

  def test_it_comes_together_as_a_list_with_tags
    text = UnorderedList.new
    assert_equal "<ul>\n<li>item one</li>\n<li>item two</li>\n</ul>", text.unordered_tags("* item one\n* item two")
  end
end
