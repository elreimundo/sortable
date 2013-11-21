#Sortable

The Sortable module implements different sort algorithms, which have been adapted from the Algorithms I course on Coursera, offered through Princeton University and designed by Robert Sedgewick and Kevin Wayne.

The file is presented as a module that can be included in place of (or in parallel with) Ruby's Enumerable module.

Note: any class that includes Sortable must also have an instance method .map that accepts a block and returns an array.

## Running tests

After cloning this repository, you can run the test suite from the repo directory by running

    $ rspec sortable_spec.rb

## Using the Sortable module

###methods

Sortable includes five sort methods: bubble\_sort, selection\_sort, insertion\_sort, shell\_sort, and merge\_sort. 

###requirements

Sortable can be included as part of any class that has an instance method .map that accepts a block and returns an array.

###blocks

The Sortable methods allow a block with two parameters, *a* and *b*, and a comparator that outputs -1 (*a* should be to the left of *b*), 0 (*a* and *b* are interchangeable), or 1 (*a* should be to the right of *b*).

Example (sort integers as though they were strings):

    [1,5,100,23].merge_sort do |a,b|
      case
        when a.to_s < b.to_s then -1
        when a.to_s == b.to_s then 0
        else 1
      end
    end
    #=>[1,100,23,5] 

###usage

To include the Sortable module in your Ruby code, copy the sortable.rb file to your Ruby library directory. At the top of your Ruby file, type:

    require 'sortable'

You can then include the Sortable module in any class as you would any Ruby module:

    class Foo
      include Sortable
    end

## Speed Tests

The whole purpose behind good algorithm design is to optimize the code's performance in time (how long the code takes to run) and space (how much memory the code requires). In order to demonstrate how much faster are the efficient algorithms (shell\_sort and merge\_sort) than the less efficient algorithms, this repo comes with a file designed to benchmark the performance of each method in Sortable.

The benchmark sorts a randomly-generated array of default size 10,000 integers. To view this benchmark, simply run (with optional array_size argument)

    $ ruby speed_test.rb [array_size]

Please note that, due to the inefficiency of the slower tests, increasing the default array size significantly beyond 10,000 is strongly discouraged. One additional note: the Ruby interpreter will not read comma-delimited numbers properly; the correct way to indicate 10,000 is either `10000` (no comma) or `10_000` (underscore-delimited)