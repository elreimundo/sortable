module Sortable
	extend self
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

	def compare(a,b)
		return yield(a,b) if block_given?
		a < b ? -1 : a == b ? 0 : 1
	end

	def swap(key1, key2, array = self)
		array[key1], array[key2] = array[key2], array[key1]
		array
	end
end