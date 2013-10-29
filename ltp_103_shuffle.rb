# Learn to program 10.3 shuffle

sorted_array = ["This", "That", "the other", "here", "tree", "Three", "enough"]
sorted_array.sort!
puts "----- sorted array -----"
puts sorted_array
puts

shuffled_array = []

def shuffle_array(array_to_shuffle)
  shuffled_array = []
  while true
    for num in 0...array_to_shuffle.size
      arr_size = array_to_shuffle.size
      use_num = rand(0...arr_size)
      shuffled_array.push(array_to_shuffle[use_num])
      array_to_shuffle.delete_at(use_num)
    end
    return shuffled_array
    break
  end
end

puts "----- shuffled array -----"
puts shuffle_array(sorted_array)