-- Seems to set for the passed in player a flag of -1 and a magic number of 1000 of unknown meaning (perhaps a delay in ms?)
local function releaseStorage(player)
    player:setStorageValue(1000, -1)
end

-- Seems to be an event called for players on Log out
function onLogout(player)
    -- If flag is set, we need to clear it on logout.
    if player:getStorageValue(1000) == 1 then
        -- Instead of calling the function, we subscribe to an event. Not sure why, need more context.
        addEvent(releaseStorage, 1000, player)
    end
    return true
end

-- Thoughts: I don't see an aparent problem with the code without further context. 
-- Maybe I'd rename the functions or refactor if I knew why do we need to "releaseStorage" on logout.
-- Also the use of events is unclear, I'd need more context from the codebase.
-- Perhaps the flag implementation should be modified so that you don't have to use magic numbers like 1 and -1
-- and remember 1 is for released and -1 for dirty or vice-versa.