void Anger_Loop_Actions() {
	DINO_ANGER++
	DisplayTimedTextToPlayer(GetLocalPlayer(), 0, 0, 5, \
		"The dinosaurs have grown more ferocious... [" + I2S(DINO_ANGER) + "]")
}

//===========================================================================
void InitTrig_Anger_Loop() {
	local trigger t = CreateTrigger()
	call TriggerRegisterTimerExpireEvent(t, ANGER_TIMER)
	call TriggerAddAction(t, function Anger_Loop_Actions)
}