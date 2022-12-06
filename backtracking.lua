if arg[2] == "debug" then
    require("lldebugger").start()
end

local width = 5
local height = 5
math.randomseed(os.time())
local N, S, E, W = 1, 2, 4, 8

grid2 = {}
for i = 0 ,height do
    grid2[i] = {}
end

function DX(dir)
    if (dir == E) then
        return 1
    end
    if (dir == W) then
        return -1
    end
    if (dir == N) then
        return 0
    end
    if (dir == S) then
        return 0
    end
end

function DY(dir)
    if (dir == E) then
        return 0
    end
    if (dir == W) then
        return 0
    end
    if (dir == N) then
        return 1
    end
    if (dir == S) then
        return -1
    end
end

function Opposite(dir)
    if (dir == E) then
        return W
    end
    if (dir == W) then
        return E
    end
    if (dir == N) then
        return S
    end
    if (dir == S) then
        return N
    end
end

function between(test, num1, num2)
    if (test >= num1 and test <= num2) then
        return true
    end
    return false
end

function CarvePassagesHandler()
    CarvePassages(0, 0, grid2)
    for i=0, #grid2-1 do
        for j=0, #grid2[i]-1 do
            print(grid2[j][i])
        end
        print("line"..i)
    end
    return grid2
end

function CarvePassages(cx, cy, grid)
    local directions = {N, E, S, W}
    local directions1 = shuffle(directions)
    local nx, ny
    directions = directions1

    for i=1, #directions do
        nx, ny = cx + DX(directions[i]), cy + DY(directions[i])

        if between(ny, 0, height-1) and between(nx, 0, width-1) and grid[ny][nx] == nil then
            grid[cy][cx] = grid[cy][cx] or directions[i]
            grid[ny][nx] = grid[ny][nx] or Opposite(directions[i])
            CarvePassages(nx, ny, grid)
        end
    end
end

function shuffle(table)
    for i = #table, 2, -1 do
        local j = math.random(i)
        table[i], table[j] = table[j], table[i]
    end
    return table
end

local love_errorhandler = love.errhand
function love.errorhandler(msg)
    if lldebugger then
        error(msg, 2)
    else
        return love_errorhandler(msg)
    end
end