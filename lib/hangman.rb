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
    puts "lenght of the random_word = #{@word_lenght}"

      #sets the array of the word to guess like [_, _, _]
    set_start(@word_lenght)

      #sets initial number of guesses
    @bad_guesses_left = 10
  end

  def play!
    print_welcome()

    until @letters_guessed_correct == @word_lenght || @failed_attempts == 10
      letter_or_word = ask_player_letter_or_word()
      case letter_or_word
      when "L"
        letter_guess()
        if @failed_attempts == 10
          puts "Sorry, you made 10 wrong guesses, game over: DIE!"
        elsif @letters_guessed_correct == @word_lenght
          puts "You got it right! You're Awesome!"
        end
      when "W"
        word_guess()
      else
        puts "There is an error in the program"
      end
    end
  end

  # sets initial show for the word guess (an array of '_')
  def set_start(word_lenght)
    @guess_word_status = []
    @letters_guessed_correct = 0
    @failed_attempts = 0
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
    puts "Remember that you after 10 letter guesses you die, and you can only one time guess the whole word. If you have that wrong, you die too..."
  end

  def ask_player_letter_or_word
    puts "\nWould you like to guess a letter or the whole word?"
    print "Please enter L for letter or W for word: "
    player_choice = gets.chomp.upcase.to_s
    while player_choice != "L" && player_choice != "W"
      print "\nCome on... L or W please... try again: "
      player_choice = gets.chomp.upcase
    end
    return player_choice
  end

  def letter_guess
    letter = get_letter_player()
    check_letter_in_random_word(@guess_letter)
    if @correct_guess == false
      @failed_attempts += 1
    end
    print_current_status()
  end

  def get_letter_player
    print "Please give a letter: "
    @guess_letter = gets.chomp.upcase
    puts "\nYou chose #{@guess_letter}"
  end

  def check_letter_in_random_word(guess_letter)
    position_letter = 0
    @correct_guess = false
    @random_word.each_char do |letter_random_word|
          #TESTING: puts "#{letter_random_word} position #{position_letter}"
        #if the letter equals to the letter in the @random_word:
        # => get position letter
        # => give that position to the change method
      if letter_random_word == guess_letter
        @letters_guessed_correct += 1
        change_guess_word_status(position_letter)
        @correct_guess = true
      end
      position_letter += 1
    end
    if @correct_guess == true
      puts "WhoopWhoop: Letter #{guess_letter} is in the word!\n"
    else
      puts "No, sorry, that letter isn't in the word."
    end
  end

  def change_guess_word_status(position_letter)
    # FOR TESTING puts "position_letter = #{position_letter.to_s}"
    @guess_word_status[position_letter] = @guess_letter
  end

  def print_current_status
    printable_guess_word_status = ""
    @guess_word_status.each do |letter|
      printable_guess_word_status += "#{letter} "
    end
    puts "Guess word status = #{printable_guess_word_status}"
    puts "You guessed #{@failed_attempts} times wrong. Remember, when reaching 10 you lose!"
  end

  def word_guess
    puts "\nAlright, this is it."
    puts "Please write down the whole word... any letter wrong and you Die!"
    word_guess = gets.chomp.upcase

    if word_guess == @random_word
      puts "Wow! You did it, you WIN!"
    else
      puts "Autsj... #{word_guess} is not the right word, you DIE!"
    end
  end

end
