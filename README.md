# Hangman Ruby
> Individual assignment after week #4 of Codaisseur Academy (half way through)

## Current State
This assignment was done over the weekend and the state it is currently in is still like it was at the time. The game is properly working, but it still needs work on the tests.

## About
Our mission is to build a Hangman game. This is a game in which the computer picks a random word and a player needs to guess it by suggesting letters, within an unlimited amount of guesses, but only 10 of them are allowed to be wrong.

The word to guess is represented by a row of dashes, representing each letter of the word. If the player suggests a letter which occurs in the word, the computer writes it in all its correct positions. If the suggested letter or number does not occur in the word, the computer deducts one of the 9 allowed incorrect guesses.

The game may either draw one element of a hanged man stick figure as a tally mark at each incorrect guess, or show a number indicating the remaining allowed mistakes.

The player guessing the word may, at any time, attempt to guess the whole word. If the word is correct, the game is over and the player wins. Otherwise, the computer penalizes the player by deducting 1 off the remaining allowed incorrect guesses, optionally adding an element to the hanged man stick figure. If the allowed guesses reaches 0, thecomputer wins the game.

To build this game, we will write a terminal program in Ruby. This means you are not allowed to use frameworks such as Rails, Sinatra, or any other web framework and the game should be playable from a UNIX terminal.

### Setup

```bash
# Install gem dependencies
$ bundle install

# Command to run the game (that you will need to build first ;)
$ bin/hangman
```

## Related Documentation
  * [Ruby on Rails](http://rubyonrails.org/)
  * [Hangman Ruby Starter](https://github.com/Codaisseur/hangman-ruby-starter) (this starter was provided by Codaisseur)
