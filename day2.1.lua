require('.util')

local state = {
    y = 0,
    z = 0
}

local commands = {
    ["forward"] = {y = 1, z = 0},
    ["up"] = {y = 0, z = -1},
    ["down"] = {y = 0, z = 1}
}

function readCommand(instruction)
    local command, arg = string.match(instruction, "(%w+) (%d+)")
    assert(command and arg, "Could not read command")
    assert(commands[command], "Invalid command " .. instruction)

    local y = commands[command].y * arg
    local z = commands[command].z * arg

    return y, z
end

function updateState(state, y, z)
    state.y = state.y + y
    state.z = state.z + z
end

map(readInputFile("day2"), function (command)
    updateState(state, readCommand(command))
end)

print(state.y * state.z)
