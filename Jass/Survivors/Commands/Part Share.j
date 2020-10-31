void Part_Share_Actions() {
	string message = GetEventPlayerChatString()
	player targeted_player = Player(S2I(SubString(message, StringLength(message), StringLength(message))) - 1)
	player triggering_player = GetTriggerPlayer()

	// Partially share triggering players units with targeted player.
	SetPlayerAlliance(triggering_player, targeted_player, ALLIANCE_SHARED_CONTROL, true)
	SetPlayerAlliance(triggering_player, targeted_player, ALLIANCE_SHARED_ADVANCED_CONTROL, false)

	// Inform the player who granted partial sharing.
	DisplayTimedTextToPlayer(triggering_player, 0, 0, 5, \
		"Partial unit sharing privileges granted to " + GetPlayerName(targeted_player) + ".")

	// Inform the player who was granted partial sharing.
	DisplayTimedTextToPlayer(targeted_player, 0, 0, 5, \
		GetPlayerName(triggering_player) + " has granted you partial unit sharing privileges.")
}

//===========================================================================
void InitTrig_Part_Share() {
	trigger t = CreateTrigger()

	// Check if a player typed a string containing "-share " or "-pshare".
	// Note the space.
	int player_num = 0
	while (player_num < 7) {
		TriggerRegisterPlayerChatEvent(t, Player(player_num), "-share ", false)
		TriggerRegisterPlayerChatEvent(t, Player(player_num), "-pshare ", false)
		player_num++
	}

	TriggerAddCondition(t, Condition(function Sharing_Conditions))
	TriggerAddAction(t, function Part_Share_Actions)
}
