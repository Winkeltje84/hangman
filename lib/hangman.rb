require File.expand_path("../random_word", __FILE__)

class Hangman
  def initialize
    @word = RandomWord.new
      #sets random word to @random_word & prints random_word
    @random_word = @word.word.upcase

      #print random_word for testing
    puts "The random word is: #{@random_word}"

      #sets word lenght & prints it for test
    @word_lenght = @random_word.length
    puts "lenght of the random_word = #{word_lenght}"

      #sets the array of the word to guess like [_, _, _]
    set_start(word_lenght)

      #sets initial number of guesses
    @bad_guesses_left = 10
  end

  def play!
    print_welcome()

      #below should be in loop
    untill @letters_guessed_correct == @word_lenght
      letter = get_letter_player()
      check_letter_in_random_word(@guess_letter)
    end

  end

  # sets initial show for the word guess (an array of '_')
  def set_start(word_lenght)
    @guess_word_status = []
    @letters_guessed_correct = 0

    for letter_number in 1..word_lenght
      @guess_word_status.push("_")
    end
      ##print for testing:
    print "The empty array to start at: #{@guess_word_status}"
    puts
    puts
  end

  def print_welcome
    puts "Welcome to Hangman!"
    puts "Guess the word: or be hung!"
    puts "So make sure to guess it right because after 10 wrong letter guesses you're DONE..."
  end

  def get_letter_player
    print "Please give a letter: "
    @guess_letter = gets.chomp.upcase
    puts "You chose #{@guess_letter}"
  end

  def check_letter_in_random_word(guess_letter)
    position_letter = 0
    @random_word.each_char do |letter_random_word|
          #TESTING: puts "#{letter_random_word} position #{position_letter}"
        #if the letter equals to the letter in the @random_word:
        # => get position letter
        # => give that position to the change method
      if letter_random_word == guess_letter
        puts "WhoopWhoop: Letter #{guess_letter} is in the word!"
        @letters_guessed_correct += 1
        change_guess_word_status(position_letter)
      end
      position_letter += 1
    end
    puts
    puts guess_letter
  end

  def change_guess_word_status(position_letter)
      # =>  TESTING puts "position_letter = #{position_letter.to_s}"
    @guess_word_status[position_letter] = @guess_letter
    puts "new guess word status = #{@guess_word_status}"
  end

end
