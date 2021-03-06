void Item_Scatter_Actions() {
	// debug BJDebugMsg("Item_Scatter_Actions")
	location temp

	// Spawn Gold
	int i = 0
	while (i < (100 - 10 * DIFFICULTY)) {
		temp = GetRandomLocInRect(WHOLE_MAP)
		CreateItemLoc('I001', temp)
		RemoveLocation(temp)
		i++
	}

	// Spawn lumber
	i = 0
	while (i < (100 - 10 * DIFFICULTY)) {
		temp = GetRandomLocInRect(WHOLE_MAP)
		CreateItem('I000', GetLocationX(temp), GetLocationY(temp))
		RemoveLocation(temp)
		i++
	}
	temp = null
	DestroyTrigger(GetTriggeringTrigger())
}

//===========================================================================
void InitTrig_Item_Scatter() {
	trigger t = CreateTrigger()
	// Run as soon as game begins
	TriggerRegisterTimerEvent(t, 0.01, false)
	TriggerAddAction(t, function Item_Scatter_Actions)
}
