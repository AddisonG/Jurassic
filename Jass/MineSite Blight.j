/*
Run when a Mining Site is built. It will create a 2x2 square of blight around
the site, which may move UP or LEFT, depending on if the Mining Site was placed
in such a way that either its X or Y co-ordinate was divisible by 128. The X
coordinate wil be rounded down, and the Y coordinate will be rounded up.

e.g. A MineSite placed at (192, 64) would have the blight placed in a 4x4 square
exactly underneath it, since neither its X or Y co-ord can be divided by 128.

A MineSite placed at (128, 0) would have the blight placed the exact same spot
as if it was placed at (64, 64), since both coordinates are divisible by 128.
X=128 will be rounded down to 64, and Y=0 will be rounded up to 64.
*/

bool MineSite_Blight_Conditions() {
	return GetUnitTypeId(GetTriggerUnit()) == 'n003'
}

void MineSite_Blight_Actions() {
	location tempLocation = GetUnitLoc(GetTriggerUnit())
	rect tempRect = RectFromCenterSizeBJ(tempLocation, 256, 256)
	SetBlightRect(GetOwningPlayer(GetTriggerUnit()), tempRect, true)
	
	RemoveRect(tempRect)
	RemoveLocation(tempLocation)
	tempRect = null
	tempLocation = null
}

//===========================================================================
void InitTrig_MineSite_Blight() {
	trigger t = CreateTrigger()
	TriggerRegisterAnyUnitEventBJ(t, EVENT_PLAYER_UNIT_CONSTRUCT_FINISH)
	TriggerAddCondition(t, Condition(function MineSite_Blight_Conditions))
	TriggerAddAction(t, function MineSite_Blight_Actions)
}