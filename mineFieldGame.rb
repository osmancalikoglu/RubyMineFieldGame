print("Enter the N....:")
N = gets.to_i
(N*5).times do
    print('_')
end
print("\n")
fields = Array.new(N) {Array.new(N, "| ? |")}
mines = Array.new(N) {Array.new(N)}
rnd = Random.new
for a in(0...N)
    rndC = rnd.rand(0...N)
    rndR = rnd.rand(0...N)
    mines[rndR][rndC] = "| * |"
end
for x in(0...N)
    for y in(0...N)
        if(fields[x][y] != "| * |")
            print("#{fields[x][y]}")
        else
            print("| ? |")
        end
    end
    print("\n")
end
status = 1
score = 0
var = 1
while status == 1 do
    print("\nEnter the field info wanna see ROW.......: ")
    gR = gets.to_i
    print("Enter the field info wanna see COLUMN....: ");
    gC = gets.to_i
    puts %x!clear!
    if(mines[gR][gC] == "| * |")
        print("Game Over! Your score is = #{score} \n")
        status = 0
    else
        for r in(0...N)
            for c in(0...N)
                if(r >= gR - 1 && r <= gR + 1 && c >= gC - 1 && c <= gC + 1)
                    if(mines[r][c] == "| * |")
                        fields[r][c] = "| * |"
                    else
                        fields[r][c] = "|   |"
                    end
                    print("#{fields[r][c]}")
                else
                    print("#{fields[r][c]}")
                end
            end
            print("\n")
        end
        score += 1
    end
end
