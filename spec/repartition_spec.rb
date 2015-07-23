require 'repartition'

describe "Array#partition" do
  it "returns two arrays when empty array given" do
    expect([].repartition { |n| n == 1 }).to eq [[], []]
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

    xit 'responds to a method passed in ampersand notation' do
      expect(ary.repartition(&:zero?)).to eq [[0], [1, 2, 3, 4, 5]]
    end

    xit 'returns an enumerable when no block is given' do
      expect(ary.repartition.class).to be Enumerator
    end
  end
end
