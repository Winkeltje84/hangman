require 'spec_helper'

RSpec.describe Hangman do

  describe "ask_player_letter_or_word" do
    game = Hangman.new
    choice = game.ask_player_letter_or_word
    it "prompts the user to enter an 'L' or 'W' if they entered an 'r'" do
      allow(choice).to receive(:gets.and_return('r')
      allow(choice).to receive(:loop).and_yield

      expect { choice.type_of_hangman }
        .to output(/\nPlease choose an 'L' or a 'W':/)
        .to_stdout
    end
    #it "Does not return '9', '$', 'l' & 'w'"

  end

end


describe Game do
  subject { Game.new }

  it 'prompts the user to enter their gametype again if it is incorrect' do
    allow(subject).to receive(:gets).and_return('human v. machine')
    allow(subject).to receive(:loop).and_yield

    expect { subject.type_of_game }
      .to output(/Please enter a valid game/)
      .to_stdout
  end

  it 'does not prompt the user to enter their gametype if it is correct' do
    allow(subject).to receive(:gets).and_return('human v. human')

    expect { subject.type_of_game }
      .to_not output(/Please enter a valid game/)
      .to_stdout
  end

  it 'returns the specified gametype if valid' do
    allow(subject).to receive(:gets).and_return('human v. human')

    expect(subject.type_of_game).to eq('human v. human')
  end
end
