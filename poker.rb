class Build_deck
	def initialize()
		@cards = []
		values = ['2', '3', '4', '5', '6', '7', '8', '9', 'T', 'J', 'Q', 'K', 'A']
		suits = ['C', 'D', 'H', 'S']
		suits.each do |suit|
			values.each { |value|
				@cards << value + suit
			}
		end
		@cards
	end
	attr_reader :cards
end
class Card_values	
	def initialize
		deck = Build_deck.new
		counter = 2
		@value_hash = Hash.new
		deck.cards.each_with_index do |card, value|
			value = counter
			@value_hash[card] = value
			if counter < 14
				counter += 1
			else
				counter = 2
			end
		end
		@value_hash		
	end
	attr_reader :value_hash
end	
class Deal_hands	
	def initialize
		cards = Build_deck.new
		cards = cards.cards
		black = ['Black:']
		white = ['White:']
		@hands = []
		shuffle = cards.shuffle!
		counter = 0 
		shuffle.each_with_index do |deal, index|
			unless counter < 3	|| counter > 12
				if index.even? == false
					black << deal
				else
					white << deal
				end
			end
			counter += 1	
		end
		@hands << black 
		@hands << white 				
	end
	attr_accessor :hands
end
class Group
	def initialize
		card_values = Card_values.new
		value_hash = card_values.value_hash
		stuff = Deal_hands.new
		@check_hands = stuff.hands
		 # @check_hands = [["Black:", "KD", "TD", "JD", "QD", "AD"], ["White:", "9S", "9S", "9S", "7S", "7S"]]
		@check_hands[2] = []
		@check_hands[3] = []
		count = 2
		@check_hands[0..1].each do |hand|
			hand[1..5].each { |card| value_hash.each { |key, value| 
				if card == key
					@check_hands[count] << value
				end
				}
			}
			count += 1	 
		end
		@check_hands[2] = @check_hands[2].sort
		@check_hands[3] = @check_hands[3].sort
		@check_hands
		@check_hands[4] = []
		@check_hands[5] = []
		count = 4		
		@check_hands[2..3].each do |hand|
			hand.each do |card|
				if card == 14
		    		@check_hands[count] << "Ace"
		    	elsif card == 13
					@check_hands[count] << "King"
		    	elsif card == 12
		    		@check_hands[count] << "Queen"
		    	elsif card == 11
		    		@check_hands[count] << "Jack"
		    	else
		    		@check_hands[count] << card	
		    	end
		    end	
		    count += 1
		end    
		@check_hands
	end
	attr_accessor :check_hands
end
class Checking_hands
  	def initialize
  		@player_hands = Group.new
   		@hand_group = @player_hands.check_hands
 	  	@hand_group[0][6] = "#{@hand_group[4][4]} High"
 	  	@hand_group[1][6] = "#{@hand_group[5][4]} High"
 	  	checking_pair << @hand_group
 	  	checking_two_pair << @hand_group
 	  	checking_three << @hand_group
 	  	checking_straight << @hand_group
 	  	checking_flush << @hand_group
 	  	checking_full_house << @hand_group
 	end
 	def checking_pair
 		@checking_pair = @hand_group
		counter = 0
		@checking_pair[4..5].each do |hands|
			if hands.uniq.length == 4
				if hands[4] == hands[3]
					@checking_pair[counter][6] = "Pair of #{hands[4]}s"
				elsif hands[3] == hands[2]
					@checking_pair[counter][6] = "Pair of #{hands[3]}s"
				elsif hands[2] == hands[1]
					@checking_pair[counter][6] = "Pair of #{hands[2]}s"
				elsif hands[1] == hands[0]
					@checking_pair[counter][6] = "Pair of #{hands[1]}s"
				end
			end
			counter += 1
		end
		@checking_pair 
	end
	def checking_two_pair
		checking_two_pair = @hand_group
		counter = 0
		checking_two_pair[4..5].each do |hands|
			if hands.uniq.length == 3
				if hands[4] == hands[3] && hands[2] == hands[1]
					checking_two_pair[counter][6] = "Two pair #{hands[4]}s and #{hands[2]}s"
				elsif hands[0] == hands[1] && hands[2] == hands[3]
					checking_two_pair[counter][6] = "Two pair #{hands[3]}s and #{hands[0]}s"	 
				elsif hands[0] == hands[1] && hands[4] == hands[3]
					checking_two_pair[counter][6] = "Two pair #{hands[4]}s and #{hands[0]}s"
				end
			end	
			counter += 1
		end
		checking_two_pair								
	end
	def checking_three
		checking_three = @hand_group
		counter = 0
		checking_three[4..5].each do |hands|
			if hands.uniq.length == 3
				if hands[4] == hands[2]
					checking_three[counter][6] = "Three of a kind #{hands[4]}s"
				elsif hands[0] == hands[2]
					checking_three[counter][6] = "Three of a kind #{hands[0]}s"
				elsif hands[1] == hands[3]
					checking_three[counter][6] = "Three of a kind #{hands[1]}s"
				end
			end
			counter += 1
		end
		checking_three
	end
	def checking_straight
		checking_straight = @hand_group
		counter = 0
		checking_straight[2..3].each do |hand|
			check1 = hand[4] - hand[3]
			check2 = hand[3] - hand[2]
			check3 = hand[2] - hand[1]
			check4 = hand[1] - hand[0]
			if check1 == 1 && check2 == 1 && check3 == 1 && check4 == 1
				checking_straight[counter][6] = "Straight"
			end
			counter += 1
		end		
	end
	def checking_flush
		checking_flush = @hand_group	
		suit_check = []
		compare_suits = []
			checking_flush[0..1].each do |hand|
				hand[1..5].each do |suits|			
					suits = suits.split('')
					suit_check << suits[1]			 
				end
			end
		counter = 0
		compare_suits << suit_check[0..4]		
		compare_suits << suit_check[5..9] 	
		compare_suits.each do |hand|
			if hand.uniq.length == 1 && checking_flush[counter][6] == "Straight"
				if checking_flush[4 + counter][4] == "Ace"
					checking_flush[counter][6] = "Royal Straight Flush"
				else	
					checking_flush[counter][6] = "Straight Flush"
				end	
			elsif hand.uniq.length == 1 && checking_flush[counter][6] != "Straight"
				checking_flush[counter][6] = "Flush"	
			end
			counter += 1
		end
		checking_flush
	end		
	def checking_full_house
		checking_full_house = @hand_group
		count = 0
		checking_full_house[4..5].each do |x|
			if x.uniq.length == 2
				if x[4] == x[2] || x[0] == x[2]
					unless x[4] == x[1] || x[0] == x[3]
					    if x[4] == x[2]								
							checking_full_house[count][6] = "Full House #{x[4]}s and #{x[0]}s"
						else
							checking_full_house[count][6] = "Full House #{x[0]}s and #{x[4]}s"
						end							
					end	
				end	
			end
			count += 1
		end
		checking_full_house
	end
	def checking_four
		checking_four = @hand_group
		counter = 0
		checking_four[4..5].each do |x|
			if x[4] == x[3] && x[3] == x[2] && x[2] == x[1]
				checking_four[counter][6] = "four of a kind #{x[4]}s"
			elsif x[0] == x[1] && x[1] == x[2] && x[2] == x[3]	
				checking_four[counter][6] = "four of a kind #{x[0]}s"
			end
			counter += 1		
		end
		checking_four	
	end
	attr_accessor :hand_group
end
object = Checking_hands.new
p object.hand_group[0]
p object.hand_group[1]