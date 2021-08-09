void Begin_Spawn_Actions() {
	DINO_LEVEL = 0
	DINO_ANGER = 0
	DisplayTimedTextToPlayer(GetLocalPlayer(), 0, 0, 5, "The dinosaurs approach...")

	// Begin the level and anger timers. They scale according to difficulty.
	TimerStart(LEVEL_TIMER, 180 + (20 * DIFFICULTY), true, null)
	TimerStart(ANGER_TIMER, 115 + (15 * DIFFICULTY), true, null)
	DestroyTrigger(GetTriggeringTrigger())

	// Remove the grace period timer
	TimerDialogDisplay(TIMER_DISPLAY, false)
	DestroyTimerDialog(TIMER_DISPLAY)
	DestroyTimer(GRACE_TIMER)

	// Start the timer to mark the end of the game
	// TimerStart(SURVIVE_TIMER, 1800 + 600 * DIFFICULTY, false, null)
	TimerStart(SURVIVE_TIMER, 60, false, null) // TEMP
	TIMER_DISPLAY = CreateTimerDialog(SURVIVE_TIMER)
	TimerDialogSetTitle(TIMER_DISPLAY, "Time until rescue")
	TimerDialogDisplay(TIMER_DISPLAY, true)

	DestroyTrigger(GetTriggeringTrigger())
}

//===========================================================================
void InitTrig_Begin_Spawn() {
	trigger t = CreateTrigger()
	TriggerRegisterTimerExpireEvent(t, GRACE_TIMER)
	TriggerAddAction(t, function Begin_Spawn_Actions)
}
