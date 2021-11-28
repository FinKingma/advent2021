require 'set'

file_path = File.expand_path("../input.txt", __FILE__)
input     = File.read(file_path)

set = input.split("\n").map(&:to_i).to_set

set.each do |x|
  expect = 2020 - x

  if set.include?(expect)
    puts expect * x
    break
  end
end
#gestolen van: https://github.com/gchan/advent-of-code-ruby