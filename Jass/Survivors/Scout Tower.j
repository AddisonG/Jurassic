// Only the scout tower has this line of sight ability.
bool Scout_Tower_Conditions() {
	return GetUnitTypeId(GetTriggerUnit()) == 'bsct'
}

// Creates 10 visibility modifiers (with size proportionate to distance) in a line
// drawn in the direction the unit is facing. The line has a transition effect too!
// I've tested this very thouroughly - it should never leave leftover fogmods or leak
void Scout_Tower_Actions() {
	unit triggering_unit = GetTriggerUnit()
	location vis_location
	fogmodifier fogmod

	// First loop (i), used to create illusion of moving line of sight, by
	// frequently refreshing the visibility modifiers for 1.5 seconds (15 times)
	int i = 0
	int j
	real facing = 0
	while (i <= 14) { // 0 to 14
		if (i >= 1 && facing == GetUnitFacing(triggering_unit)) {
			// Unit is no longer turning - stop calculating new fogmods
			break
		}
		facing = GetUnitFacing(triggering_unit)
		TriggerSleepAction(0.1)
		// Second loop (j), creates a line of sight in the direction the tower is currently facing.
		j = 1
		while (j <= 10) { // 1 to 10
			// Set location for new fogmod at 80 * j units in front of the unit.
			// There are 10 modifiers. Thus, the middle of the furthest point is 800 distance away.
			vis_location = PolarProjectionBJ(GetUnitLoc(triggering_unit), 80 * j, facing)

			// The radius of the modifier increases with distance, for a cone effect.
			// The futhest point has a radius of 425.
			int radius = 275 + j * 15

			// Remove old fogmod
			fogmod = LoadFogModifierHandle(FOGMODS, GetHandleId(triggering_unit), j)
			FogModifierStop(fogmod)
			DestroyFogModifier(fogmod)

			fogmod = CreateFogModifierRadiusLoc(GetOwningPlayer(triggering_unit), FOG_OF_WAR_VISIBLE, vis_location, radius, true, false)
			FogModifierStart(fogmod)
			// Save the fog modifier, so it can be removed later.
			SaveFogModifierHandle(FOGMODS, GetHandleId(triggering_unit), j, fogmod)

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
	// Upon a unit's right click action, or construction finished.
	TriggerRegisterAnyUnitEventBJ(t, EVENT_PLAYER_UNIT_ISSUED_POINT_ORDER)
	TriggerRegisterAnyUnitEventBJ(t, EVENT_PLAYER_UNIT_CONSTRUCT_FINISH)
	TriggerAddCondition(t, Condition(function Scout_Tower_Conditions))
	TriggerAddAction(t, function Scout_Tower_Actions)
}
