file = File.open(File.join(File.dirname(__FILE__), 'input.txt'), 'r+')
file_lines = file.readlines.map(&:chomp)
for line in file_lines
    for checkLine in file_lines
        if line.to_i + checkLine.to_i == 2020 and line != checkLine
            p line.to_i * checkLine.to_i
            return
        end
    end
end
# p file_lines

#https://github.com/gchan/advent-of-code-ruby