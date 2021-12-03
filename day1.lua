require('.util')

-- part one
function countIncrease(list)
    local count = 0
    for i = 1, #list-1 do
        if list[i + 1] > list[i] then
            count = count + 1
        end
    end
    return count
end

-- part two
function countIncreaseSum(list, n)
    assert(#list >= n)

    local count = 0
    local lastSum = 0

    for i = 0, #list-n-1 do
        local sum1 = 0
        local sum2 = 0

        for j = 1, n do
            sum1 = sum1 + list[i+j]
            sum2 = sum2 + list[i+j+1]
        end

        if sum2 > sum1 then
            count = count + 1
        end

        lastSum = sum
    end

    return count
end

local input = map(readInputFile("./day1"), tonumber)
print("Part 1:", countIncrease(input))
print("Part 2:", countIncreaseSum(input, 3))
