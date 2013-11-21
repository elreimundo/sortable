require_relative 'sortable.rb'

describe Sortable do
	context "compare(a,b)" do
		it "returns 1 if a > b" do
			expect(Sortable.compare(r = rand(100),r-(rand(10)+1))).to eq(1)
		end
		it "returns 0 if a = b" do
			expect(Sortable.compare(r = rand(100),r)).to eq(0)
		end
		it "returns -1 if a < b" do
			expect(Sortable.compare(r = rand(100),r+(rand(10)+1))).to eq(-1)
		end
	end

	context "swap(key1,key2)" do
		it "properly swaps elements in an array" do
			expect([1,2,3,4].swap(0,3)).to eq([4,2,3,1])
		end
	end
end