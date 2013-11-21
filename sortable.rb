module Sortable
	def bubble_sort(&block)
		array = self.map{|x| x}
		array.each_index do |i|
			j = i + 1
			while j < array.length
				swap(i,j,array) if compare(array[i],array[j],&block) == 1
				j += 1
			end
		end
		array
	end

	def h_sort(array,h,&block)
		array.each_index do |i|
			j = i
			while j > 0 && compare(array[j],array[j-1],&block) == -1
				swap(j,j-1,array)
				j -= 1
			end
		end
		array
	end

	def insertion_sort(&block)
		array = self.map{|x| x}
		h_sort(array,1,&block)
	end

	def selection_sort(&block)
		array = self.map{|x| x}
		array.each_index do |i|
			min_idx = i
			j = i
			while j < array.length
				min_idx = j if compare(array[j],array[min_idx],&block) == -1
				j += 1
			end
			swap(i,min_idx,array) unless i == min_idx
		end
		array
	end

	def compare(a,b)
		return yield(a,b) if block_given?
		a < b ? -1 : a == b ? 0 : 1
	end

	def swap(key1, key2, array = self)
		array[key1], array[key2] = array[key2], array[key1]
		array
	end
end