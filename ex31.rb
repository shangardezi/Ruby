puts "You enter a dark room with two doors. Do you go through door #1 or door #2?"
print "> "

door = $stdin.gets.chomp

if door == "1"
	puts "You're confronted by a dragon, who asks for three fiddy. What do you do?"
	puts "1. Give the dragon three-fiddy"
	puts "2. Don't give chef three-fiddy"

   	print "> "
   	dragon_choice = $stdin.gets.chomp
   	
   	if dragon_choice == "1"
   		puts "The dragon spuds you."
   	elsif dragon_choice == "2"
   		puts "Dragon takes three-fiddy from you anyway"
   	else
   		puts "Dragon flies to narnia" % dragon_choice
   	end

elsif door == "2"
	puts "Mr Squirell is seen residing in the corner of the room and offers your a spliff. 
	What do you do?"
	puts "1. 420 blez it"
	puts "2. snitch"
	puts "3. pop bottles"
	
	print "> "
	wise_choice = $stdin.gets.chomp
	
	if wise_choice == "1" || wise_choice == "3"
		puts "Wise choice. You go on a madness and share nuts with Mr Squirell the whole night"
	else 
		puts "Mr Squirell pops you. #1arda "
	end
else 
	"You're a tit"
end

