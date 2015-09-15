filename = ARGV.first
txt = open(filename)

puts "Here's your file #{filename}:"
print txt.read

print "Type the filename again: "
filename_again = $stdin.gets.chomp

txt_again = open(filename_again)
print txt_again.read