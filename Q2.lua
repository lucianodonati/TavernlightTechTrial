-- Comment says that this prints all guilds names that have less members than the max allowed,
-- in other words it should print the names of guilds that aren't full as far as I understand.

function printSmallGuildNames(memberCount)
    -- This SQL query seems to be incorrectly comparing "max_members" to the "memberCount"
    -- If this is a normalized SQL table then max_members likely represents the maximum number of members a given guild is allowed to have.
    -- Otherwise max_members is the same value for all guilds and it shouldn't even be a value on that table to begin with.

    -- The rest of the code seems to be related to the DB.
    -- There doesn't seem to be a problem with it except for the fact that we're mixing DB code with game logic in the same file
    -- I'd keep db code and queries separated from guild and gameplay code.
    local selectGuildQuery = "SELECT name FROM guilds WHERE max_members < %d;"
    local resultId = db.storeQuery(string.format(selectGuildQuery, memberCount))
    local guildName = result.getString("name")
    print(guildName)
    end