require 'repartition'

describe "Array#partition" do
  it "returns two arrays when no block given" do
    expect([].repartition).to eq [[], []]
  end

  context "returns in the left array values that the block evaluates to true" do
    let(:ary) { [0, 1, 2, 3, 4, 5] }

    xit 'the whole array when the block always evaluates true' do
      expect(ary.repartition {|i| true }).to eq [[ary], []]
    end

    xit 'an empty array when the block always evaluates to false' do
      expect(ary.repartition {|i| false }).to eq [[], [ary]]
    end

    xit 'an empty array when the block always evaluates to nil' do
      expect(ary.repartition {|i| nil }).to eq [[], [ary]]
    end

    xit 'evaluates simple math operations' do
      expect(ary.repartition {|i| i % 2 == 0 }).to eq [[0, 2, 4], [1, 3, 5]] 
    end

    xit 'responds to a method passed a symbol' do
      expect(ary.repartition(:zero?)).to eq [[0], [1, 2, 3, 4, 5]]
    end
  end
end
