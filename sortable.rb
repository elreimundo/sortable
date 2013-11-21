module Sortable
	extend self
	def compare(a,b)
		a > b ? 1 : a == b ? 0 : -1
	end

	def swap(key1,key2)
		self[key1], self[key2] = self[key2], self[key1]
		self
	end
end