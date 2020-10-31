void Anger_Loop_Actions() {
	DINO_ANGER++
	DisplayTimedTextToPlayer(GetLocalPlayer(), 0, 0, 5, \
		"The dinosaurs have grown more ferocious... (Ferocity " + I2S(DINO_ANGER) + ")")
}

//===========================================================================
void InitTrig_Anger_Loop() {
	trigger t = CreateTrigger()
	TriggerRegisterTimerExpireEvent(t, ANGER_TIMER)
	TriggerAddAction(t, function Anger_Loop_Actions)
}
