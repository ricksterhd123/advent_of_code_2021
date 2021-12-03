function readInputFile(filePath)
    local f = assert(io.open(filePath, "r"))
    local input = {}
    local eof = false
    while not eof do
        local next = f:read()
        if not next then
            eof = true
        else
            table.insert(input, next)
        end
    end
    return input
end

function map(t, fn)
    local ct = {}
    for i, v in pairs(t) do
        ct[i] = fn(v)
    end
    return ct
end
