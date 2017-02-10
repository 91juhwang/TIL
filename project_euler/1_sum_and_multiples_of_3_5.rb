require 'benchmark'
# If we list all the natural numbers below 10 that are multiples of 3 or 5, we get 3, 5, 6 and 9. The sum of these multiples is 23.
# Find the sum of all the multiples of 3 or 5 below 1000.

def multiples_and_sum()
  time = Benchmark.realtime {
    arr = Array.new(999) { |i| i+1 }
    new_arr = []
    arr.map do |n|
      if n % 3 == 0 || n % 5 == 0
        new_arr.push(n)
      end
    end
    reduced_arr = new_arr.reduce(:+) 
    p reduced_arr
  }
  p "it took #{time} seconds"
end

multiples_and_sum()

def multiples_and_sum2()
  time = Benchmark.realtime {
    arr = Array.new(999) { |i| i + 1 }
    sum = 0
    arr.each do |n|
      if n % 3 == 0 || n % 5 == 0
        sum += n
      end
    end
    p sum 
  }
  p "it took #{time} seconds"
end
multiples_and_sum2() 
