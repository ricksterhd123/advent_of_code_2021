require('.util')

function getMostCommonBits(lines)
    local tally = {}

    for i, line in ipairs(lines) do
        local strlen = #line
        for i = 1, strlen do
            if not tally[i] then
                tally[i] = 0
            end

            if line:sub(i, i) == "1" then
                tally[i] = tally[i] + 1
            end
        end
    end

    local gamma = ""
    local epsilon = ""

    for i, v in ipairs(tally) do
        if v > #lines / 2 then
            gamma = gamma .. "1"
            epsilon = epsilon .. "0"
        else
            gamma = gamma .. "0"
            epsilon = epsilon .. "1"
        end
    end
    return gamma, epsilon
end

function binaryToDecimal(binary)
    local strlen = #binary
    local result = 0

    for i = strlen, 1, -1 do
        local bit = binary:sub(i, i)
        local index = strlen - i
        if bit == "1" then
            result = result + 2 ^ index
        end
    end

    return result
end

local lines = readInputFile("day3")
local gamma, epsilon = getMostCommonBits(lines)
local gammaDecimal = binaryToDecimal(gamma)
local epsilonDecimal = binaryToDecimal(epsilon)

print(gammaDecimal, epsilonDecimal)
print(gammaDecimal * epsilonDecimal)
