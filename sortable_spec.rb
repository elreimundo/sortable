require_relative 'sortable.rb'

describe Sortable do
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

	context "shell_sort" do
		before :each do
			class Array
				include Sortable
			end
		end
		it "properly sorts an array if no block is given" do
			expect((array = Array.new(rand(5) + 5){rand(10)}).shell_sort).to eq(array.sort)
		end
		it "properly sorts an array if a block is given" do
		  array = Array.new(rand(5) + 5){rand(10)}
			expect(array.shell_sort{|a,b| a > b ? -1 : 1}).to eq(array.sort{|a,b| a > b ? -1 : 1})
		end
	end

	context "merge_sort" do
		before :each do
			class Array
				include Sortable
			end
		end
		it "properly sorts an array if no block is given" do
			expect((array = Array.new(rand(5) + 5){rand(10)}).merge_sort).to eq(array.sort)
		end
		it "properly sorts an array if a block is given" do
		  array = Array.new(rand(5) + 5){rand(10)}
			expect(array.merge_sort{|a,b| a > b ? -1 : 1}).to eq(array.sort{|a,b| a > b ? -1 : 1})
		end
	end
end