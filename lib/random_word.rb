class RandomWord
  attr_reader :word

  WORDS = %w(codaisseur programming monkeybusiness rubyesque styleguide)

  def initialize
    @word = WORDS.sample
  end

  def positions_for(characters: [])
    # for you to implement :)
  end
end
