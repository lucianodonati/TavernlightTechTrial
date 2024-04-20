// Function seems to be adding an item to a player

void Game::addItemToPlayer(const std::string& recipient, uint16_t itemId)
{
    Player* player = g_game.getPlayerByName(recipient);
    if (!player) {
        // When the player isn't loaded and empty new constructor is called
        player = new Player(nullptr);
        // And then loaded by reference with the recipient's state
        if (!IOLoginData::loadPlayerByName(player, recipient)) {
            // If we can't load a player we can't continue, but we should release the memory allocated above.
            return;
        }
    }

    // This creates an instance of the item that will be given to the player
    Item* item = Item::CreateItem(itemId); // Likely allocating memory in the process
    if (!item) {
        return;
    }

    g_game.internalAddItem(player->getInbox(), item, INDEX_WHEREEVER, FLAG_NOLIMIT);

    if (player->isOffline()) {
        IOLoginData::savePlayer(player); // Counterpart of loadPlayerByName()
    }

    // and we leave scope below without clearing any memory.
}