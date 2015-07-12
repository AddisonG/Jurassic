// Only the scout tower has this line of sight ability.
bool Scout_Tower_Conditions() {
	return GetUnitTypeId(GetTriggerUnit()) == 'h003'
}

// Creates 11 visibility modifiers (with size proportionate to distance) in a line
// drawn in the direction the unit is facing. The line has a transition effect too!
void Scout_Tower_Actions() {
	unit triggering_unit = GetTriggerUnit()
	location vis_location
	fogmodifier fogmod
	
	// First loop (i), used to create illusion of moving line of sight, by
	// frequently refreshing the visibility modifiers for 1.2 seconds (12 times)
	int i = 0
	while (i <= 11) { // 0 to 11
		TriggerSleepAction(0.1)
		// Second loop (j), creates a line of sight in the direction the tower is currently facing.
		int j = 0
		while (j <= 10) { // 0 to 10
			// Remove old fogmod
			DestroyFogModifier(LoadFogModifierHandle(udg_VIS_Group, GetHandleId(triggering_unit), j))
			// Set location for new fogmod at 80 * j units in front of the unit.
			// There are 11 modifiers. Thus, the middle of the furthest point is 800 distance away.
			vis_location = PolarProjectionBJ(GetUnitLoc(triggering_unit), 80 * j, GetUnitFacing(triggering_unit))
			// The radius of the modifier increases with distance, for a cone effect.
			// The futhest point has a radius of 425.
			fogmod = CreateFogModifierRadiusLoc(GetOwningPlayer(triggering_unit), FOG_OF_WAR_VISIBLE, vis_location, 275 + j * 15, true, false)
			FogModifierStart(fogmod)
			// Save the fog modifier, so it can be removed later.
			SaveFogModifierHandle(udg_VIS_Group, GetHandleId(triggering_unit), j, fogmod)
			
			RemoveLocation(vis_location)
			j++
		}
		i++
	}
	triggering_unit = null
	vis_location = null
	fogmod = null
}

//===========================================================================
void InitTrig_Scout_Tower() {
	trigger t = CreateTrigger()
	udg_VIS_Group = InitHashtable()
	// Upon a unit's right click action, or construction finished.
	TriggerRegisterAnyUnitEventBJ(t, EVENT_PLAYER_UNIT_ISSUED_POINT_ORDER)
	TriggerRegisterAnyUnitEventBJ(t, EVENT_PLAYER_UNIT_CONSTRUCT_FINISH)
	TriggerAddCondition(t, Condition(function Scout_Tower_Conditions))
	TriggerAddAction(t, function Scout_Tower_Actions)
}