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
def draw_hands()
	black = ['black:']
	white = ['white:']
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
p draw_hands
