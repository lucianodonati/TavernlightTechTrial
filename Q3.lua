-- Removes given memberID from partLead's party.
function RemoveFromParty(partyLead, toBeRemovedMemberId)
-- With more context I'd move this to somewhere where partyLead is the local self and I don't need to pass it around

    local party = partyLead:getParty()
    local partyMembers = party:getPartyMembers();

-- This requires to break down parties storage implementation into two paired arrays allowing to traverse them individually.
-- removeMemberByID() also removes the party member player instance at the same index. 
-- This allows to traverse players lists without having to accomodate heap space for their instances.
-- For the rest of the codebase, "party" can continue to be a set/dictionary.
    for memberID in partyMembers do
        if memberID == toBeRemovedMemberId then
            party:removeMemberByID(memberID)
        end
    end
end