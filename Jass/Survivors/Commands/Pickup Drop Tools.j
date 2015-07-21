void Drop_Tools() {
	// Find the survivor that the triggering player owns
	if (GetOwningPlayer(GetEnumUnit()) == GetTriggerPlayer()) {
		// And remove the harvest ability
		UnitRemoveAbility(GetEnumUnit(), 'A009')
		DisplayTimedTextToPlayer(GetLocalPlayer(), 0, 0, 3, \
			"Dropped tools. Type -pickup or -tools to pick them up again.")
	}
}

void Pickup_Tools() {
	// Find the survivor that the triggering player owns
	if (GetOwningPlayer(GetEnumUnit()) == GetTriggerPlayer()) {
		// And give it the harvest ability
		UnitAddAbility(GetEnumUnit(), 'A009')
		DisplayTimedTextToPlayer(GetLocalPlayer(), 0, 0, 3, \
			"Picked up tools. Type -drop to drop them again.")
	}
}

void Pickup_Drop_Tools_Actions() {
	string message = GetEventPlayerChatString()
	if (message == "-drop") {
		ForGroup(SURVIVORS, function Drop_Tools)
	} else {
		ForGroup(SURVIVORS, function Pickup_Tools)
	}
}

//===========================================================================
void InitTrig_Pickup_Drop_Tools() {
	trigger t = CreateTrigger()
	TriggerRegisterPlayerChatEvent(t, Player(0), "-pickup", true)
	TriggerRegisterPlayerChatEvent(t, Player(1), "-pickup", true)
	TriggerRegisterPlayerChatEvent(t, Player(2), "-pickup", true)
	TriggerRegisterPlayerChatEvent(t, Player(3), "-pickup", true)
	TriggerRegisterPlayerChatEvent(t, Player(4), "-pickup", true)
	TriggerRegisterPlayerChatEvent(t, Player(5), "-pickup", true)
	TriggerRegisterPlayerChatEvent(t, Player(6), "-pickup", true)
	
	TriggerRegisterPlayerChatEvent(t, Player(0), "-tools", true)
	TriggerRegisterPlayerChatEvent(t, Player(1), "-tools", true)
	TriggerRegisterPlayerChatEvent(t, Player(2), "-tools", true)
	TriggerRegisterPlayerChatEvent(t, Player(3), "-tools", true)
	TriggerRegisterPlayerChatEvent(t, Player(4), "-tools", true)
	TriggerRegisterPlayerChatEvent(t, Player(5), "-tools", true)
	TriggerRegisterPlayerChatEvent(t, Player(6), "-tools", true)
	
	TriggerRegisterPlayerChatEvent(t, Player(0), "-drop", true)
	TriggerRegisterPlayerChatEvent(t, Player(1), "-drop", true)
	TriggerRegisterPlayerChatEvent(t, Player(2), "-drop", true)
	TriggerRegisterPlayerChatEvent(t, Player(3), "-drop", true)
	TriggerRegisterPlayerChatEvent(t, Player(4), "-drop", true)
	TriggerRegisterPlayerChatEvent(t, Player(5), "-drop", true)
	TriggerRegisterPlayerChatEvent(t, Player(6), "-drop", true)
	
	TriggerAddAction(t, function Pickup_Drop_Tools_Actions)
}