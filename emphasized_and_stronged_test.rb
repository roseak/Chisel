gem 'minitest', '~> 5.0'
require 'minitest/autorun'
require 'minitest/pride'
require './emphasized_and_stronged'

class EmphasizedAndStrongedTest < Minitest::Test
  def test_two_stars_lead_to_strong_tags_surrounding_the_starred_phrase
    text = EmphasizedAndStronged.new
    assert_equal "<strong>Strong Phrase</strong>", text.strong_tagger("**Strong Phrase**")
  end

  def test_two_stars_on_each_side_of_a_word_tags_both_sides
    text = EmphasizedAndStronged.new
    assert_equal "<strong>Strong</strong>", text.strong_tagger("**Strong**")
  end

  def test_one_star_doesnt_lead_to_strong_tags
    text = EmphasizedAndStronged.new
    refute_equal "<strong>Shouldn't be Strong</strong>", text.strong_tagger("*Shouldn't be Strong*")
  end

  def test_embedded_one_stars_are_left_alone_with_strong_tags_surrounding
    text = EmphasizedAndStronged.new
    assert_equal "<strong>Strong *not* Emphasized</strong>", text.strong_tagger("**Strong *not* Emphasized**")
  end

  def test_one_star_leads_to_emphasized_tags_surrounding_the_starred_phrase
    text = EmphasizedAndStronged.new
    assert_equal "<em>Emphasized Phrase</em>", text.em_tagger("*Emphasized Phrase*")
  end

  def test_one_star_on_each_side_of_a_word_tags_both_sides
    text = EmphasizedAndStronged.new
    assert_equal "<em>word</em>", text.em_tagger("*word*")
  end

  def test_text_is_back_together_with_em_and_strong_tags
    text = EmphasizedAndStronged.new
    assert_equal "<em>Some</em> words are <strong>strong and others</strong> aren't.", text.em_and_strong_tags("*Some* words are **strong and others** aren't.")
  end
end
