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
def card_values
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
def draw_hands
	black = ['Black:']
	white = ['White:']
	hands = []
	shuffle = deck().shuffle!
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
	hands << black 
	hands << white 				
end
def sort_hands(draw_hands)
	p draw_hands
	hand_values = draw_hands
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
p sort_hands(draw_hands)