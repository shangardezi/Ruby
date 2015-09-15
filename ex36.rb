# BlackJack v1 - Simple BlackJack game made by Shan Gardezi

card_deck = ['2','3','4','5','6','7','8','9','10','Jack','Queen','King', 'Ace'
            , '2','3','4','5','6','7','8','9','10','Jack','Queen','King', 'Ace'
            , '2','3','4','5','6','7','8','9','10','Jack','Queen','King', 'Ace'
            , '2','3','4','5','6','7','8','9','10','Jack','Queen','King', 'Ace']

card_facevalue = ['2','3','4','5','6','7','8','9']
card_facecard = ['10','Jack','Queen','King']

user_money = 100
user_count = 0
user_turn = false

dealer_turn = false
dealer_count = 0
count_value = 0

$current_card = ""
$ace = false

def rules
	put 'Do you want to read the rules and instructions? (y/n)'
	instructions = $stdin.gets.chomp
		if instructions == 'y' || instructions == 'Y' #Check if user wants to read instructions
			puts '::: RULES & INSTRUCTIONS :::'
			puts 'Goal is to get a higher score than the dealer and win some monies!'
			puts "£100 is on the house, use it wisely!"
			puts "BlackJack (Score of 21) pays 3:2"
			puts 'Dealer hits on 16 and stands on anything above 16'
			puts  "Pressing 'h' asks the dealer to Hit and 's' to Stand"
		else  #User doesn't want to read instructions
		
		end 
end
		
def dealCards 
    if user_money <= 0
    	 put "You've gone bust!"
    else
		put "Dealing cards"
		current_card = card_deck.sample
    	card_deck.delete_at(Array.index(current_card)) #removes chosen card from array (first instance of it)
	end 
end

def isBust(x)
	if x > 21 
		return true
	else 
		return false
end


def start 

       	 
end

def hitOrStand
	put "Your count is: #{user_count} , to HIT type'h' or to STAND type 's' "    
   	 ans = $stdin.gets.chomp
   	 	if ans == "h" 
   	 		puts "You chose to hit. Good luck."
   	 		return true
    	else 
    		puts "You chose to stand. Good luck."
    		return false
    	end 
end

def dealCard(x)
	current_card = card_deck.sample
    card_deck.delete_at(Array.index(current_card)) #removes chosen card from array (first instance of it)
    x += returnCount(current_card)  #Add count of card to user/dealers count
end


def returnCount (x)
	if card_facevalue.include(x)
		return x.to_i
    elsif card_facecard.include(x)
   		return 10
    else 
    	return 11
end

def ace (currentCount) #ace can be 1 or 11
	if  isBust(currentCount+1) && isBust(currentCount+11)
		#end game
	elsif !isBust(currentCount+1) && isBust(currentCount+11)
		return 1 #ace = 3 as 11 is too much
	else 
		#returns two scores 1 or 11
end 
			
	
	
	
	
	
	
	
	
	
		 