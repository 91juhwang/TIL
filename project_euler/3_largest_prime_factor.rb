require 'benchmark'
# The prime factors of 13195 are 5, 7, 13 and 29.
# What is the largest prime factor of the number 600851475143 ?

# 1.find factors of the number
# 2. check if those factors are prime
# prime factor = number / prime number = 0
def prime?(n)
  (2...n).each { |x| return false if n % x == 0 }
  true
end

def prime_factor(n) 
  time = Benchmark.realtime {
    # initial smallest prime factor is 2
    # multiples of prime factors equal sum_products
    i = 2
    sum_products = 1
    a = []
    # sum_products must be smaller than n
    while sum_products < n 
      # if i is a prime number and the given number is divisible by this prime factor
      # repeat the division until it is not divisible.
      # every time it divides, record that prime factor in the array a.
      # add 1 to the i to repeat the above steps with new prime number
      # return the largest prime factor by finding the last element of the array, 
      # or the second to the last if last is 1 
      if n % i == 0 && prime?(i)
        until n % i != 0 
          n = n / i 
          a << n
          sum_products *= i
          answer = a.last
          answer = a[-2] if n == 1
        end
      else 
        i += 1
      end
    end
    p a
    p answer
  }
  p "it took #{time} seconds"
end

prime_factor(24)
prime_factor(27)
prime_factor(600_851_475_143)

