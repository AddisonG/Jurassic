/*
Runs when a Mining Site is told to "Stop Mining".
Removes the ability to Excavate for 2.5 seconds.
*/
bool MineSite_Stop_Conditions() {
	// Only true if unit is a Mining Site, and ability is "Stop Mining"
	return (GetUnitTypeId(GetTriggerUnit()) == 'n003' && \
		GetSpellAbilityId() == 'A00I')
}

void MineSite_Stop_Actions() {
	UnitRemoveAbility(GetTriggerUnit(), 'A00B')
	TriggerSleepAction(2.50)
	UnitAddAbility(GetTriggerUnit(), 'A00B')
}

//===========================================================================
void InitTrig_MineSite_Stop() {
	trigger t = CreateTrigger()
	TriggerRegisterAnyUnitEventBJ(t, EVENT_PLAYER_UNIT_SPELL_EFFECT)
	TriggerAddCondition(t, Condition(function MineSite_Stop_Conditions))
	TriggerAddAction(t, function MineSite_Stop_Actions)
}
