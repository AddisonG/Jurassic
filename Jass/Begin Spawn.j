void Begin_Spawn_Actions() {
	DINO_LEVEL = 0
	DINO_ANGER = 0
	DisplayTimedTextToPlayer(GetLocalPlayer(), 0, 0, 5, "The dinosaurs approach...")
    // Begin spawning dinosaurs.
	EnableTrigger(gg_trg_Spawn_Loop)
    // Begin the level and anger timers. They scale according to difficulty.
	TimerStart(LEVEL_TIMER, 180 + (20 * DIFFICULTY), true, null)
	TimerStart(ANGER_TIMER, 115 + (15 * DIFFICULTY), true, null)
    // Destroy this trigger, to save memory.
	DestroyTrigger(GetTriggeringTrigger())
}

//===========================================================================
void InitTrig_Begin_Spawn() {
	trigger t = CreateTrigger()
	TriggerRegisterTimerExpireEvent(t, START_TIMER)
	TriggerAddAction(t, function Begin_Spawn_Actions)
}