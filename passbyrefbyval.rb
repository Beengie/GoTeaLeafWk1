def show_array(arr, mutate)
	puts "-- in def ---"
	arr.each{|x| print x, " "}
	puts "-- out def ---"

	arry.push 6 if mutate == true
	puts "-- in def with mutate ---"
	arr.each{|x| print x, " "}
	puts "-- out def with mutate ---"
end

a = [1, 2, 3, 4, 5]
show_array(a, false)
puts "-- not in def ---"
puts a
puts "-- not in def ---"

show_array(a, true)
puts "-- not in def mutate ---"
puts a
puts "-- not in def mutate ---"