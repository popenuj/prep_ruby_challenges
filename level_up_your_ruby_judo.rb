#POWER
=begin

Write a method power which takes two integers(base and exponent) and 
returns the base reaised to the power of exponent. Do not use Ruby's
** operator for this!
	
=end
def power(base, exponent)
	answer = 1
	(exponent).times do
		answer = answer * base
	end
	puts answer.to_s
end

power(3,4)

#FACTORIAL
=begin
	
Write a method factorial which takes a number and returns the product of
every number up to the current number multiplied together
	
=end
def factorial(number)
	total = 1
	(1..number).each do |multiplier|
		total = total * multiplier
		
	end
	puts total.to_s
end

factorial(5)

#UNIQUES
=begin
	
Write a method uniques which takes an array of items and returns
the array without any duplicates. Don't use Ruby's uniq method!
	
=end
def uniques(items)
	new_array = []
	items.each do |element|
		if new_array.include?(element) == false
			new_array.push(element)
		end
	end
	puts new_array.to_s
end

uniques([1,5,"frog",2,1,3,'frog'])

#COMBINATIONS
=begin
	
Write a method combinations which takes two arrays of strings 
and returns an array with all of the combinations of the 
items in them, listing the first items first.
	
=end
def combinations(first, second)
	new_array = []
	first.each do |element|
		second.each do |element_2|
			new_array.push(element.to_s + element_2.to_s)
		end
	end
	puts new_array
end

combinations(["on", "in"], ["to", "rope"])

#PRIMES
=begin
	
Write a method is_prime? which takes in a number and returns
true if it is a prime number.

=end
def is_prime?(number)
	prime = true
	divisor = 2
	while divisor < number && prime == true
		if number % divisor == 0
			prime = false
		else
			divisor += 1
		end
	end
	puts "prime: " + prime.to_s
end
is_prime?(7)
is_prime?(14)

#RECTANGLE OVERLAP
=begin

Write a method overlap which takes two rectangles defined by 
the coordinates of their corners, e.g. [[0,0],[3,3]] and 
[[1,1],[4,6]], and determines whether they overlap. You can
assume all coordinates are positive integers.

It doesn't count as overlapping if their edges touch but they
do not otherwise overwrite each other. 

=end
def overlap(one, two)
	#uses ranges to represent all side of both rectangles
	one_x_range = (one[0][0]...one[1][0])
	two_x_range = (two[0][0]...two[1][0])
	one_y_range = (one[0][1]...one[1][1])
	two_y_range = (two[0][1]...two[1][1])
	#default overlap settings
	x_overlap = false
	y_overlap = false
	#determines if horizontal sides of both rectangles have 
	#a similar range
	one_x_range.each do |point|
		if two_x_range.include?(point) == true
			x_overlap = true
		end
	end
	#determines if vertical sides of both rectangles have 
	#a similar range
	one_y_range.each do |point|
		if two_y_range.include?(point) == true
			y_overlap = true
		end
	end
	#if only one is true then they have sides touching
	if x_overlap == true && y_overlap == true
		puts "overlap: true"
	else
		puts "overlap: false"
	end
end
overlap([[0,0],[3,3]],[[1,1],[4,6]])
overlap([[0,0],[1,4]],[[1,1],[3,2]])
overlap([[1,0],[3,6]],[[0,2],[4,4]])

#COUNTING GAME
=begin
	
10 friends are sitting in a circle around a table and decide to
play a new game. In it, they count up through the numbers from 
1 to 100. The first person says "1", the second says "2" and so 
on... but with a few catches:

-Whenever the number is divisible by 7, they switch directions. 
 So person 6 will say "6", person 7 will say "7", then person 6 
 again will say "8".
-Whenever the number is divisible by 11, they skip the next 
 person for the following number. For instance, if person 3 says
 "33", person 5 will say "34" instead (person 4 gets skipped).
	
=end
def counting_game(total_players, end_number)
	current_player = 1
	current_number = 1
	direction = 1
	skip = false
	while current_number < end_number
		current_player += (1 * direction)
		current_number += 1
		if skip == true
			current_player += (1 * direction)
			skip = false
		end
		if current_number % 7 == 0
			direction *= -1
		end
		if current_number % 11 == 0
			skip = true
		end
		if current_player < 1
			current_player += (total_players)
		elsif current_player > total_players
			current_player -= total_players
		end		
	end
	puts current_player.to_s
end
counting_game(10,100)








