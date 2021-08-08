void drop_tools(unit survivor) {
	// Remove the harvest ability from the survivor
	UnitRemoveAbility(survivor, 'HRVT')
	DisplayTimedTextToPlayer(GetTriggerPlayer(), 0, 0, 3, \
		"Dropped tools. Type -pickup or -tools to pick them up again.")
}

void pickup_tools(unit survivor) {
	// Give survivor the harvest ability
	UnitAddAbility(survivor, 'HRVT')
	DisplayTimedTextToPlayer(GetTriggerPlayer(), 0, 0, 3, \
		"Picked up tools. Type -drop to drop them again.")
}

void pickup_drop_tools_actions() {
	string message = GetEventPlayerChatString()
	int triggering_player_id = GetPlayerId(GetTriggerPlayer())
	SURVIVORS[triggering_player_id].debug()
	if (message == "-drop") {
		drop_tools(SURVIVORS[triggering_player_id].get_unit())
	} else {
		pickup_tools(SURVIVORS[triggering_player_id].get_unit())
	}
}

//===========================================================================
void InitTrig_Pickup_Drop_Tools() {
	trigger t = CreateTrigger()

	int i = 0
	while (i <= 6) { // 0 to 6
		TriggerRegisterPlayerChatEvent(t, Player(i), "-pickup", true)
		TriggerRegisterPlayerChatEvent(t, Player(i), "-tools", true)
		TriggerRegisterPlayerChatEvent(t, Player(i), "-drop", true)
		i++
	}

	TriggerAddAction(t, function pickup_drop_tools_actions)
}
