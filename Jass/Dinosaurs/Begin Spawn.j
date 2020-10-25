void Begin_Spawn_Actions() {
	debug BJDebugMsg("Begin_Spawn_Actions")
	DestroyTimer(START_TIMER)
	DINO_LEVEL = 0
	DINO_ANGER = 0
	DisplayTimedTextToPlayer(GetLocalPlayer(), 0, 0, 5, "The dinosaurs approach...")

	// Begin spawning dinosaurs.
	TriggerRegisterTimerEvent(SPAWN_TRIGGER, 30 - DIFFICULTY * 2, true)
	EnableTrigger(SPAWN_TRIGGER)
	EnableTrigger(MOVE_TRIGGER)

	// Begin the level and anger timers. They scale according to difficulty.
	TimerStart(LEVEL_TIMER, 180 + (20 * DIFFICULTY), true, null)
	TimerStart(ANGER_TIMER, 115 + (15 * DIFFICULTY), true, null)
	DestroyTrigger(GetTriggeringTrigger())

	// Start the timer to mark the end of the game
	TimerStart(END_TIMER, 1800 + 600 * DIFFICULTY, false, null)
	timerdialog timer_msg = CreateTimerDialog(END_TIMER)
	TimerDialogSetTitle(timer_msg, "Time until rescue")
	TimerDialogDisplay(timer_msg, true)
	timer_msg = null
}

//===========================================================================
void InitTrig_Begin_Spawn() {
	debug BJDebugMsg("InitTrig_Begin_Spawn")
	trigger t = CreateTrigger()
	TriggerRegisterTimerExpireEvent(t, START_TIMER)
	TriggerAddAction(t, function Begin_Spawn_Actions)
}