void Level_Loop_Actions() {
	DINO_LEVEL++
	DisplayTimedTextToPlayer(GetLocalPlayer(), 0, 0, 5, \
		"Larger dinosaurs are approaching... [" + I2S(DINO_LEVEL) + "]")
}

//===========================================================================
void InitTrig_Level_Loop() {
	local trigger t = CreateTrigger()
	call TriggerRegisterTimerExpireEvent(t, LEVEL_TIMER)
	call TriggerAddAction(t, function Level_Loop_Actions)
}