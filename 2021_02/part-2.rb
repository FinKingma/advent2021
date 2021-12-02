file = File.open(File.join(File.dirname(__FILE__), 'input.txt'), 'r+')
file_lines = file.readlines.map(&:chomp)

forwardPos = 0
depth = 0
aim = 0
for line in file_lines
    vals = line.split
    case vals[0]
    when "forward"
        forwardPos += vals[1].to_i
        depth += vals[1].to_i * aim
    when "down"
        aim += vals[1].to_i
    when "up"
        aim -= vals[1].to_i
    end
end
p forwardPos * depth