print("Enter the N....:")
N = gets.to_i
print("\n")
fields = Array.new(N) {Array.new(N, "| ? ")}
mines = Array.new(N) {Array.new(N)}
rnd = Random.new
(Math.sqrt(N).to_i).times do
    rndC = rnd.rand(0...N)
    rndR = rnd.rand(0...N)
    mines[rndR][rndC] = "| * "
end
print("   ")
for n in(0...N)
    print("  #{n} ")
end
print("\n   ")
(N * 4 + 1).times do
    print('_')
end
print("\n")
for x in(0...N)
    print("#{x}  ")
    for y in(0...N)
        if(fields[x][y] != "| * ")
            print("#{fields[x][y]}")
        else
            print("| ? ")
        end
    end
    print("|\n")
end
print("   ")
(N * 4 + 1).times do
    print('¯')
end
print("\n")
status = 1
score = 0
while status == 1 do
    var = 0
    print("\nEnter the field info wanna see ROW.......: ")
    gR = gets.to_i
    print("Enter the field info wanna see COLUMN....: ");
    gC = gets.to_i
    puts %x!clear!
    if(mines[gR][gC] == "| * ")
        print("Game Over! Your score is = #{score} \n")
        status = 0
    else
        print("   ")
        for n in(0...N)
            print("  #{n} ")
        end
        print("\n   ")
        (N * 4 + 1).times do
            print('_')
        end
        print("\n")
        for r in(0...N)
            print("#{r}  ")
            for c in(0...N)
                if(r >= gR - 1 && r <= gR + 1 && c >= gC - 1 && c <= gC + 1)
                    if(mines[r][c] == "| * ")
                        fields[r][c] = "| * "
                    else
                        fields[r][c] = "|   "
                    end
                    print("#{fields[r][c]}")
                else
                    print("#{fields[r][c]}")
                end
            end
            print("|\n")
        end
        print("   ")
        (N * 4 + 1).times do
            print('¯')
        end
        print("\n")
        score += 1
        for r in(0...N)
            for c in(0...N)
                if(fields[r][c] == "| ? ")
                    var = 1
                end
            end
        end
        if(var == 1)
            status = 1
        else
            print("Congrats! YOU WIN! Your score is = #{score * 2}\n")
            status = 0
        end
    end
end
