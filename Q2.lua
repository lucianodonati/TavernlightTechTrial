function printSmallGuildNames(memberCount)
    -- TODO: Move queries to a separate file, outside game logic files.
    -- Replace by calling something like "DB.Store.GetNonFullGuildNames(guildName)"
    local selectGuildQuery = "SELECT name FROM guilds WHERE %d < max_members;"
    local resultId = db.storeQuery(string.format(selectGuildQuery, memberCount))
    local guildName = result.getString("name")
    
    print(guildName)
end