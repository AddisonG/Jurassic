void Evacuation_Actions() {
	debug BJDebugMsg("Evacuation_Actions")

	DisplayTimedTextToPlayer(GetLocalPlayer(), 0, 0, 5, "You hear the roar of the chopper overhead. Evacuation is here!")
	DisplayTimedTextToPlayer(GetLocalPlayer(), 0, 0, 5, "The dinosaurs are pissed! Get to the extraction point!")

	int time_to_escape = 300 - DIFFICULTY * 30

	// Create the extraction point
	location extraction_point = MAP_CENTER
	// Make a region + triggers

	// Ping the evac point
	PingMinimapEx(GetLocationX(extraction_point), GetLocationY(extraction_point), time_to_escape, 0, 255, 0, true)

	// Remove the rescue timer
	TimerDialogDisplay(TIMER_DISPLAY, false)
	DestroyTimerDialog(TIMER_DISPLAY)
	DestroyTimer(SURVIVE_TIMER)

	// Start the timer for evac leaving
	TimerStart(EVAC_TIMER, time_to_escape, false, null)
	TIMER_DISPLAY = CreateTimerDialog(EVAC_TIMER)
	TimerDialogSetTitle(TIMER_DISPLAY, "Get to the chopper!")
	TimerDialogDisplay(TIMER_DISPLAY, true)
}

//===========================================================================
void InitTrig_Evacuation() {
	trigger t = CreateTrigger()
	TriggerRegisterTimerExpireEvent(t, SURVIVE_TIMER)
	TriggerAddAction(t, function Evacuation_Actions)
}
