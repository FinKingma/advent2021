file = File.open(File.join(File.dirname(__FILE__), 'input.txt'), 'r+')
file_lines = file.readlines.map(&:chomp)

lastValue = nil
score = 0
for line in file_lines
    if lastValue and line.to_i > lastValue
        score += 1
    end

    lastValue = line.to_i
end
p score