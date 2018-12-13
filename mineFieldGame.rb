=begin
 def load_board
    mine_field = []
    File.open("mines.txt", 'r') do |f|
        f.gets
        f.each_line do |line|
            mine_field.push line.chomp.split('')
        end
    end
    
    return mine_field
end

def create_hint_board(board)
    hint = Array.new
    
    for i in (0..board.size-1)
        hint[i] = []
        for j in (0..board[i].size-1)
            hint
            if board[i][j] == '*'
                hint[i].push '*'
                else
                bombs = 0
                for x in (-1..1)
                    for y in (-1..1)
                        if i-x >= 0 &&
                            i-x < board.size &&
                            j-y >= 0 &&
                            j-y < board[i].size &&
                            board [i-x][j-y] == '*'
                            bombs += 1
                            
                        end
                    end
                end
                hint[i][j] = bombs
            end
        end
    end
    return hint
end

def print_board (board)
    board.each do |row|
        p row
    end
end

def pp_board (board)
    puts Array.new(board[0].size*2+1, '-').join('')
    board.each do |row|
        puts "|" + row.join('|') + "|"
        puts Array.new(row.size*2+1, '-').join('')
    end
end

def copy_to_blank(board)
    blank = Array.new
    for i in 0..(board.size-1)
        blank << Array.new(board[i].size, '.')
    end
    blank
end

def play(board)
    puts "Welcome to Minesweeper!"
    puts
    puts
    puts
    hint = create_hint_board(board)
    game = copy_to_blank(board)
    puts "Starting"
    pp_board game
    #copy coords user puts in
    # start while loop
    coords = gets.chomp.split(' ')
    i = coords[0].to_i
    j = coords[1].to_i
    game[i][j] =
    hint[i][j]
    
    
    pp_board game
    
    puts
    puts "Hint"
    pp_board  hint
    #end while loop
    
end

#start the game
play load_board
=end
print("Enter the N....:")
N = gets.to_i
(N*5).times do
    print('_')
end
print("\n")
for i in(0...N)
    for j in(0...N)
        print("| . |")
    end
    print("\n")
end
mines = Array.new(N) {Array.new(2)}
rnd = Random.new
for a in(0...N)
    rndC = rnd.rand(0...N)
    rndR = rnd.rand(0...N)
    mines[rndR][rndC] = "*"
end
for x in(0...N)
    for y in(0...N)
        print("| #{mines[x][y]} |")
    end
    print("\n")
end
status = 1
score = 0
while status = 1 do
    print("Enter the field info wanna see ROW.......:")
    gR = gets.to_i
    print("Enter the field info wanna see COLUMN....:")
    gC = gets.to_i
    if(mines[gR][gC] == "*")
        print("Game Over! Your score is = #{score}")
        status = 0
    else
        for r in(0...N)
            for c in(0...N)
                if(r >= gR - 1 && r <= gR + 1 && c >= gC - 1 && c <= gC + 1)
                    print("| #{mines[r][c]} |")
                    score += 10
                else
                    print("| . |")
                    # BURADA KALDIM .. mines DİZİSİNE DEFAULT OLARAK "| . |" ATAMAM GEREK VE BU KISIMDA KONTROL EDERKEN mines[r][c] ELEMANI "*"`A EŞİT DEĞİL İSE DEĞERİNİ |   | YAPMALI VE ONDAN SONRA print(mines[r][c]) İFADESİ İLE EKRANA YAZDIRMALIYIM.....
                end
            end
            print("\n")
        end
    end
end
