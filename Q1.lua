-- Sets the flag for the given player (Still not sure what the 1000 is..)
local function setStorageFlag(player)
    player:setStorageValue(1000, 1)
end

-- Clears the flag (Why do we need a flag?)
local function clearStorageFlag(player)
    player:setStorageValue(1000, -1)
end

-- Checks for the flag
-- Removes the need to remember the value for the flag every time you use it
local function isStorageFlagSet(player)
    return player:getStorageValue(1000) == 1
end

-- Same code as before, but cleaner.
-- Still don't know why we use an event or why do we have flags for this.
function onLogout(player)
    if isStorageFlagSet(player) then
        addEvent(clearStorageFlag, 1000, player)
    end
    return true
end

-- Final Thouhts: Without much context there isn't much I can do. 
-- Not a fan of flags myself but if we need to, I'd make a bitwise set of masks for all the flags and implement a wrapper to use them

