/*
Runs when a Mining Site is told to "Stop Mining".
Removes the ability to Excavate for 2.5 seconds.
*/
bool MineSite_Stop_Conditions() {
	// Only true if unit is a Mining Site, and ability is "Stop Mining"
	return ((GetUnitTypeId(GetTriggerUnit()) == 'bmin' || GetUnitTypeId(GetTriggerUnit()) == 'bmn2') && \
		GetSpellAbilityId() == 'SPMN')
}

void MineSite_Stop_Actions() {
	int exacvate = 'EXCV' // Regular mine site
	if (GetUnitTypeId(GetTriggerUnit()) == 'bmn2') {
		// Deep mining site
		exacvate = 'DEXV'
	}

	UnitRemoveAbility(GetTriggerUnit(), exacvate)
	TriggerSleepAction(2.50)
	UnitAddAbility(GetTriggerUnit(), exacvate)
}

//===========================================================================
void InitTrig_MineSite_Stop() {
	trigger t = CreateTrigger()
	TriggerRegisterAnyUnitEventBJ(t, EVENT_PLAYER_UNIT_SPELL_EFFECT)
	TriggerAddCondition(t, Condition(function MineSite_Stop_Conditions))
	TriggerAddAction(t, function MineSite_Stop_Actions)
}
