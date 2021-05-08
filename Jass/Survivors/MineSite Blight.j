/*
Run when a Mining Site is built. It will create a 2x2 square of blight around
the site, which may snap AWAY FROM THE CENTER OF THE MAP (0,0), depending on
if the Mining Site was placed in such a way that either its X or Y co-ordinate
was divisible by 128.

e.g. A MineSite placed at (192, 64) would have the blight placed in a 4x4 square
exactly underneath it, since neither its X or Y co-ord can be divided by 128.

A MineSite where both coordinates are divisible by 128, such as (256, -128)
would have the blight placed the same spot as if it was placed at (320, -192),
since both values will have their magnitude (absolute value) increased by 64.
Thus, (256+64, -128-64) = (320, -192).

Completely separate to this, blight always VISUALLY snaps UP and RIGHT by 64.
This means that if the blight snaps in the bottom left quadrant, it visually
appears exactly under the tent (+64 and -64 in both axis). However, if it snaps
in the top right quadrant, you get a bit of blight which is a full 128 up and
right! It looks ridiculous! I'm so frustrated!
*/

bool MineSite_Blight_Conditions() {
	return GetUnitTypeId(GetTriggerUnit()) == 'bmin'
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
