void Board_Chopper_Actions() {
	unit s = GetTriggerUnit()
	debug_unit(s)
	log("Player " + I2S(GetPlayerId(GetOwningPlayer(s))) + " boarded the chopper!")

	// Hide the unit
	ShowUnit(s, false)

	// Check if all survivors have boarded
	// Or if they are dead
}

void Evacuation_Actions() {
	log("Evacuation_Actions")

	announce("You hear the roar of the chopper overhead. Evacuation is here!")
	announce("The dinosaurs are pissed! Get to the extraction point!")

	int time_to_escape = 300 - DIFFICULTY * 30

	// Remove the rescue timer
	TimerDialogDisplay(TIMER_DISPLAY, false)
	DestroyTimerDialog(TIMER_DISPLAY)
	DestroyTimer(SURVIVE_TIMER)

	// Start the timer for evac leaving
	TimerStart(EVAC_TIMER, time_to_escape, false, null)
	TIMER_DISPLAY = CreateTimerDialog(EVAC_TIMER)
	TimerDialogSetTitle(TIMER_DISPLAY, "Get to the chopper!")
	TimerDialogDisplay(TIMER_DISPLAY, true)

	// TODO - Randomly select an extraction point
	rect zone = gg_rct_Extraction_Point_1
	location extraction_point = GetRectCenter(zone)

	// Ping the evac point
	PingMinimapEx(GetLocationX(extraction_point), GetLocationY(extraction_point), time_to_escape, 0, 255, 0, true)

	// Make the location visible to the survivors
	fogmodifier fogmod = CreateFogModifierRadiusLoc(Player(0), FOG_OF_WAR_VISIBLE, extraction_point, 200, true, false)
	FogModifierStart(fogmod)

	// Spawn a helicopter there
	unit chopper = CreateUnitAtLoc(Player(PLAYER_NEUTRAL_PASSIVE), 'chpr', extraction_point, 135)
	SetUnitFlyHeight(chopper, 0, 50)

	trigger evacuate = CreateTrigger()

	TriggerRegisterEnterRectSimple(evacuate, zone)
	TriggerAddCondition(evacuate, Condition(function Survivor_Unit_Condition))
	TriggerAddAction(evacuate, function Board_Chopper_Actions)
}

//===========================================================================
void InitTrig_Evacuation() {
	trigger t = CreateTrigger()
	TriggerRegisterTimerExpireEvent(t, SURVIVE_TIMER)
	TriggerAddAction(t, function Evacuation_Actions)
}
