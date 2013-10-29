# Learn to program 10.3 shuffle

sorted_array = ["This", "That", "the other", "here", "tree", "Three", "enough"]
sorted_array.sort!
puts "----- sorted array -----"
puts sorted_array
puts

shuffled_array = []
while true
  
  for num in 0...sorted_array.size
    arr_size = sorted_array.size
    use_num = rand(0...arr_size)
    shuffled_array.push(sorted_array[use_num])
    sorted_array.delete_at(use_num)
  end
  break
end
puts "----- shuffled array -----"
puts shuffled_array