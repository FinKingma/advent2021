file = File.open(File.join(File.dirname(__FILE__), 'input.txt'), 'r+')
file_lines = file.readlines.map(&:chomp)

gamma = ""
epsilon = ""
for index in (0...file_lines[0].length)
    index_lines = file_lines.map{|string|string[index,1]}
    gamma += index_lines.max_by{|string|index_lines.count(string)}
    epsilon += index_lines.min_by{|string|index_lines.count(string)}
end
p gamma.to_i(2) * epsilon.to_i(2)