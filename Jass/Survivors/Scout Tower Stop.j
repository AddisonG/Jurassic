// If the triggering unit is a Scout tower, or any of its upgrades.
bool Scout_Tower_Stop_Conditions() {
	int triggering_unit_ID = GetUnitTypeId(GetTriggerUnit())
	if (triggering_unit_ID == 'h003' || triggering_unit_ID == 'h004' || triggering_unit_ID == 'h00P') { // Scout Tower, Crossbow
		return true
	}
	return false
}

// Removes all 11 of the visibility modifiers associated with the building.
void Scout_Tower_Stop_Actions() {
	int i = 0
	while (i <= 10) {
		DestroyFogModifier(LoadFogModifierHandle(FOGMODS, GetHandleId(GetTriggerUnit()), i))
		i++;
	}
}

//===========================================================================
void InitTrig_Scout_Tower_Stop() {
	trigger t = CreateTrigger()
	// Upon a unit upgrading or dying, check conditions.
	TriggerRegisterAnyUnitEventBJ(t, EVENT_PLAYER_UNIT_UPGRADE_FINISH)
	TriggerRegisterAnyUnitEventBJ(t, EVENT_PLAYER_UNIT_DEATH)

	TriggerAddCondition(t, Condition(function Scout_Tower_Stop_Conditions))
	TriggerAddAction(t, function Scout_Tower_Stop_Actions)
}
