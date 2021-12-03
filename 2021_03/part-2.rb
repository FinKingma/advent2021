file = File.open(File.join(File.dirname(__FILE__), 'input.txt'), 'r+')
file_lines = file.readlines.map(&:chomp)

filtered_lines = file_lines

length = filtered_lines[0].length
currentPos = 0
char_max = nil
while currentPos < length
    index_lines = filtered_lines.map{|string|string[currentPos,1]}
    if index_lines.count("1") >= (filtered_lines.length.to_f/2)
        char_max = "1"
    else
        char_max = "0"
    end
    filtered_lines = filtered_lines.select{ | string | string[currentPos,1] == char_max}
    currentPos += 1
end

oxygen_rating = filtered_lines[0].to_i(2)

filtered_lines = file_lines
length = filtered_lines[0].length
currentPos = 0
char_min = nil
while currentPos < length
    if (filtered_lines.length == 1)
        break
    end
    index_lines = filtered_lines.map{|string|string[currentPos,1]}
    if index_lines.count("1") < (filtered_lines.length.to_f/2)
        char_min = "1"
    else
        char_min = "0"
    end
    filtered_lines = filtered_lines.select{ | string | string[currentPos,1] == char_min}
    currentPos += 1
end
co2_scrubber_rating = filtered_lines[0].to_i(2)

p oxygen_rating * co2_scrubber_rating