/*
Run when a Tent is created.

This trigger will give the "Return Gold and Lumber" ability to the tent, and
convert it to an Igloo (identical equivilant) if in the Snow Lands.
*/

// If the unit that was just constructed was a tent
bool Tent_Init_Conditions() {
	return GetUnitTypeId(GetTriggerUnit()) == 'tent'
}

// The "Return Gold and Lumber" ability must be added using a trigger, so that
// survivors can construct them anywhere. Otherwise, there are restrictions, such
// as placing them too close together, and too close to a mine, etc.
void Tent_Init_Actions() {
	// If the newly constructed building is in the "snow lands"...
	if (RectContainsCoords(gg_rct_Frozen_Lands, GetUnitX(GetTriggerUnit()), GetUnitY(GetTriggerUnit()))) {
		// Replace that tent with a freaking igloo!!!
		ReplaceUnitBJ(GetTriggerUnit(), 'iglo', bj_UNIT_STATE_METHOD_ABSOLUTE)
		// Either way, give it the "Return Gold and Lumber" ability.
		UnitAddAbility(bj_lastReplacedUnit, 'Argl')
	} else {
		// Either way, give it the "Return Gold and Lumber" ability.
		UnitAddAbility(GetTriggerUnit(), 'Argl')
	}
}

//===========================================================================
void InitTrig_Tent_Init() {
	trigger t = CreateTrigger()
	TriggerRegisterAnyUnitEventBJ(t, EVENT_PLAYER_UNIT_CONSTRUCT_FINISH)
	TriggerAddCondition(t, Condition(function Tent_Init_Conditions))
	TriggerAddAction(t, function Tent_Init_Actions)
}
