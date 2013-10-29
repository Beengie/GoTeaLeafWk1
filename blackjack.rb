# Blackjack by Tim Watson V1.0
deck = [] # create deck array
dealer_cards = []
player_cards = []
winner = false
first_deal = true
dealers_hand_value = 0
dealers_hide_value = 0
players_hand_value = 0
number_of_decks = 1

def add_cards(add_cards, hide = false) # add totals to cards
  value = 0
  # print add_cards[1]
  add_cards.each do |c, s|
    if hide == false
      if s.is_a? Integer
        value +=s
      else
        if s == "Ace"
          value +=11
        else
          value +=10
        end
      end
    else
      hide = false
    end
  end
  return value
end

def is_blackjack(card_array) # see if cards are blackjack
  if add_cards(card_array) == 21 
    true 
  else
    false
  end
end

def say(who = "", msg)
  puts "#{who}=> #{msg}"
end

def return_card(card_to_print) # print card value
  return "#{card_to_print[1]} of #{card_to_print[0]}"
end

def return_hand(card_to_return, dealers_init) # return entire hand in a string
    hand_string = ""
  card_to_return.each do |s, c|
    if dealers_init != true
      if hand_string != ""
        hand_string += ", #{c} of #{s}"
      else
        hand_string = "#{c} of #{s}"
      end
    else
      dealers_init = false
    end
  end
  return hand_string
end

def make_deck(number_of_decks, deck)
  for loop_num in 1..number_of_decks
    for suit_num in 1..4 # set suits
      case suit_num
      when 1
        suit = "Hearts"
      when 2
        suit = "Diamonds"
      when 3
        suit = "Spades"
      when 4
        suit = "Clubs"
      end

      deck.push([suit, "Ace"])
      for card in 2..10 # set numbered cards
        deck.push([suit, card])
      end

      for face_card_num in 1..3 # set face cards
        case face_card_num
        when 1
          face_card = "Jack"
        when 2
          face_card = "Queen"
        when 3
          face_card = "King"
        end
        deck.push([suit, face_card])
      end
    end
  end
end

def deal_a_card(which_player, which_hand, deck, dealers_init = false)
  get_card = rand(1...deck.size)
  which_hand.push(deck[get_card])
  if which_player == "Dealer"
    if dealers_init == false
      say "Dealer", "dealt #{return_card(deck[get_card])}"
    else
      say "Dealer", "is dealt a card face down"
    end
  else
    say "#{which_player} is dealt #{return_card(deck[get_card])}"
  end
  deck.delete_at(get_card)
end

def have_winner(player_cards, dealer_cards, player_name)
  dealers_hand_value = add_cards(dealer_cards)
  players_hand_value = add_cards(player_cards)
  if dealers_hand_value > 21
    say "Dealer", "The dealer busted! You win!"
    winner = true
  elsif players_hand_value > 21
    say player_name, "You busted! The dealer wins!"
    winner = true
  elsif dealers_hand_value > players_hand_value
    say "Dealer", "The dealer won."
    winner = true
  elsif players_hand_value > dealers_hand_value
    say player_name, "You won!"
    winner = true
  elsif players_hand_value ==  dealers_hand_value
    puts "It's a push."
    winner = true
  end
  if winner == true
    hand_end_print(player_cards, dealer_cards, player_name, dealers_hand_value, players_hand_value)
  end
end

def hand_end_print(player_cards, dealer_cards, player_name, dealers_hand_value, players_hand_value)
  puts
  puts "-------- Hand values and cards --------"
  say "Dealer", "Dealer's hand showing (#{return_hand(dealer_cards, false)})"
  say "Dealer", "Dealer has a value of #{dealers_hand_value} -- (hide)"
  say player_name, "hand (#{return_hand(player_cards, false)})"
  say player_name, "You have a value of #{players_hand_value}"
  puts "---------------------------------------"
  puts
end

# puts "Array size is: #{deck.size}"
def deal_cards(deck, player_cards, dealer_cards, which_player)
  for num in 1..4
    sleep 1.25
    case num % 2
    when 1
      deal_a_card(which_player, player_cards, deck)
    when 0
      if num == 2
        deal_a_card("Dealer", dealer_cards, deck, true)
      else
        deal_a_card("Dealer", dealer_cards, deck)
      end
    end
  end
end

make_deck(number_of_decks, deck)
puts
puts "----- PlayBlackjack ver. 1.0 by Tim Watson ------"
puts
say "Enter your name:"
player_name = "Tim"
# player_name = gets.chomp
# player_name.capitalize!
say "Welcome #{player_name}. Here is the first round of hands with a brand new deck..."
puts

deal_cards(deck, player_cards, dealer_cards, player_name)
catch (:exit) do
  while true
    while winner == false
      case first_deal # first deal check for blackjack
      when true
        if is_blackjack(player_cards) && is_blackjack(dealer_cards)
          puts "#{player_name}, both you and the dealer have blackjack (push)"
          hand_end_print(player_cards, dealer_cards, player_name)
          winner = true
        elsif is_blackjack(player_cards)
          puts "-----------------------"
          puts "#{player_name}, you won with blackjack!"
          hand_end_print(player_cards, dealer_cards, player_name)
          winner = true
        elsif is_blackjack(dealer_cards)
          puts "-----------------------"
          puts "The dealer won with blackjack!"
          hand_end_print(player_cards, dealer_cards, player_name)
          winner = true
        end
        first_deal = false

      when false # past first deal - handle play
        dealers_hand_value = add_cards(dealer_cards)
        dealers_hide_value = add_cards(dealer_cards, true)
        players_hand_value = add_cards(player_cards)
        puts
        puts "--------------- will hide ---------------"
        puts "Dealer's hand showing (#{return_hand(dealer_cards, false)}) - (hide)"
        puts "Dealer has a value of #{dealers_hand_value} -- (hide)"
        puts "-----------------------------------------"
        puts "The dealer shows a value of #{dealers_hide_value} - (#{return_hand(dealer_cards, true)})"
        puts
        # say "#{player_name}'s hand (#{return_hand(player_cards, false)})"
        say "#{player_name}, you have a value of #{players_hand_value} - (#{return_hand(player_cards, false)})"
        puts
        puts "Would you like to (H)it or (S)tay?"
        hit_stay = gets.chomp
        hit_stay.downcase!
        puts
        if hit_stay == "h" # hit
          deal_a_card(player_name, player_cards, deck) # deal a card
          players_hand_value = add_cards(player_cards)
          if players_hand_value > 21 
            winner = have_winner(player_cards, dealer_cards, player_name)
          elsif dealers_hand_value < 17  # is the dealer's hand less than 17?
            deal_a_card("Dealer", dealer_cards, deck) # give the dealer a card
            dealers_hand_value = add_cards(dealer_cards)  # update hand value
            dealers_hide_value = add_cards(dealer_cards, true)
          elsif dealers_hand_value > 21
            winner = have_winner(player_cards, dealer_cards, player_name)
          end
        elsif "s" # player stays
          catch (:done) do
            while dealers_hand_value < 17 # is dealer's hand less than 17?
              deal_a_card("Dealer", dealer_cards, deck) # give the dealer a card
              dealers_hand_value = add_cards(dealer_cards) # update hand value
              dealers_hide_value = add_cards(dealer_cards, true)
              if dealers_hand_value > players_hand_value || dealers_hand_value == players_hand_value
                throw :done
              end
            end
          end
          # dealer's hand is bigger than 17      
          winner = have_winner(player_cards, dealer_cards, player_name)
        else
          say "Invalid entry. Please enter (H)it or (S)tay."
        end
      end
    end

    while true
      say "Do you want to play again? (Y) or (N)"
      play_again = gets.chomp
      play_again.downcase!
      if play_again == "n"
        say "Thank you for playing Blackjack\nGoodbye"
        throw :exit
      elsif play_again = "y"
        puts "Cards in deck: #{deck.size}"
        dealer_cards =[]
        player_cards = []
        winner = false
        first_deal = false
        deal_cards(deck, player_cards, dealer_cards, player_name)
        break
      else
        say "Invalid entry."
      end
    end
  end
end