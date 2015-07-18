void Tip_Timer_Actions() {
	DisplayTimedTextToForce(TIP_PLAYERS, 5, TIPS[GetRandomInt(0, TIP_NUM)])
}

//===========================================================================
void InitTrig_Tip_Timer() {
	trigger t = CreateTrigger()
	TriggerRegisterTimerExpireEvent(t, TIP_TIMER)
	TriggerAddAction(t, function Tip_Timer_Actions)
}