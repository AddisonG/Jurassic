void Full_Share_Actions() {
	string message = GetEventPlayerChatString()
	player targeted_player = Player(S2I(SubString(message, StringLength(message), StringLength(message))) - 1)
	player triggering_player = GetTriggerPlayer()
	
	// Share all of triggering players units with targeted player.
	SetPlayerAlliance(triggering_player, targeted_player, ALLIANCE_SHARED_CONTROL, true)
	SetPlayerAlliance(triggering_player, targeted_player, ALLIANCE_SHARED_ADVANCED_CONTROL, true)
	
	// Inform the player who granted full sharing.
	DisplayTimedTextToPlayer(triggering_player, 0, 0, 5, \
		"Full unit sharing privileges granted to " + GetPlayerName(targeted_player) + ".")
	
	// Inform the player who was granted full sharing.
	DisplayTimedTextToPlayer(targeted_player, 0, 0, 5, \
		GetPlayerName(triggering_player) + " has granted you full unit sharing privileges.")
}

//===========================================================================
void InitTrig_Full_Share() {
	trigger t = CreateTrigger()
	
	// Check if a player typed a string containing "-fshare ". Note the space.
	int player_num = 0
	while (player_num < 7) {
		TriggerRegisterPlayerChatEvent(t, Player(player_num), "-fshare ", false)
		player_num++
	}
	
	TriggerAddCondition(t, Condition(function Sharing_Conditions))
	TriggerAddAction(t, function Full_Share_Actions)
}