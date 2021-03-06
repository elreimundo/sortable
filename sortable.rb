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

	def insertion_sort(&block)
		array = self.map{|x| x}
		h_sort(array,1,&block)
	end

	def merge_sort(&block)
		array = self.map {|x| x}
		aux = Array.new(array.length)
		recursive_sort(array,aux,0,array.length - 1,&block)
	end

	def quick_sort(&block)
		array = self.map{|x| x}.shuffle
		q_recursive_sort(array, 0, array.length - 1,&block)
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

	def shell_sort(&block)
		array = self.map{|x| x}
		h = 1
		while h < array.length / 3
			h = h * 3 + 1
		end
		while h >= 1
			array = h_sort(array,h,&block)
			h = h / 3
		end
		array
	end

	private

	def compare(a,b)
		return yield(a,b) if block_given?
		a < b ? -1 : a == b ? 0 : 1
	end

	def swap(key1, key2, array = self)
		array[key1], array[key2] = array[key2], array[key1]
		array
	end

	def h_sort(array,h,&block)
		array.each_index do |i|
			j = i
			while j > h-1 && compare(array[j],array[j-h],&block) == -1
				swap(j,j-h,array)
				j -= h
			end
		end
		array
	end

	def recursive_sort(array,aux,lo,hi,&block)
		return if hi <= lo
		mid = lo + (hi - lo) / 2
		recursive_sort(array,aux,lo,mid,&block)
		recursive_sort(array,aux,mid+1,hi,&block)
		merge(array,aux,lo,mid+1,hi,&block)
	end

	def merge(part_sorted_arry,aux,lo,mid,hi,&block)
		i = lo
		while i <= hi
			aux[i] = part_sorted_arry[i]
			i += 1
		end
		i, j, k = lo, mid, lo
		while k <= hi
			part_sorted_arry[(k += 1) - 1] = if i >= mid
				aux[(j += 1) - 1]
			elsif j > hi then aux[(i += 1) - 1]
			elsif compare(aux[j],aux[i],&block) == -1 then aux[(j += 1) - 1]
			else aux[(i += 1) - 1]
			end
		end
		part_sorted_arry
	end

	def q_recursive_sort(array,lo,hi,&block)
		return array if lo >= hi
		j = partition(array,lo,hi,&block)
		q_recursive_sort(array,lo,j-1,&block)
		q_recursive_sort(array,j+1,hi,&block)
	end

	def partition(array,lo,hi,&block)
		i, j = lo, hi + 1
		while i < j
			while compare(array[i+=1],array[lo],&block) == -1 
				break if i == hi
			end
			while compare(array[lo],array[j-=1],&block) == -1 
				break if j == lo
			end
			swap(i,j,array) unless i >= j
		end
		swap(lo,j,array)
		j
	end
end