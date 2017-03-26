require 'spec_helper'

RSpec.describe Hangman, type: :model do

  describe ".initialize" do
    game = Hangman.new
    #random_word4 = RandomWord.new(@word: "four")
    #random_word6 = RandomWord.new(@word: "six666")

    #let(:random_word4) { create :random_word }
    #let(:random_word6) { create :random_word, @word: "six666"}

    #random_word4 = RandomWord.new("four")
    #random_word6 = RandomWord.new("six666")

    random_word = RandomWord.new

    it "returns length of the random word" do
      game.to eq(random_word.length)
      #expect( game.random_word4.initialize)to match_integer 4
      #expect( game.random_word6.initialize)to match_integer 6
      #expect(game.initialize(random_word4)).to eq(4)
      #expect(game.initialize(random_word6)).to eq(6)

      #expect(game.initialize).to contain_exactly(random_word4.length)

    end
  end
end

=begin
describe "shared/_navbar.html.erb" do
  before { sign_in user }

  context "without profile" do
    let(:user) { create :user }

    it "renders email" do
      render
      expect(rendered).to have_content user.email
    end
  end

  context "with profile" do
    let(:profile) { build :profile }
    let(:user) { create :user, profile: profile }

    it "renders first and last name" do
      render
      expect(rendered).to have_content profile.first_name
      expect(rendered).to have_content profile.last_name
    end
  end
end





=begin
describe "#bargain?" do
    let(:user) { create :user }
    let(:bargain_room) { create :room, price: 20, user: user }
    let(:non_bargain_room) { create :room, price: 200, user: user }

    it "returns true if the price is smaller than 30 EUR" do
      expect(bargain_room.bargain?).to eq(true)
      expect(non_bargain_room.bargain?).to eq(false)
    end
  end

=begin
describe ".order_by_price" do
    let!(:room1) { create :room, price: 100 }
    let!(:room2) { create :room, price: 200 }
    let!(:room3) { create :room, price: 300 }

    it "returns a sorted array of rooms by prices" do
      expect(Room.order_by_price).to match_array [room1, room2, room3]
    end

=begin
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

=begin
it "should get index" do
    get :index
    expect(response).to be_success
    expect(assigns(:rooms)).not_to eq(nil)
