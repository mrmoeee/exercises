require 'rspec'
require 'towers_of_hanoi.rb'

RSpec.describe Game do 
  subject(:game) { Game.create_towers }
  describe "#create_towers" do 
    context "when game is created" do 
      it "has 7 pieces in tower[0]" do 
        expect(game.towers[0].length).to eq(7)
      end  
      it "has 3 towers" do 
        expect(game.towers.length).to eq(3)
      end
    end 
  end 
  
  describe "#move" do 
    context "when a dissscck is moved" do 
      it "is moved from a tower and added to another" do 
        game.move(0, 1)
        expect(game.towers[0].length).to eq(6) 
        expect(game.towers[1].length).to eq(1)
      end
    end 
  end  
  
  describe "#valid_move?" do
    context "check valid move when disk is moved" do
      it "is valid when moving to empty tower" do
        expect(game.valid_move?(0,1)).to be_truthy
      end
      it "is invalid when moving onto disks greater than itself" do
        game.move(0,1)
        expect(game.valid_move?(0,1)).to be_falsey
      end
      it "is invalid when selecting disks from empty tower" do
        expect(game.valid_move?(2,1)).to be_falsey
      end
    end
  end
  
  describe "#won?" do 
    context "when all the pieces are in a tower that is not tower[0]" do 
      it "returns truthy when we win" do 
        tower2 = [7,5,6,4,3,2,1]
        game.towers[1] = tower2
        expect(game.won?).to be_truthy
      end 
    end
  end
end