require('.util')

local state = {
    y = 0,
    z = 0,
    aim = 0
}

local commands = {
    ["forward"] = {y = 1, z = 0, aim = 0},
    ["up"] = {y = 0, z = 0, aim = -1},
    ["down"] = {y = 0, z = 0, aim = 1}
}

function readCommand(state, instruction)
    local command, arg = string.match(instruction, "(%w+) (%d+)")
    assert(command and arg, "Could not read command")
    assert(commands[command], "Invalid command " .. instruction)

    local y = commands[command].y * arg
    local z = commands[command].z * arg
    local aim = commands[command].aim * arg

    if command == "forward" then
        z = z + (state.aim * arg)
    end

    return y, z, aim
end

function updateState(state, y, z, aim)
    state.y = state.y + y
    state.z = state.z + z
    state.aim = state.aim + aim
end

map(readInputFile("day2"), function (command)
    updateState(state, readCommand(state, command))
end)

print(state.y * state.z)
