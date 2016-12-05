function scan(str, exp)
    local first, last = string.find(str, exp)
    if first then
        return string.sub(str, first, last)
    else
        return nil
    end
end



function read_game_file(file_name)
    local lines = {}
    local jumps = {}
    local vars  = {}

    for line in io.lines(file_name) do
        if not string.find(line, "^#") and line ~= "" then
            lines[#lines+1] = line
        end
    end

    for n, str in ipairs(lines) do
        -- jumps
        local first, last = string.find(str, "@%s*[%a_]+")
        if first then
            jump_name = string.sub(str, first, last)
            jump_name = string.gsub(jump_name, "[@%s]+", "")
            jumps[jump_name] = n
        end
    end

    return {
        lines = lines,
        jumps = jumps,
        vars  = vars,
        ip    = 1
    }
end



function run_game(state)
    local lines = state.lines
    local jumps = state.jumps

    function check_jumps(line)
        for name, line_num in pairs(jumps) do
            if string.find(line, "^->%s*" .. name) then
                state.ip = line_num
            end
        end
    end

    function check_print(line)
        if not string.find(line, "@") then
            print(line)
        end
        state.ip = state.ip + 1
    end

    function check_condition(line)
        if string.find(line, "?") then
            local condition = scan(line, "%b()")
            if condition then
                condition = string.sub(condition, 2, #condition-1)
                print(condition)
            end
        end
        state.ip = state.ip + 1
    end

    while state.ip <= #lines do
        check_jumps(lines[state.ip])
        check_print(lines[state.ip])
        -- check_condition(lines[state.ip])
    end
end

local state = read_game_file(arg[1])
assert(state)

run_game(state)
