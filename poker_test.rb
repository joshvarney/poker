require 'minitest/autorun'
require_relative 'poker.rb'
class Poker_test < Minitest::Test

	def test_deck_returns_array
		assert_equal(Array, deck().class)
	end
	def test_that_do_loop_combines_correctly
		assert_equal('2C', deck()[0])
	end
	def test_that_deck_contains_correct_amount
		assert_equal(52, deck().count)
	end
	def test_that_do_loop_keeps_working
		assert_equal('2D', deck()[13])
	end
	def test_that_draw_hands_returns_array
		assert_equal(Array, draw_hands().class)
	end
	def test_that_shuffle_works
		refute_equal('2C', draw_hands()[0])
	end
	def test_that_dealing_cards_works
		assert_equal(6, draw_hands()[0].count)
	end
	def test_that_players_line_up_right
		assert_equal('Black:', draw_hands()[0][0])
	end
	def test_that_players_line_up_right
		assert_equal('White:', draw_hands()[1][0])
	end
	def test_that_card_values_is_a_hash
		assert_equal(Hash, card_values().class)
	end
	def test_that_card_value_has_the_right_amount
		assert_equal(52, card_values().count)
	end
	def test_that_values_are_lining_up_correct
		assert_equal(2, card_values()["2D"])
	end
	def test_that_values_continue_lining_up
		assert_equal(14, card_values()["AS"])
	end
	# def test_that_can_put_suits_in_string_to_compare
	# 	assert_equal(String, straight_flush().class)
	# end
end