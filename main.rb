
class GuessTheNumber
  attr_accessor :number, :min, :max

  def initialize(min, max)
    @min = min
    @max = max
    @number = rand(min..max)
  end

  def play
    puts "Welcome to the Guess the Number game!"
    puts "I've picked a number between #{@min} and #{@max}."
    guess = 0
    until guess == @number
      print "Enter your guess: "
      guess = gets.chomp.to_i
      check_guess(guess)
    end
    puts "Congratulations! You've guessed the number. The number is #{guess}!"
  end

  private

  def check_guess(guess)
    if guess < @number
      @min = [min, guess + 1].max # Update min to narrow down the range
      puts "Higher! Try again between #{@min} and #{@max}."
    elsif guess > @number
      @max = [max, guess - 1].min # Update max to narrow down the range
      puts "Lower! Try again between #{@min} and #{@max}."
    end
  end
end

# Create a new game instance and start it
if __FILE__ == $PROGRAM_NAME
  game = GuessTheNumber.new(1, 100)
  game.play
end
