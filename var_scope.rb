puts "1. Create a local variable and modify it at an inner scope (in between a do/end block)"
var1 = "This variable"
puts "\"#{var1}\" is the original value for \"var1\""

1.times do
	var1 = "Changed"
	puts "var1 changed to: #{var1} "
	puts "var method call without changing the original \"#{var1.reverse}\" (reverse)"
	puts "var1 is still not reversed: #{var1}"
	var1.reverse!
	puts "var1 after \"var1.reversed!\" is called: #{var1}"
	break
end
puts "\n ----------- \n"
puts "Create a local variable at an inner scope (within a do/end block) and try to reference it in the outer scope. What happens when you have nested do/end blocks?"
1.times do 
	var2 = "This is inside a while block"
	puts "This is var2 inside of a while block: \"#{var2}\""
	break
end
puts "This is var2 called outside of the while block: #{var2}"