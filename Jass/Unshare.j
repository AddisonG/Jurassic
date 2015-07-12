void Unshare_Actions() {
	string message = GetEventPlayerChatString()
	player targeted_player = Player(S2I(SubString(message, StringLength(message), StringLength(message))) - 1)
	player triggering_player = GetTriggerPlayer()
	
	// Remove targeted players access to triggering players units. Vision is retained.
	SetPlayerAlliance(triggering_player, targeted_player, ALLIANCE_SHARED_CONTROL, false)
	SetPlayerAlliance(triggering_player, targeted_player, ALLIANCE_SHARED_ADVANCED_CONTROL, false)
	
	// Inform the player who withdrew sharing.
	call DisplayTimedTextToPlayer(triggering_player, 0, 0, 5.00, \
		"Unit sharing privileges withdrawn from " + GetPlayerName(targeted_player) + ".")
	
	// Inform the player who had sharing withdrawn.
	call DisplayTimedTextToPlayer(targeted_player, 0, 0, 5.00, \
		GetPlayerName(triggering_player) + " has withdrawn your unit sharing privileges.")
}

//===========================================================================
void InitTrig_Unshare() {
	trigger t = CreateTrigger()
	
	// Check if a player typed a string containing "-unshare ". Note the space.
	integer player_num = 0
	while (player_num < 7) {
		TriggerRegisterPlayerChatEvent(t, Player(player_num), "-unshare ", false)
		player_num++
	}
	
	TriggerAddCondition(t, Condition(function Sharing_Conditions))
	TriggerAddAction(t, function Unshare_Actions)
}