RESULTS = {
  'paper' => {:beats => 'rock', 
              :loses_to => 'scissors', 
              :message => 'Paper wraps rock.'},
  'scissors' => {:beats => 'paper', 
                 :loses_to => 'rock',
                 :message => 'Scissors cut paper.'},
  'rock' => {:beats => 'scissors', 
             :loses_to => 'paper',
             :message => 'Rock smashes scissors.'}
}
OPTIONS = [
 [1,'paper'],
 [2,'scissors'],
 [3,'rock']
]

def empty_line(repeats = 1)
  repeats.times{puts ''}
end

loop do
  puts "Choose your move"
  OPTIONS.each{|opt| puts "  #{opt[0]} - #{opt[1]}"}
  choice = gets
  empty_line
  choice = OPTIONS.detect{|x|x[0] == choice.to_i}
  if choice
    choice = choice[1]
    puts "You chose #{choice}"
    enemy_choice = OPTIONS[rand(3)][1]
    puts "Enemy chose #{enemy_choice}"
    empty_line
    if RESULTS[choice][:beats] == enemy_choice
      puts RESULTS[choice][:message]
      puts "You win!"
    elsif RESULTS[choice][:loses_to] == enemy_choice
      puts RESULTS[enemy_choice][:message]
      puts "You lose!"
    else
      puts "It's a draw!"
    end
  else
    puts "That's not a valid choice!"
  end

  empty_line(2)
  puts "Press ctrl + c to Finish"
  empty_line(2)
end
