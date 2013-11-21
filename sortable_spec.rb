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
		it "can be overridden by a block" do
			expect(Sortable.compare(3,4){|a,b| (a + b).even? ? -1 : 1}).to eq(1)
		end
	end

	context "swap(key1,key2)" do
		it "properly swaps elements in an array" do
			class Array
				include Sortable
			end
			expect([1,2,3,4].swap(0,3)).to eq([4,2,3,1])
		end
	end

	context "bubble_sort" do
		before :each do
			class Array
				include Sortable
			end
		end
		it "properly sorts an array if no block is given" do
		  expect((array = Array.new(rand(5) + 5){rand(10)}).bubble_sort).to eq(array.sort)
		end
		it "properly sorts an array if a block is given" do
			array = Array.new(rand(5) + 5){rand(10)}
			expect(array.bubble_sort{|a,b| a > b ? -1 : 1}).to eq(array.sort{|a,b| a > b ? -1 : 1})
		end
	end

	context "selection_sort" do
		before :each do
			class Array
				include Sortable
			end
		end
		it "properly sorts an array if no block is given" do
			expect((array = Array.new(rand(5) + 5){rand(10)}).selection_sort).to eq(array.sort)
		end
		it "properly sorts an array if a block is given" do
		  array = Array.new(rand(5) + 5){rand(10)}
			expect(array.selection_sort{|a,b| a > b ? -1 : 1}).to eq(array.sort{|a,b| a > b ? -1 : 1})
		end
	end
end