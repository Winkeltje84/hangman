require File.expand_path("../random_word", __FILE__)

class Hangman
  def initialize
    @word = RandomWord.new
    @random_word = @word.word.upcase #turn object into string
    puts "FOR TESTING: The random word is: #{@random_word}"
    @word_lenght = @random_word.length

    set_start(@word_lenght)
  end

    # => called from initialize()
  def set_start(word_lenght)
    @guess_word_status = []
    @failed_attempts = 0
    @win = false
    @lose = false

    # => creates empty array of '_'-s of lenght random_word
    for array_number in 0...word_lenght
      @guess_word_status.push("_")
    end
    print "\n\n"
  end

    # => called from Hangman file
  def play!
    print_welcome()

    until @win || @lose
      print_current_status()
      letter_or_word = ask_player_letter_or_word()

      case letter_or_word
      when "L"
          letter_guess()
      when "W"
          word_guess()
      else
          puts "There is an error in the program"
      end

      if @lose == true
        print_lose
      elsif @win == true
        print_win
      end
    end
  end

    # => called from play!()
  def print_welcome
    puts "Welcome to Hangman!"
    puts "Guess the word: or be hung!"
    puts "Remember that you after 10 letter guesses you lose."
  end

    # => called from play!()
  def ask_player_letter_or_word
    puts "\nWould you like to guess a letter or the whole word?"
    print "Please enter L for letter or W for word: "
    player_choice = gets.chomp.upcase.to_s
    while player_choice != "L" && player_choice != "W"
      print "\nPlease choose an 'L' or a 'W': "
      player_choice = gets.chomp.upcase
    end
    return player_choice
  end

    # => called from play!()
  def letter_guess
    letter = get_letter_player()
    check_letter_in_random_word(@guess_letter)
    if @correct_guess == false
      @failed_attempts += 1
      if @failed_attempts == 10
        @lose = true
      end
    end
    guess_word_status_string = @guess_word_status.join()
    if guess_word_status_string == @random_word
      @win = true
    end
  end

    # => called from letter_guess()
  def get_letter_player
    print "Please give a letter: "
    @guess_letter = gets.chomp.upcase
    puts "\nYou chose #{@guess_letter}"
  end

    # => called from letter_guess()
  def check_letter_in_random_word(guess_letter)
    position_letter = 0
    @correct_guess = false
    @random_word.each_char do |letter_random_word|
      if letter_random_word == guess_letter
        change_guess_word_status(position_letter)
        @correct_guess = true
      end
      position_letter += 1
    end
    if @correct_guess == true
      line_of_30_stars
      puts "WhoopWhoop: Letter '#{guess_letter}' is in the word!\n"
    else
      line_of_30_stars
      puts "No, sorry, '#{guess_letter}' isn't in the word."
    end
  end

    # => called from check_letter_in_random_word(position_letter)
  def change_guess_word_status(position_letter)
    @guess_word_status[position_letter] = @guess_letter
  end

    # => called from play!()
  def print_current_status
    print_guess_word_status = ""
    @guess_word_status.each do |letter|
      print_guess_word_status += "#{letter} "
    end
    puts "\nYou guessed #{@failed_attempts} times wrong so far. Remember, when reaching 10 you lose!"
    puts "Guess word status = #{print_guess_word_status}"
  end

    # => called from play!()
  def word_guess
    puts "\nYou want to guess the whole word."
    print "Please enter what you think the word is: "
    word_guess = gets.chomp.upcase

    if word_guess == @random_word
      line_of_30_stars
      @win = true
    else
      line_of_30_stars
      puts "No sorry, #{word_guess} is not right..."
      @failed_attempts += 1
      if @failed_attempts == 10
        @lose = true
      end
    end
  end

    # => called from check_letter_in_random_word & word_guess
  def line_of_30_stars
    puts "* " * 30
  end

    # => called from play!()
  def print_win
    puts "Wow! You did it, the word is #{@random_word}! You guessed the word & you WIN!"
  end

    # => called from play!()
  def print_lose
    puts "Sorry, you made 10 wrong guesses, game over!"
    puts "The word was : #{@random_word}"
  end
end
