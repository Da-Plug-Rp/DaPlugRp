
RegisterKeyMapping("+trailerConnect", "Connect any trailer", "keyboard", "j")

-- Use this function for job locking. If the job is correct, return true.
-- Please refer to your framework's job system for how to implement, I do not support
-- job checking integration. -Theebu
function allowed()
    return true
end
