void Item_Scatter_Actions() {
	// debug BJDebugMsg("Item_Scatter_Actions")
	location temp

	// Spawn Gold
	int i = 0
	while (i < (100 - 10 * DIFFICULTY)) {
		temp = GetRandomLocInRect(WHOLE_MAP)
		CreateItemLoc('GLD1', temp)
		RemoveLocation(temp)
		i++
	}

	// Spawn lumber
	i = 0
	while (i < (100 - 10 * DIFFICULTY)) {
		temp = GetRandomLocInRect(WHOLE_MAP)
		CreateItemLoc('WOD1', temp)
		RemoveLocation(temp)
		i++
	}
	DestroyTrigger(GetTriggeringTrigger())
}

//===========================================================================
void InitTrig_Item_Scatter() {
	trigger t = CreateTrigger()
	// Run as soon as game begins
	TriggerRegisterTimerEvent(t, 0.01, false)
	TriggerAddAction(t, function Item_Scatter_Actions)
}
