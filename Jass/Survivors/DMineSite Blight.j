/*
See comment for "MineSite Blight"

This is much the same, but to compensate for the blight creation snapping up
and left, the 3x3 blight square that is replacing the 2x2 blight square will
grow so that the top left corner remains in the same place, and only the bottom
and right will expand.
*/

bool DMineSite_Blight_Conditions() {
	return GetUnitTypeId(GetTriggerUnit()) == 'n004'
}

void DMineSite_Blight_Actions() {
	location tempLocation = OffsetLocation(GetUnitLoc(GetTriggerUnit()), 64, -64)
	rect tempRect = RectFromCenterSizeBJ(tempLocation, 384, 384) // 128 + 256 = 384
	SetBlightRect(GetOwningPlayer(GetTriggerUnit()), tempRect, true)
	
	RemoveRect(tempRect)
	RemoveLocation(tempLocation)
	tempRect = null
	tempLocation = null
}

//===========================================================================
void InitTrig_DMineSite_Blight() {
	trigger t = CreateTrigger()
	TriggerRegisterAnyUnitEventBJ(t, EVENT_PLAYER_UNIT_UPGRADE_FINISH)
	TriggerAddCondition(t, Condition(function DMineSite_Blight_Conditions))
	TriggerAddAction(t, function DMineSite_Blight_Actions)
}