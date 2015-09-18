# BlackJack v1 - Simple BlackJack game made by Shan Gardezi

$card_deck = ['2','3','4','5','6','7','8','9','10','Jack','Queen','King', 'Ace' ,'2','3','4','5','6','7','8','9','10','Jack','Queen','King', 'Ace','2','3','4','5','6','7','8','9','10','Jack','Queen','King', 'Ace' , '2','3','4','5','6','7','8','9','10','Jack','Queen','King', 'Ace']

$card_facevalue = ['2','3','4','5','6','7','8','9']
$card_facecard = ['10','Jack','Queen','King']

$user_money = 100
$user_count = 0
$user_turn = false

$dealer_turn = false
$dealer_count = 0
$dealer_stand = false
$dealer_bust = false
$count_value = 0

$current_card = ""
$ace = false
$two_counts = false

def rules()
	puts 'Do you want to read the rules and instructions? (y/n)'
	instructions = $stdin.gets.chomp
		if instructions == 'y' || instructions == 'Y' #Check if user wants to read instructions
			checkmark = "\u1f0ax"
			puts checkmark.force_encoding('utf-8') 
			puts '::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::'
			puts '::: RULES & INSTRUCTIONS :::'
			puts 'Goal is to get a higher score than the dealer and win some monies!'
			puts "£100 is on the house, use it wisely!"
			puts "BlackJack (Score of 21) pays 3:2"
			puts 'Dealer hits on 16 and stands on anything above 16'
			puts  "Pressing 'h' asks the dealer to Hit and 's' to Stand"
			puts '::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::'
			print 'Press any key to continue....'
			$stdin.gets.chomp
			first_round()
		else  #User doesn't want to read instructions
			first_round()
		end
end

def is_bust(x)
	if x > 21
		return true
	else
		return false
	end
end
	
def first_round()
	deal_card($user_count)
	puts "Your count is #{$user_count} "
	sleep(1.0/2.0)
    deal_card($dealer_count)
    puts "Dealer's count is #{$dealer_count} "
    sleep(1.0/2.0)
    deal_card($user_count)
    puts "Your count is #{$user_count} "
    sleep(1.0/2.0)
    if $user_count == 21
       	deal_card($dealer_count) 
    	check_score()
    else
    	 deal_card($dealer_count)
   		 hit_or_stand()

	end
end

def hit_me()
	deal_card($user_count)
	if is_bust($user_count) && !$two_counts
		puts "Your count is: #{$user_count}"
		puts "You lost! Woops. Your count was #{$user_count}"
	elsif $two_counts && !is_bust($user_count)
		t = $user_count+1
		s = $user_count+11
		puts "Your count is: #{t} or #{s}, to HIT type 'h' or to STAND type 's' "
		hit_or_stand()
	else
		hit_or_stand()
	end
end


def hit_or_stand()
	puts "Your count is: #{$user_count} , to HIT type'h' or to STAND type 's' "
   	 ans = $stdin.gets.chomp
   	 	if ans == "h"
   	 		puts "You chose to hit. Good luck."
   	 		hit_me()
    	elsif ans == "s" && $two_counts
    		$user_count = $user_count + 11
    		puts "You chose to stand. Good luck."
    		check_score()
    	else
    		puts "You chose to stand. Good luck."
    		check_score()
    	end
end



def deal_card(x) #randomly chooses a card from the deck
	$current_card = $card_deck.sample
	$card_deck.delete($current_card)#removes chosen card from array (first instance of it)
    if x == $user_count
    	puts "Your card is: #{$current_card}"
    	    $user_count += return_count($current_card,$user_count)  #Add count of card to user/dealers count
    else
    	    $dealer_count += return_count($current_card,$dealer_count)  #Add count of card to user/dealers count

    end
end

def is_bust(x)
	if x > 21
		return true
	else
		return false
	end
end

def check_winner()
	if !is_bust($user_count) && $user_count > $dealer_count && !is_bust($dealer_count)
		#userwins
		puts "You have won this round!!"
	elsif !is_bust($user_count) && $dealer_count > $user_count && !is_bust($dealer_count)
		#dealerwins
		puts "dealer has won!"
	elsif is_bust($user_count)
		#bust
		puts "Bust! You lose"
	elsif $user_count == $dealer_count && !is_bust($user_count) && !is_bust($dealer_count)
		#push
		puts "PUSH"
	end
end


def check_score()
	if $dealer_count > 16 && $dealer_count <= 21
		puts "Dealer stands"
		$dealer_stand = true
		$dealer_bust = false
		check_winner()
	elsif $dealer_count <= 16
		$dealer_stand = false
		$dealer_bust = false
		deal_card($dealer_count)
		puts "Dealer count is: #{$dealer_count}"
		check_score()
	else
		$dealer_bust = true
		puts "DEALER BUST"
	end
end

def return_count(x,z) #returns the value of the chosen card.
	if $card_facevalue.index(x)
		y = x.to_i
		return y
    elsif $card_facecard.index(x)
   		return 10
    else #Ace has been dealt.
    	$ace = true
    	if z+1 <=21  && z+11 <=21 #Ace in this case can be 1 or 11
			$two_counts = true	
			t = $user_count+1
			s = $user_count+11
			puts "Your count is: #{t} or #{s}, to HIT type 'h' or to STAND type 's' "			
			return 11		
		elsif z+1 <=21 && z+11 > 21 #Ace equals 1
			$two_counts = false 
			return 1
		else
			#bust
		end 
	end
	
 if z == $user_count
    	puts "Your card is: #{$current_card}"
    else
    	puts "Dealers card is: #{$current_card}"

    end
end

rules()
