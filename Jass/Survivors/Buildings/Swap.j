// RemoveItemFromStock
// AddItemToStock
// UnitAddItem
// UnitAddItemById

bool Swap_Conditions() {
	return GetSpellAbilityId() == 'SVAC' || \
		GetUnitTypeId(GetTriggerUnit()) == 'bva1'
}

// Creates 10 visibility modifiers (with size proportionate to distance) in a line
// drawn in the direction the unit is facing. The line has a transition effect too!
// I've tested this very thouroughly - it should never leave leftover fogmods or leak
void Swap_Actions() {
	unit triggering_unit = GetTriggerUnit()
	int page = R2I(GetUnitState(triggering_unit, UNIT_STATE_MANA))

	int i = 0
	while (i < ENGINE_NUM) {
		if (page == 0) {
			AddItemToStock(triggering_unit, ENGINE_LIST[i], 5, 5)
		} else {
			RemoveItemFromStock(triggering_unit, ENGINE_LIST[i])
		}
		i++
	}

	i = 0
	while (i < CHASSIS_NUM) {
		if (page == 0) {
			RemoveItemFromStock(triggering_unit, CHASSIS_LIST[i])
		} else {
			AddItemToStock(triggering_unit, CHASSIS_LIST[i], 5, 5)
		}
		i++
	}

	if (page == 0) {
		AddItemToStock(triggering_unit, BLUEPRINTS_JEEP, 5, 5)
		AddItemToStock(triggering_unit, BLUEPRINTS_HUMVEE, 5, 5)
		AddItemToStock(triggering_unit, BLUEPRINTS_TANK, 5, 5)
		RemoveItemFromStock(triggering_unit, BLUEPRINTS_COBRA)
		RemoveItemFromStock(triggering_unit, BLUEPRINTS_TRANSPORT)
		RemoveItemFromStock(triggering_unit, BLUEPRINTS_AAHELI)

		SetUnitState(triggering_unit, UNIT_STATE_MANA, 1)
	} else {
		AddItemToStock(triggering_unit, BLUEPRINTS_COBRA, 5, 5)
		AddItemToStock(triggering_unit, BLUEPRINTS_TRANSPORT, 5, 5)
		AddItemToStock(triggering_unit, BLUEPRINTS_AAHELI, 5, 5)
		RemoveItemFromStock(triggering_unit, BLUEPRINTS_JEEP)
		RemoveItemFromStock(triggering_unit, BLUEPRINTS_HUMVEE)
		RemoveItemFromStock(triggering_unit, BLUEPRINTS_TANK)

		SetUnitState(triggering_unit, UNIT_STATE_MANA, 0)
	}
}

//===========================================================================
void InitTrig_Swap() {
	trigger t = CreateTrigger()
	// Upon construction finished or clicking swap
	TriggerRegisterAnyUnitEventBJ(t, EVENT_PLAYER_UNIT_UPGRADE_FINISH)
	TriggerRegisterAnyUnitEventBJ(t, EVENT_PLAYER_UNIT_SPELL_EFFECT)
	TriggerAddCondition(t, Condition(function Swap_Conditions))
	TriggerAddAction(t, function Swap_Actions)
}
