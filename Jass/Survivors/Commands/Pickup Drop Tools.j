void Drop_Tools(unit survivor) {
	// Remove the harvest ability from the survivor
	UnitRemoveAbility(survivor, 'A009')
	DisplayTimedTextToPlayer(GetTriggerPlayer(), 0, 0, 3, \
		"Dropped tools. Type -pickup or -tools to pick them up again.")
}

void Pickup_Tools(unit survivor) {
	// Give survivor the harvest ability
	UnitAddAbility(survivor, 'A009')
	DisplayTimedTextToPlayer(GetTriggerPlayer(), 0, 0, 3, \
		"Picked up tools. Type -drop to drop them again.")
}

void Pickup_Drop_Tools_Actions() {
	string message = GetEventPlayerChatString()
	int triggering_player_id = GetPlayerId(GetTriggerPlayer())
	SURVIVORS[triggering_player_id].debug()
	if (message == "-drop") {
		Drop_Tools(SURVIVORS[triggering_player_id].getUnit())
	} else {
		Pickup_Tools(SURVIVORS[triggering_player_id].getUnit())
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

	TriggerAddAction(t, function Pickup_Drop_Tools_Actions)
}
