# 2. User your imagination to create a fun programme that takes in data from the user, and depending what is data is supplied, use if/else statements and loops to produce different results.

# MINE-FIELD
# created by Baron Bloomer

# UPDATES (version 2)
# 1. Mines are now randomised every game.
# 2. Player's previous steps are shown on map.
# 3. At the end of the game the location of all mines are shown to the player. 

# Show user compatibility warning
puts "NOTE: For best results, please ensure you are using Ruby 1.9.2 or above. (Check version 'ruby -v').\n\n"

#create all variables (NB* the '$' before the variable name makes it 'global' i.e. accessible from all scripts within the program)
$game_run=true #set to true to play the game, set to false to end.
$has_won=false #determines whether the play has won the game
$show_map=false #shows the player the map at the end of the game if set to true
$map_size = 6 # size of map is 6x6 
@map = []
@map = Array.new($map_size) {Array.new($map_size) {0}} #creates a 2D Array, setting all indexes to '0'
$position = Array.new
$mine1 = Array.new
$mine1 = [rand(6), rand(6)]
$mine2 = Array.new
$mine2 = [rand(6), rand(6)]
$mine3 = Array.new
$mine3 = [rand(6), rand(6)]
$dead = false

#set up map
for i in (0 .. 1)
  if i < 2
    $position[i] = 0
  end
end

#check to make sure no 2 mines have the same position, and do not have x,y of 0,0.
#note, if there ARE 2 mines with same co-ordinates, all mines are reshuffled, except for mine3. 
# mine 3 only becomes reshuffled if it has co-ordinates [0,0]
##First, make sure no mine has co-ordinates of [0,0]
while $mine1[0] == 0 and $mine1[1] == 0 #make sure mine1 does not have [0,0]
  $mine1[0] = Random.rand(6)
  $mine1[1] = Random.rand(6)
end
while $mine2[0] == 0 and $mine2[1] == 0 #make sure mine2 does not have [0,0]
  $mine2[0] = Random.rand(6)
  $mine2[1] = Random.rand(6)
end
while $mine3[0] == 0 and $mine3[1] == 0 #make sure mine3 does not have [0,0]
  $mine3[0] = Random.rand(6)
  $mine3[1] = Random.rand(6)
end
##Secondly, make sure no 2 mines have the same co-ordinates
while ($mine1[0] == $mine2[0] and $mine1[1] == $mine2[1]) or ($mine1[0] == $mine3[0] and $mine1[1] == $mine3[1])
  while ($mine2[0] == $mine3[0] and $mine2[1] == $mine3[1])
    $mine2[0] = Random.rand(6)
    $mine2[1] = Random.rand(6)
    while $mine2[0] == 0 and $mine2[1] == 0 #make sure mine2 does not have [0,0]
      $mine2[0] = Random.rand(6)
      $mine2[1] = Random.rand(6)
    end
    while $mine3[0] == 0 and $mine3[1] == 0 #make sure mine3 does not have [0,0]
      $mine3[0] = Random.rand(6)
      $mine3[1] = Random.rand(6)
    end
  end

  $mine1[0] = Random.rand(6)
  $mine1[1] = Random.rand(6)
  while $mine1[0] == 0 and $mine1[1] == 0 #make sure mine1 does not have [0,0]
      $mine1[0] = Random.rand(6)
      $mine1[1] = Random.rand(6)
  end
end


#this method is used only to test game variables - remove in final version.
def debug()
 for i in (0 .. $map_size-1)
  for j in (0 .. $map_size-1)
   puts "map[#{i}][#{j}] = #{@map[i][j]}"
  end
 end
 for i in (0 .. $position.length-1)
  puts "position[#{i}] = #{$position[i]}"
 end 
 for i in (0 .. $mine1.length-1)
  puts "mine1[#{i}] = #{$mine1[i]}"
  puts "mine2[#{i}] = #{$mine2[i]}"
  puts "mine3[#{i}] = #{$mine3[i]}"
 end
end

def instructions()
 puts "Would you like to see the instructions? (y/n)"
 ans = STDIN.gets.chomp()

 if ans == "y" or ans == "Y"
  puts "\n"
  puts "INSTRUCTIONS:"
  puts "There are 3 mines hidden in the field."
  puts "You position is shown by the 'P' on the map."
  puts "You can move left, right, up or down to a free space."
  puts "It is your job to reach the exit 'O' without stepping on a mine."
  puts "Good luck!"
  print "\n"
  game()
 elsif ans == "n" or ans == "N"
  puts "\n"
  game()
 else
  puts "Your response was not valid. Try again."
  instructions()
 end
end

def gui()
 #draw map
 puts "MINE-FIELD"
 for i in (0 .. $map_size-1)
  for j in (0 .. $map_size-1)
    if $show_map == false
     if @map[i][j] == 1 #ground has been walked on
      print "_" 
     elsif $position[0] == i and $position[1] == j
      if $position[0] == $mine1[0] and $position[1] == $mine1[1] #if player has stepped on mine1
       print "X"
       $dead = true
      elsif $position[0] == $mine2[0] and $position[1] == $mine2[1] #if player has stepped on mine2
       print "X"
       $dead = true
      elsif $position[0] == $mine3[0] and $position[1] == $mine3[1] #if player has stepped on mine3
       print "X"
       $dead = true
      else
       @map[i][j] = 1
       print "P" #player's current location
      end
     elsif i == $map_size-1 and j == $map_size-1
      print "O"
     else
      print "~" #ground is untraversed
     end
    else #player has finished game, draw the map!
      if $has_won == true
        if (i == $mine1[0] and j == $mine1[1]) or (i == $mine2[0] and j == $mine2[1]) or (i == $mine3[0] and j == $mine3[1])
          print "X"
        elsif not(i == $map_size-1 and j == $map_size-1)
          print "_"
        else
          print "P\n"
          puts "GAME OVER."
          Process.exit(0)
        end
      else
        if $position[0] == i and $position[1] == j
          print "D"
        elsif (i == $mine1[0] and j == $mine1[1]) or (i == $mine2[0] and j == $mine2[1]) or (i == $mine3[0] and j == $mine3[1]) and not(i == $position[0] and j == $position[1])
          print "X"
        elsif not(i == $map_size-1 and j == $map_size-1)
          print "_"
        else
          print "O\n"
          puts "GAME OVER."
          Process.exit(0)
        end
      end
    end
  end
  print "\n" #draw the next row
 end
end

def move()
 if $dead != true
  if $position[0] == $map_size-1 and $position[1] == $map_size-1 #player has reached exit - game complete
   $show_map = true
   $has_won = true
   puts "You safely reached the exit without stepping on a mine!\n" 
   puts "You Win!"
   sleep (1.0/2.0)
   puts ":-)"
   puts "\n"
   gui()
  else
   puts "Move which direction? (Options: l = left, r = right, u = up, d = down)"
   move = STDIN.gets.chomp() #store user's response

   if move == "l" or move == "L"
    if $position[1] != 0
     $position[1]=$position[1] - 1
    else
     puts "Can't move left, try go another direction."
     move()
    end
   elsif move == "r" or move == "R"
    if $position[1] != $map_size - 1
     $position[1]=$position[1] + 1
    else
     puts "Can't move right, try go another direction."
     move()
    end
   elsif move == "u" or move == "U"
    if $position[0] != 0
     $position[0]=$position[0] - 1
    else
     puts "Can't move up, try go another direction."
     move()
    end
   elsif move == "d" or move == "D"
    if $position[0] != $map_size - 1
     $position[0]=$position[0] + 1
    else
     puts "Can't move down, try go another direction."
     move()
    end
   else
    puts "'#{move}' is not a valid option, please try again."
    move()
   end
  end
 else #player stepped on mine - game over
  $show_map = true
  puts "You stepped on a mine." 
  sleep 1
  puts "You Lose!"
  sleep (1.0/2.0)
  puts ":-("
  puts "\n"
  gui()
 end
 puts "\n"
end

def game()
 while $game_run == true
  gui()
  move()
  #game=false #stops game from looping infinitely - remove once game complete
 end
end

instructions()
#debug() #remove once game complete
