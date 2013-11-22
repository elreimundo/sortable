require 'benchmark'
require_relative 'sortable.rb'

class Array
	include Sortable
end

SORTABLE_METHODS = [:insertion_sort, :selection_sort, :bubble_sort, :shell_sort, :merge_sort, :quick_sort]

n = ARGV[0] ? ARGV[0].to_i : 10000
test_array = Array.new(n){rand(100)}

Benchmark.bm(10) do |x|
	SORTABLE_METHODS.each do |method|
		x.report(method.to_s.split('_')[0]) {test_array.send(method)}
	end
end