def add(a,b)
	puts "ADDING #{a} + #{b}"
	return a + b
end

def subtract(a,b)
	puts "SUBTRACTING #{a} - #{b}"
	return a - b
end

def multiply(a,b)
	puts "MULTIPLYING #{a} * #{b}"
	return a * b
end

def divide(a,b)
	puts "DIVIDING #{a} / #{b}"
	return a/b
end

puts "Lets do some math with functions!"

age = add(11,10)
height = subtract(150,10) 
weight = multiply(5,15)
iq = divide(500,5)

puts "Age: #{age}, Height: #{height}, Weight: #{weight}, IQ: #{iq}"


