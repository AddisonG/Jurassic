bool Survivor_Death_Conditions() {
	// Return true if unit was a survivor
	return GetUnitTypeId(GetTriggerUnit()) == SURVIVOR_UNIT_TYPE
}

void Survivor_Death_Actions() {
	debug BJDebugMsg("Survivor_Death_Actions")
	SURVIVORS[GetPlayerId(GetOwningPlayer(GetTriggerUnit()))].deathActions()

	GroupRemoveUnit(SURVIVOR_GROUP, GetTriggerUnit())
	RemoveUnit(GetTriggerUnit())

	if (IsUnitGroupEmptyBJ(SURVIVOR_GROUP)) {
		DisplayTimedTextToPlayer(GetLocalPlayer(), 0, 0, 20, "Everybody loose.")

		// Maybe I should just pause the game?

		// Pause all timers
		PauseTimer(ANGER_TIMER)
		PauseTimer(LEVEL_TIMER)
		PauseTimer(GRACE_TIMER)
		PauseTimer(SURVIVE_TIMER)
		PauseTimer(EVAC_TIMER)

		// Reveal map
		FogEnable(false)
		FogMaskEnable(false)
	} else {
		DisplayTimedTextToPlayer(GetLocalPlayer(), 0, 0, 10, GetPlayerName(GetOwningPlayer(GetTriggerUnit())) + " loost.")
	}
}

//===========================================================================
void InitTrig_Survivor_Death() {
	trigger t = CreateTrigger()
	TriggerRegisterPlayerUnitEvent(t, Player(0), EVENT_PLAYER_UNIT_DEATH, null)
	TriggerRegisterPlayerUnitEvent(t, Player(1), EVENT_PLAYER_UNIT_DEATH, null)
	TriggerRegisterPlayerUnitEvent(t, Player(2), EVENT_PLAYER_UNIT_DEATH, null)
	TriggerRegisterPlayerUnitEvent(t, Player(3), EVENT_PLAYER_UNIT_DEATH, null)
	TriggerRegisterPlayerUnitEvent(t, Player(4), EVENT_PLAYER_UNIT_DEATH, null)
	TriggerRegisterPlayerUnitEvent(t, Player(5), EVENT_PLAYER_UNIT_DEATH, null)
	TriggerRegisterPlayerUnitEvent(t, Player(6), EVENT_PLAYER_UNIT_DEATH, null)

	TriggerAddCondition(t, Condition(function Survivor_Death_Conditions))
	TriggerAddAction(t, function Survivor_Death_Actions)
}
