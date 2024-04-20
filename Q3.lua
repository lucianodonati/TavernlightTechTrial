-- Immediatelly there's a problem with the function name, what's sth? maybe an abbreviation of "something"?
-- This function seems to remove a member from a player's party, needs to be renamed to something like "RemoveFromParty"

-- There's a dependency issue with the function: It's supposed to remove a member from a party but it is not given the dependencies to do so. 
-- It has to go and create it's own player, to then call getParty() to only then do it's job.
-- This needs to be moved to the player's scope and refactored to something like RemoveFromParty(Player member)

-- Seems that party members are stored in a map or dictionary, what's the key? an ID? Why do we use a "for k,v" if we never use the key value?
-- I'd assume k is the party member's "playerId" and v is the instanced Player() so that we can reference it when needed. 
-- If not, I'd make that or a simmilar change in :Party first.
function do_sth_with_PlayerParty(playerId, membername)
    player = Player(playerId)
    local party = player:getParty()

    for k,v in pairs(party:getMembers()) do
        if v == Player(membername) then
            party:removeMember(Player(membername))
        end
    end
end