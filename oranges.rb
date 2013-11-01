class OrangeTree 
  attr_reader :number_of_oranges

  def initialize
    @age = 0
    @number_of_oranges = 0
    @life_span = rand(50..100)
    puts "The new orange tree has been planted..."
  end

  def passage_of_time

    if @number_of_oranges > 0
      puts "#{@number_of_oranges} oranges fall from the tree to prepare for the new season"
      puts
      oranges_fall
    end 

    @age += 1

    if @age == @life_span
      puts "The tree has died from old age... How sad."
      exit
    end
    puts "The orange tree is now #{@age} years old."
    oranges_grow
  end

  def oranges_fall
    @number_of_oranges = 0
  end

  def oranges_grow
    case @age
      when 4..6 then @number_of_oranges = rand(1..4)
      when 6..12 then @number_of_oranges = rand(15..30)
      when 12..100 then @number_of_oranges = rand(30..60)
    end
  end

  def count_oranges
    puts "There are #{@number_of_oranges} oranges on the tree in the new season."  
  end

  def pick_oranges number_to_pick
    if @number_of_oranges == 0 
      puts "There are no oranges to pick."
    else
      @number_of_oranges -= number_to_pick
      puts "There are now #{number_of_oranges} on the tree."
    end
  end
end

orange_tree = OrangeTree.new

while true
  puts
  orange_tree.passage_of_time
  orange_tree.count_oranges
  puts
  puts "What would you like to do?\n(1) Wait, (2), Harvest Oranges, (3) Exit"
  response = gets.chomp
  puts
  case response
    when "2"
      puts "How many oranges do you want to pick? (1 - #{orange_tree.number_of_oranges})"
      num_to_pick = gets.chomp.to_i
      orange_tree.pick_oranges num_to_pick
    when "3"
      exit
  end
end
