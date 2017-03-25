# Hangman Ruby Starter

Our mission is to build a Hangman game. This is a game in which the
computer picks a random word and a player needs to guess it by
suggesting letters, within an unlimited amount of guesses,
but only 10 of them are allowed to be wrong.

The word to guess is represented by a row of dashes, representing each
letter of the word. If the player suggests a letter which occurs in
the word, the computer writes it in all its correct positions. If the
suggested letter or number does not occur in the word, the computer
deducts one of the 9 allowed incorrect guesses.

The game may either draw one element of a hanged man stick figure as a
tally mark at each incorrect guess, or show a number indicating the remaining
allowed mistakes.

The player guessing the word may, at any time, attempt to guess the
whole word. If the word is correct, the game is over and the player
wins. Otherwise, the computer penalizes the player by deducting 1
off the remaining allowed incorrect guesses, optionally adding an element
to the hanged man stick figure. If the allowed guesses reaches 0, the
computer wins the game.

## Implementation

To build this game, we will write a terminal program in Ruby. This means
you are not allowed to use frameworks such as Rails, Sinatra, or any
other web framework and the game should be playable from a UNIX terminal.

### Setup

Use this repository as a starting point to build your game. You can just
fork it, then clone it to your local computer to start working.

```bash
# Install gem dependencies
$ bundle install

# Command to run the game (that you will need to build first ;)
$ bin/hangman
```

### Tests

There is one framework that you are allowed to use though, and that is
RSpec. It is already included and set up in this Starter repository.

We expect you to write tests for all classes and methods of your game.

#### Running Tests

To run your tests, you can use Guard:

```ruby
$ bundle exec guard
```

Guard automatically listens for changes in your `spec` and `lib` folders
and it will run the according spec files automatically when that happens.

Once Guard is running, type <kbd>Enter</kbd> at any time to run all tests.

## Homework

You can spend the weekend on this as homework. Depending on your
progress on Monday, you will either progress into the Real World
Projects, or we may ask you to continue to work on it to practice more
on your raw programming skills.
