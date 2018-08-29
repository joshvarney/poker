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
		assert_equal()
end