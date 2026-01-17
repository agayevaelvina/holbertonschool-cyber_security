require 'prime'

def prime(number)
  return false if number < 2
  Prime.prime?(number)
end

