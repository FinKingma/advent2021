file = File.open(File.join(File.dirname(__FILE__), 'input.txt'), 'r+')
file_lines = file.readlines.map(&:chomp)

class BingoBoard
    def initialize
        @bingo_board = Array.new()
        @finished = false
    end

    def addLine(line)
        @bingo_board[@bingo_board.length] = line
    end

    def mark(luckyNumber)
        @bingo_board.collect! do |i|
            if i.include?(luckyNumber)
                i[i.index(luckyNumber)] = "X"; i
            else 
                i
            end
        end
    end

    def print
        for line in @bingo_board
            p line
        end
        p ""
    end

    def finish
        @finished = true
    end

    def hasFinished
        return @finished
    end

    def verify(luckyNumber)
        # check horizontal lines
        for line in @bingo_board
            if line.count("X") >= 5
                p "horizontal bingo found at " + line.to_s
                p calculateScore(luckyNumber)
                return true
            end
        end

        #check vertical lines
        for index in 0...5
            column = @bingo_board.map{|line|line[index,1].first}
            if (column.count("X") >= 5)
                p "vertical bingo found at column " + index.to_s
                p calculateScore(luckyNumber)
                return true
            end
        end

        return false

    end

    def calculateScore(luckyNumber)
        score = 0
        for line in @bingo_board
            for num in line
                if num != "X"
                    score += num.to_i
                end
            end
        end
        return score * luckyNumber.to_i
    end

end

luckyNumbers = file_lines[0].split(/\s*,\s*/)
boards = Array.new
currentBoard = -1

# fill Boards
for index in (1...file_lines.length)
    if file_lines[index] == ""
        currentBoard += 1
        boards[currentBoard] = BingoBoard.new
    else 
        boards[currentBoard].addLine(file_lines[index].split)
    end
end

for luckyNumber in luckyNumbers
    for board in boards
        if (!board.hasFinished) 
            board.mark(luckyNumber)
            if board.verify(luckyNumber)
                board.finish
            end
        end
    end
end