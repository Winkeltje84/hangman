require 'spec_helper'

RSpec.describe RandomWord do
  let(:random_word) { RandomWord.new }

  it "generates a random word from the WORDS list" do
    expect(RandomWord::WORDS).to include(random_word.word)
  end

  describe "#positions_for(characters: [])" do
    before do
      allow(random_word).to receive(:word).and_return("homebrew")
    end
  end
end
