def deck()
	cards = []
	values = ['2', '3', '4', '5', '6', '7', '8', '9', 'T', 'J', 'Q', 'K', 'A']
	suits = ['C', 'D', 'H', 'S']
	suits.each do |suit|
		values.each { |value|
			cards << value + suit
		}
	end
	cards
end
def card_values()
	counter = 2
	value_hash = Hash.new
	deck().each_with_index do |card, value|
		value = counter
		value_hash[card] = value
		if counter < 14
			counter += 1
		else
			counter = 2
		end
	end
	value_hash			
end
# def draw_hands()
# 	black = ['Black:']
# 	white = ['White:']
# 	hands = []
# 	shuffle = deck().shuffle!
# 	counter = 0 
# 	shuffle.each_with_index do |deal, index|
# 		unless counter < 3	|| counter > 12
# 			if index.even? == false
# 				black << deal
# 			else
# 				white << deal
# 			end
# 		end
# 		counter += 1	
# 	end
# 	hands << black 
# 	hands << white 				
# end
def check_hands()
	# check_hands = draw_hands()
	check_hands = [["Black:", "JD", "JC", "JH", "JS", "7D"], ["White:", "3C", "AD", "AS", "AH", "AC"]]


end	
def replace_cards()
	hand_values = check_hands()
	card_values.each do |key, value|
		counter = 0
		hand_values[0].each { |stuff|
			if stuff == key
				hand_values[0][counter] = value				
			end
			counter += 1
		}
	end
	card_values.each do |key, value|
		counter = 0
		hand_values[1].each { |stuff|
			if stuff == key
				hand_values[1][counter] = value				
			end
			counter += 1
		}
	end
	hand_values[0][1..5] = hand_values[0][1..5].sort
	hand_values[1][1..5] = hand_values[1][1..5].sort
	hand_values
end	
def checking_flush()
	checking_flush = check_hands	
	suit_check = []
	compare_suits = []
	matching_suits = ["CCCCC", "DDDDD", "HHHHH", "SSSSS"]
		check_hands().each do |hand|
			hand.each do |elements|
				unless elements == "Black:" || elements == "White:"
					suits = elements.split('')
					suit_check << suits[1]
				end 
			end
		end
	compare_suits << suit_check[0..4].join  
	compare_suits << suit_check[5..9].join
		compare_suits.each_with_index do |hand, index|
			matching_suits.each do |suits|
				if hand == suits && index == 0
					checking_flush[0][6] = "flush"
				elsif hand == suits && index == 1
					checking_flush[1][6] = "flush"
				end				 	 
			end
		end
	checking_flush	 
end
def checking_straight()
	straight = replace_cards()
	checking_straight = check_hands
	check01 = straight[0][5] - straight[0][4]
	check02 = straight[0][4] - straight[0][3]
	check03 = straight[0][3] - straight[0][2]
	check04 = straight[0][2] - straight[0][1]
	if check01 == 1 && check02 == 1 && check03 == 1 && check04 == 1
		checking_straight[0][6] = "straight"
	end	
	check11 = straight[1][5] - straight[1][4]
	check12 = straight[1][4] - straight[1][3]
	check13 = straight[1][3] - straight[1][2]
	check14 = straight[1][2] - straight[1][1]
	if check11 == 1 && check12 == 1 && check13 == 1 && check14 == 1
		checking_straight[1][6] = "straight"
	end
	checking_straight
end
def checking_four()
	checking_four = check_hands
	four = replace_cards
	counter = 0
	four.each do |x|
		if x[5] == x[4] && x[4] == x[3] && x[3] == x[2] && counter == 0
			checking_four[0][6] = "four of a kind"
		elsif x[1] == x[2] && x[2] == x[3] && x[3] == x[4] && counter == 0	
			checking_four[0][6] = "four of a kind"
		elsif x[5] == x[4] && x[4] == x[3] && x[3] == x[2] && counter == 1
			checking_four[1][6] = "four of a kind"
		elsif x[1] == x[2] && x[2] == x[3] && x[3] == x[4] && counter == 1	
			checking_four[1][6] = "four of a kind"
		end
		counter += 1		
	end
	checking_four	
end
p checking_four