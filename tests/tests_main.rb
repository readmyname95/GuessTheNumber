require 'minitest/autorun'
require_relative '../main'


class TestMain < Minitest::Test
  def test_initialization
    game = GuessTheNumber.new(1, 100)
    assert_equal 1, game.min, "Initial min should be 1"
    assert_equal 100, game.max, "Initial max should be 100"
  end

  def test_guess_update_range
    game = GuessTheNumber.new(1, 100)
    game.number = 50 # Force the number for testing
    
    game.send(:check_guess, 25) # Using send to call a private method for testing purposes
    assert_equal 26, game.min, "Min should be updated to 26 if the guess is 25"

    game.send(:check_guess, 75)
    assert_equal 74, game.max, "Max should be updated to 74 if the guess is 75"
  end
end
