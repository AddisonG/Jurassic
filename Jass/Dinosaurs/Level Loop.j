void Level_Loop_Actions() {
	DINO_LEVEL++
	DisplayTimedTextToPlayer(GetLocalPlayer(), 0, 0, 5, \
		"Larger dinosaurs are approaching... (Level " + I2S(DINO_LEVEL) + ")")
}

//===========================================================================
void InitTrig_Level_Loop() {
	trigger t = CreateTrigger()
	TriggerRegisterTimerExpireEvent(t, LEVEL_TIMER)
	TriggerAddAction(t, function Level_Loop_Actions)
}
