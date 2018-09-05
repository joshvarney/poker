class Draw_hands
	def initialize()
		@cards = []
		@values = ['2', '3', '4', '5', '6', '7', '8', '9', 'T', 'J', 'Q', 'K', 'A']
		@suits = ['C', 'D', 'H', 'S']
		@suits.each do |suit|
			@values.each { |value|
				@cards << value + suit
			}
		end
		@cards
	end
	def card_values()
		@counter = 2
		@value_hash = Hash.new
		@cards.each_with_index do |card, value|
			value = @counter
			@value_hash[card] = value
			if @counter < 14
				@counter += 1
			else
				@counter = 2
			end
		end
		@value_hash			
	end
	def make_hands()
		@black = ['Black:']
		@white = ['White:']
		@hands = []
		@shuffle = @cards.shuffle!
		@counter = 0 
		@shuffle.each_with_index do |deal, index|
			unless @counter < 3	|| @counter > 12
				if index.even? == false
					@black << deal
				else
					@white << deal
				end
			end
			@counter += 1	
		end
		@hands << @black 
		@hands << @white 				
	end
	attr_reader :value_hash
	attr_reader :cards
	attr_reader :hands
end
class Hands_set
	def initialize
		@hand_values = []
		@stuff = Draw_hands.new
		@the_right_one = @stuff.card_values()
		@stuff.make_hands()
		# @check_hands = @stuff.hands
		@check_hands = [["Black:", "8D", "9C", "9H", "9S", "KD"], ["White:", "AC", "TD", "8S", "8H", "8C"]]
	end

	def replace_cards
		@hand_values = @check_hands
		@the_right_one.each do |key, value|
			@counter = 0
			@hand_values[0].each { |stuff|
				if stuff == key
					@hand_values[0][@counter] = value				
				end
				@counter += 1
			}
		end
		@the_right_one.each do |key, value|
			@counter = 0
			@hand_values[1].each { |stuff|
				if stuff == key
					@hand_values[1][@counter] = value				
				end
				@counter += 1
			}
		end
		@hand_values[0][1..5] = @hand_values[0][1..5].sort
		@hand_values[1][1..5] = @hand_values[1][1..5].sort
		@hand_values
	end	
	def card_names
		@card_names = @check_hands
		@count = 0
		@card_names.each do |hand|
			@counter = 0
			hand.each do |card|
				if card == 14
		    		@card_names[@count][@counter] = "Ace"
		    	elsif card == 13
					@card_names[@count][@counter] = "King"
		    	elsif card == 12
		    		@card_names[@count][@counter] = "Queen"
		    	elsif card == 11
		    		@card_names[@count][@counter] = "Jack"
		    	end
		    	@counter += 1
		    end	
		    @count += 1
		end    
		@change_names = @card_names
		@change_names
	end
	attr_reader :stuff
	attr_reader :check_hands
	attr_reader :hand_values
	attr_reader :change_names
end
class Checking_hands
	def initialize	
		p @things = Hands_set.new
		p @check_hand = @things.check_hands
		p @replace_card = @things.replace_cards
		p @card_name = @things.card_names
	end	
	def checking_high_card
		@checking_high_card = @check_hand
		@checking_high_card[0][6] = "#{@card_name[0][5]} High"
		@checking_high_card[1][6] = "#{@card_name[1][5]} High"
		@checking_high_card
		@checking_high_card
	end
	def checking_pair
		@checking_pair = @check_hand
		@counter = 0
		@card_name.each do |hands|
			if hands.last(5).uniq.length == 4
				if hands[5] == hands[4]
					@checking_pair[@counter][6] = "Pair of #{hands[5]}s"
				elsif hands[4] == hands[3]
					@checking_pair[@counter][6] = "Pair of #{hands[4]}s"
				elsif hands[3] == hands[2]
					@checking_pair[@counter][6] = "Pair of #{hands[3]}s"
				elsif hands[2] == hands[1]
					@checking_pair[@counter][6] =	"Pair of #{hands[2]}s"
				end
			end
			@counter += 1
		end
		@checking_pair
	end
	def checking_two_pair
		@checking_two_pair = @check_hand
		@counter = 0
		@card_name.each do |hands|
			if hands[1..5].uniq.length == 3
				if hands[5] == hands[4] && hands[3] == hands[2]
					@checking_two_pair[@counter][6] = "Two pair #{hands[5]}s and #{hands[3]}s"
				elsif hands[1] == hands[2] && hands[3] == hands[4]
					@checking_two_pair[@counter][6] = "Two pair #{hands[4]}s and #{hands[1]}s"	 
				elsif hands[1] == hands[2] && hands[5] == hands[4]
					@checking_two_pair[@counter][6] = "Two pair #{hands[5]}s and #{hands[1]}s"
				end
			end
			@counter += 1
		end
		@checking_two_pair								
	end
	def checking_three
		@checking_three = @check_hand
		@counter = 0
		@replace_card.each do |hands|
			if hands[1..5].uniq.length == 3
				if hands[5] == hands[3]
					@checking_three[@counter][6] = "Three of a kind #{hands[5]}s"
				elsif hands[1] == hands[3]
					@checking_three[@counter][6] = "Three of a kind #{hands[1]}s"
				elsif hands[2] == hands[4]
					@checking_three[@counter][6] = "Three of a kind #{hands[2]}s"
				end
			end
			@counter += 1
		end
		@checking_three
	end
	def checking_straight
		@straight = @replace_card
		p @straight
		@checking_straight = @check_hand
		@check01 = @straight[0][5] - @straight[0][4]
		@check02 = @straight[0][4] - @straight[0][3]
		@check03 = @straight[0][3] - @straight[0][2]
		@check04 = @straight[0][2] - @straight[0][1]
		if @check01 == 1 && @check02 == 1 && @check03 == 1 && @check04 == 1
			@checking_straight[0][6] = "straight"
		end	
		@check11 = @straight[1][5] - @straight[1][4]
		@check12 = @straight[1][4] - @straight[1][3]
		@check13 = @straight[1][3] - @straight[1][2]
		@check14 = @straight[1][2] - @straight[1][1]
		if @check11 == 1 && @check12 == 1 && @check13 == 1 && @check14 == 1
			@checking_straight[1][6] = "straight"
		end
		@checking_straight
	end	
end
 stuff1 = Checking_hands.new
p stuff1.checking_high_card
p stuff1.checking_pair
p stuff1.checking_two_pair
p stuff1.checking_three
p stuff1.checking_straight
p stuff1.replace_cards

# def checking_flush()
# 	checking_flush = check_hands	
# 	suit_check = []
# 	compare_suits = []
# 	matching_suits = ["CCCCC", "DDDDD", "HHHHH", "SSSSS"]
# 		check_hands().each do |hand|
# 			hand.each do |elements|
# 				unless elements == "Black:" || elements == "White:"
# 					suits = elements.split('')
# 					suit_check << suits[1]
# 				end 
# 			end
# 		end
# 	compare_suits << suit_check[0..4].join  
# 	compare_suits << suit_check[5..9].join
# 		compare_suits.each_with_index do |hand, index|
# 			matching_suits.each do |suits|
# 				if hand == suits && index == 0
# 					checking_flush[0][6] = "flush"
# 				elsif hand == suits && index == 1
# 					checking_flush[1][6] = "flush"
# 				end				 	 
# 			end
# 		end
# 	checking_flush	 
# end

# def checking_four()
# 	checking_four = check_hands
# 	four = replace_cards
# 	counter = 0
# 	four.each do |x|
# 		if x[5] == x[4] && x[4] == x[3] && x[3] == x[2] && counter == 0
# 			checking_four[0][6] = "four of a kind"
# 		elsif x[1] == x[2] && x[2] == x[3] && x[3] == x[4] && counter == 0	
# 			checking_four[0][6] = "four of a kind"
# 		elsif x[5] == x[4] && x[4] == x[3] && x[3] == x[2] && counter == 1
# 			checking_four[1][6] = "four of a kind"
# 		elsif x[1] == x[2] && x[2] == x[3] && x[3] == x[4] && counter == 1	
# 			checking_four[1][6] = "four of a kind"
# 		end
# 		counter += 1		
# 	end
# 	checking_four	
# end

# def checking_full_house()
# 	checking_full_house = check_hands
# 	count = 0
# 	card_names.each do |x|
# 		if x.last(5).uniq.length == 2
# 			if x[5] == x[3] || x[1] == x[3]
# 				unless x[5] == x[2] || x[1] == x[4]
# 				    if x[5] == x[3]						
# 						if count == 0
# 							checking_full_house[0][6] = "full house #{x[5]}s and #{x[1]}s"
# 						elsif count == 1
# 							checking_full_house[1][6] = "full house #{x[5]}s and #{x[1]}s"
# 						end
# 					else
# 						if count == 0
# 							checking_full_house[0][6] = "full house #{x[1]}s and #{x[5]}s"
# 						elsif count == 1
# 							checking_full_house[1][6] = "full house #{x[1]}s and #{x[5]}s"
# 						end	
# 					end							
# 				end	
# 			end	
# 		end
# 		count += 1
# 	end
# 	checking_full_house
# end
