require 'rspec'
require 'random_methods.rb'

RSpec.describe "#my_uniq" do 
  context "when given an array with dups" do 
    it "only returns uniqs" do 
      dup_arr = [1, 2, 3, 3, 3, 3, 2]  
      expect(my_uniq(dup_arr)).to eq(dup_arr.uniq)
    end
  end
  
  context "when given a uniq array" do 
    it "only returns uniqs" do 
      uniq_array = [1,2,3]
      expect(my_uniq(uniq_array)).to eq(uniq_array)
    end 
  end
end

RSpec.describe Array do 
  describe "#two_sum" do 
    context "when given an array with no pair of elements that sum to zero" do 
      
      it "returns empty array" do 
        expect([1, 5, 3, 6, -8].two_sum).to eq([])
      end
    end
    
    context "when given an array with a pair of elements that sum to zero" do 
      it "returns an array of pairs that sum to zero" do 
        expect([-1, 0, 2, -2, 1].two_sum).to eq([[0, 4], [2, 3]])
      end
    end
  end
end

RSpec.describe "#my_transpose" do
  context "when given an empty array" do
    it "returns an empty array" do
      expect(my_transpose([[]])).to eq([])
    end
  end
  context "when given a multidimensional array" do
    it "transposes correctly" do
      expect(my_transpose([[0, 1, 2],[3, 4, 5],[6, 7, 8]])).to eq([[0, 3, 6],[1,4,7],[2,5,8]])
    end
  end
  context "when not given a nested array" do
    it "raises a TypeError" do
      expect{my_transpose([1])}.to raise_error(TypeError)
    end
  end
end

RSpec.describe "#stock_market" do
  context "when given an empty array" do 
    it "returns nil" do 
      expect(stock_market([])).to eq(nil)
    end
  end
  
  it "returns the most profitable pair of days" do
    stocks = [10, 9, 20]
    expect(stock_market(stocks)).to eq([1,2])
  end

  it "does not sell before it buys" do
    stocks = [90, 9, 10]
    expect(stock_market(stocks)).to eq([1,2])
  end

end















