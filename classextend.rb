class Integer
  def to_eng
    if self == 5
      english = 'five'
    else
      english = 'forty-two'
    end
  english
  end
end

# I'd better test on a couple of numbers...
puts 5.to_eng
puts 42.to_eng

puts

class Die
  def roll
    1 + rand(6)
  end
end

# Let's make a couple of dice...
dice = [Die.new, Die.new]
# ...and roll them.
dice.each do |die|
  puts die.roll
end
puts
class Die
  def roll
    @number_showing = 1 + rand(6)
  end

  def showing
    @number_showing
  end
end

die = Die.new
die.roll
puts die.showing
puts die.showing
die.roll
puts die.showing
puts die.showing