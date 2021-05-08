/*
See comment for "MineSite Blight"

If the blight snapped, then this increase of 64 in rectangle size should
cause the blight to overflow in the opposite direction. If it didn't snap,
then this will cause it to do so. Either way, the blight expands correctly.
*/

bool DMineSite_Blight_Conditions() {
	return GetUnitTypeId(GetTriggerUnit()) == 'bmn2'
}

void DMineSite_Blight_Actions() {
	location tempLocation = GetUnitLoc(GetTriggerUnit())
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
