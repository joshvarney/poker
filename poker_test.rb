require 'minitest/autorun'
require_relative 'poker.rb'
class Poker_test < Minitest::Test

	# def test_deck_returns_array
	# 	assert_equal(Array, deck().class)
	# end
	# def test_that_do_loop_combines_correctly
	# 	assert_equal('2C', deck()[0])
	# end
	# def test_that_deck_contains_correct_amount
	# 	assert_equal(52, deck().count)
	# end
	# def test_that_do_loop_keeps_working
	# 	assert_equal('2D', deck()[13])
	# end
	# def test_that_draw_hands_returns_array
	# 	assert_equal(Array, draw_hands().class)
	# end
	# def test_that_shuffle_works
	# 	refute_equal('2C', draw_hands()[0])
	# end
	# def test_that_dealing_cards_works
	# 	assert_equal(6, draw_hands()[0].count)
	# end
	# def test_that_players_line_up_right
	# 	assert_equal('Black:', draw_hands()[0][0])
	# end
	# def test_that_players_line_up_right
	# 	assert_equal('White:', draw_hands()[1][0])
	# end
	# def test_that_card_values_is_a_hash
	# 	assert_equal(Hash, card_values().class)
	# end
	# def test_that_card_value_has_the_right_amount
	# 	assert_equal(52, card_values().count)
	# end
	# def test_that_values_are_lining_up_correct
	# 	assert_equal(2, card_values()["2D"])
	# end
	# def test_that_values_continue_lining_up
	# 	assert_equal(14, card_values()["AS"])
	# end
	# def test_that_can_put_suits_in_string_to_compare
	# 	assert_equal(2, checking_flush().count)
	# end
	# def test_that_checking_flush_array_does_not_conain_player_name
	# 	assert_equal(false, checking_flush().include?("Black:"))
	# end
	# def test_that_adds_flush_into_array_correctly
	# 	assert_equal([["Black:", "2H", "5H", "KH", "9H", "TH", "flush"], ["White:", "3H", "QS", "JH", "TD", "7C"]], checking_flush())
	# end
	# def test_that_adds_flush_to_white
	# 	assert_equal([["Black:", "2D", "5H", "KS", "9C", "TH"], ["White:", "3S", "QS", "JS", "TS", "7S", "flush"]],checking_flush())
	# end
	# def test_that_adds_flush_to_both_players
	# 	assert_equal([["Black:", "2D", "5D", "KD", "9D", "TD", "flush"], ["White:", "3C", "QC", "JC", "TC", "7C", "flush"]], checking_flush())	
	# end
	# def test_that_can_replace_card_with_the_value_and_add_straight_to_black
	# 	assert_equal([["Black:", "QD", "JD", "KD", "9D", "TD", "straight"], ["White:", "3C", "QC", "JC", "TC", "7C"]], checking_straight())
	# end
	# def test_that_can_replace_card_with_the_value_and_add_straight_to_white
	# 	assert_equal([["Black:", "2D", "5D", "KD", "9D", "TD"], ["White:", "3C", "5C", "6C", "4C", "2C", "straight"]], checking_straight())
	# end
	# def test_that_can_add_straight_to_both_players
	# 	assert_equal([["Black:", "6D", "5D", "8D", "9D", "7D", "straight"], ["White:", "3C", "5C", "6C", "4C", "2C", "straight"]], checking_straight())		
	# end
	# def test_that_four_of_a_kind_works_for_black
	# 	assert_equal([["Black:", "6D", "6C", "6H", "6S", "7D", "four of a kind"], ["White:", "3C", "5C", "6C", "4C", "2C"]], checking_four())
	# end
	# def test_that_four_works_for_white
	# 	assert_equal([["Black:", "6D", "6C", "6H", "7S", "7D"], ["White:", "3C", "5D", "5S", "5H", "5C", "four of a kind"]], checking_four())
	# end
	# def test_that_four_works_for_both
	# 	assert_equal([["Black:", "JD", "JC", "JH", "JS", "7D", "four of a kind"], ["White:", "3C", "AD", "AS", "AH", "AC", "four of a kind"]], checking_four())
	# end
	# def test_that_check_full_house_uniq_length_works
	# 	assert_equal([["Black:", "JD", "JC", "JH", "7S", "7D", "full house"], ["White:", "3C", "AD", "AS", "AH", "AC"]], checking_full_house())
	# end
	# def test_that_check_full_house_works_with_white
	# 	assert_equal([["Black:", "JD", "7C", "7H", "7S", "7D"], ["White:", "3C", "AD", "AS", "3H", "AC", "full house"]], checking_full_house())
	# end
	# def test_that_check_full_house_works_with_black
	# 	assert_equal([["Black:", "JD", "JC", "7H", "7S", "7D", "full house"], ["White:", "3C", "AD", "JS", "KH", "7C"]], checking_full_house())
	# end
	# def test_that_check_full_house_works_with_both
	# 	assert_equal([["Black:", "JD", "JC", "9H", "9S", "9D", "full house"], ["White:", "AC", "AD", "AS", "8H", "8C", "full house"]], checking_full_house())
	# end
	# def test_that_three_of_a_kind_works
	# 	assert_equal([["Black:", "JD", "KC", "9H", "9S", "9D", "Three of a kind 9s"], ["White:", "AC", "AD", "AS", "8H", "8C"]], checking_three())		
	# end
	# def test_that_three_of_a_kind_works2
	# 	assert_equal([["Black:", "8D", "9C", "9H", "9S", "KD", "Three of a kind 9s"], ["White:", "AC", "TD", "8S", "8H", "8C", "Three of a kind 8s"]], checking_three())	
	# end
end