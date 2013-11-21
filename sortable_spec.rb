require_relative 'sortable.rb'

describe Sortable do
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

	context "insertion_sort" do
		before :each do
			class Array
				include Sortable
			end
		end
		it "properly sorts an array if no block is given" do
			expect((array = Array.new(rand(5) + 5){rand(10)}).insertion_sort).to eq(array.sort)
		end
		it "properly sorts an array if a block is given" do
		  array = Array.new(rand(5) + 5){rand(10)}
			expect(array.insertion_sort{|a,b| a > b ? -1 : 1}).to eq(array.sort{|a,b| a > b ? -1 : 1})
		end
	end
end