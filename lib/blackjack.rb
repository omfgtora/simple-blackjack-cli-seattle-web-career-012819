def welcome
  puts "Welcome to the Blackjack Table"
end

def deal_card
  return rand(1..11)
end

def display_card_total(card_total)
  puts "Your cards add up to #{card_total}"
end

def prompt_user
  puts "Type 'h' to hit or 's' to stay"
end

def get_user_input
  gets.chomp
end

def end_game(card_total)
  puts "Sorry, you hit #{card_total}. Thanks for playing!"
end

def initial_round
  card_one = deal_card
  card_two = deal_card
  card_total = card_one + card_two
  
  # The following line makes this method fail the test
  # puts "Your cards are #{card_one} and #{card_two}"
  
  display_card_total(card_total)
  return card_total
end

def hit?(card_total)
  prompt_user
  play = get_user_input
  if play == "s"
    return card_total
  elsif play == "h"
    card_total = card_total + deal_card
    return card_total
  else
    invalid_command
    display_card_total(card_total)
    hit?(card_total)
  end
end

def invalid_command
  puts "Please enter a valid command"
end

#####################################################
# get every test to pass before coding runner below #
#####################################################

def runner
  welcome
  card_total = initial_round
  card_total = hit?(card_total)
  until card_total > 21
    display_card_total(card_total)
    card_total = hit?(card_total)
  end
  display_card_total(card_total)
  end_game(card_total)
end
    
