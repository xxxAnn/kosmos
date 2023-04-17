-- Copyright (C) 2023 Ann Mauduy-Decius

-- A default clock implementation
-- This should probably not be used 
-- except in rudimentary code
-- because the timer is extremely inaccurate
-- if LOVE or sockets or another library is used
-- their timers should be used

local clock = {}

local clock_manager = {}

function clock.every_s(s)
    local o = {}

    function o.call_func(f, ...)
        local v = table.pack(...)
        local func = function (...)
            f(...)
            return os.time() + s/2
        end
        table.insert(clock_manager, {f = func, next_execution = os.time(), args = v})
    end

    return o
end

function clock.execute_until_condition(c) 
    while c() do
        for _, tsk in ipairs(clock_manager) do
            if os.time() > tsk.next_execution then
                tsk.next_execution = tsk.f(table.unpack(tsk.args))
            end
        end
    end
end

function clock.execute_for_s(s) 
    local v = os.time() + s
    clock.execute_until_condition(function () return os.time() < v end)
end

function clock.execute(c) 
    clock.execute_until_condition(function () return true end)
end

return clock