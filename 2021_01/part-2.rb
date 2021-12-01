file = File.open(File.join(File.dirname(__FILE__), 'input.txt'), 'r+')
file_lines = file.readlines.map(&:chomp)

lastValue = nil
score = 0
for index in (2...file_lines.length)
    currentValue = file_lines[index-2].to_i + file_lines[index-1].to_i + file_lines[index].to_i
    # p currentValue
    if lastValue and currentValue > lastValue
        score += 1
    end

    lastValue = currentValue
end
p score