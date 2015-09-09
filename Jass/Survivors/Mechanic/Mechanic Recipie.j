bool Mechanic_Recipe_Conditions() {
	int recipe = GetItemTypeId(GetManipulatedItem())
	return \
		GetUnitTypeId(GetTriggerUnit()) == SURVIVOR_UNIT_TYPE && (\
		recipe == BLUEPRINTS_JEEP || \
		recipe == BLUEPRINTS_HUMVEE || \
		recipe == BLUEPRINTS_TANK || \
		recipe == BLUEPRINTS_COBRA || \
		recipe == BLUEPRINTS_TRANSPORT || \
		recipe == BLUEPRINTS_AAHELI)
}

/**
 * Checks that the engine and chassis are both above a threshold, or informs the
 * player of what is lacking.
 * 
 * PARAMETERS
 * engine_index - The engine to test
 * min_engine - The worst engine that this function will accept
 * chassis_index - The chassis to test
 * min_chassis - The worst chassis that this function will accept
 * 
 * RETURN
 * True - If the engine and chassis are both of sufficient quality
 * False - If either the engine or chassis are below the minimum standard
 */
bool checkEngineAndChassis(int engine_index, int min_engine, int chassis_index, int min_chassis) {
	player owner = GetOwningPlayer(GetTriggerUnit())
	bool retval = true
	if (engine_index < min_engine) {
		// Engine is too weak. Inform player
		DisplayTimedTextToPlayer(owner, 0, 0, 3, \
			"Engine is too weak. Must be at least " + ENGINE_NAME[min_engine])
		retval = false
	}
	if (chassis_index < min_chassis) {
		// Chassis is too weak. Inform player
		DisplayTimedTextToPlayer(owner, 0, 0, 3, \
			"Chassis is too weak. Must be at least " + CHASSIS_NAME[min_chassis])
		retval = false
	}
	owner = null
	return retval
}

void Mechanic_Recipe_Actions() {
	player owner = GetOwningPlayer(GetTriggerUnit())
	int recipe = GetItemTypeId(GetManipulatedItem())
	
	int chassis_index = -1
	int engine_index = -1
	int vehicle = 0
	int i
	
	i = 0
	// Find out what type of engine is in slot 1 or 2
	while (i < ENGINE_NUM) {
		if (GetItemTypeId(UnitItemInSlot(GetTriggerUnit(), 0)) == ENGINE_LIST[i] || \
			GetItemTypeId(UnitItemInSlot(GetTriggerUnit(), 1)) == ENGINE_LIST[i]) {
			engine_index = i
			break
		}
		i++
	}
	
	i = 0
	// Find out what type of chassis is in slot 1 or 2
	while (i < CHASSIS_NUM) {
		if (GetItemTypeId(UnitItemInSlot(GetTriggerUnit(), 0)) == CHASSIS_LIST[i] || \
			GetItemTypeId(UnitItemInSlot(GetTriggerUnit(), 1)) == CHASSIS_LIST[i]) {
			chassis_index = i
			break
		}
		i++
	}
	
	// Ensure that a valid engine and a chassis are registered
	if (engine_index < 0 || chassis_index < 0) {
		DisplayTimedTextToPlayer(owner, 0, 0, 3, \
			"Ensure a chassis and engine are in the top two slots.")
		return
	}
	
	location point = GetUnitLoc(GetTriggerUnit())
	if (recipe == BLUEPRINTS_JEEP) { // JEEP
		CreateUnitAtLoc(owner, VEHICLE_JEEP, point, bj_UNIT_FACING)
	} elseif (recipe == BLUEPRINTS_HUMVEE) { // HUMVEE
		CreateUnitAtLoc(owner, VEHICLE_HUMVEE, point, bj_UNIT_FACING)
	} elseif (recipe == BLUEPRINTS_TANK) { // TANK
		if (!checkEngineAndChassis(engine_index, 1, chassis_index, 2)) {
			// Failed the check, insufficient engine or chassis
			return
		}
		CreateUnitAtLoc(owner, VEHICLE_TANK, point, bj_UNIT_FACING)
	} elseif (recipe == BLUEPRINTS_COBRA) { // COBRA
		CreateUnitAtLoc(owner, VEHICLE_COBRA, point, bj_UNIT_FACING)
	} elseif (recipe == BLUEPRINTS_TRANSPORT) { // TRANSPORT
		if (!checkEngineAndChassis(engine_index, 1, chassis_index, 0)) {
			// Failed the check, insufficient engine or chassis
			return
		}
		CreateUnitAtLoc(owner, VEHICLE_TRANSPORT, point, bj_UNIT_FACING)
	} elseif (recipe == BLUEPRINTS_AAHELI) { // AH-64
		if (!checkEngineAndChassis(engine_index, 2, chassis_index, 0)) {
			// Failed the check, insufficient engine or chassis
			return
		}
		CreateUnitAtLoc(owner, VEHICLE_AAHELI, point, bj_UNIT_FACING)
	}
	
	RemoveLocation(point)
	point = null
	owner = null
	
	// Remove the recipe/blueprint, engine and chassis from the player
	RemoveItem(GetItemOfTypeFromUnitBJ(GetTriggerUnit(), GetItemTypeId(GetManipulatedItem())))
	RemoveItem(UnitItemInSlot(GetTriggerUnit(), 0))
	RemoveItem(UnitItemInSlot(GetTriggerUnit(), 1))
	
	// Alter the newly created unit based on the engine and chassis used.
	UnitAddAbility(bj_lastCreatedUnit, ENGINE_SPEED[engine_index])
	UnitAddAbility(bj_lastCreatedUnit, ENGINE_FUELTANK[engine_index])
	UnitAddAbility(bj_lastCreatedUnit, ENGINE_USAGE[engine_index])
	UnitAddAbility(bj_lastCreatedUnit, ENGINE_REFUEL[engine_index])
	UnitAddAbility(bj_lastCreatedUnit, CHASSIS_ARMOUR[chassis_index])
	UnitAddAbility(bj_lastCreatedUnit, CHASSIS_HEALTH[chassis_index])
}

//===========================================================================
void InitTrig_Mechanic_Recipe() {
	trigger t = CreateTrigger()
	TriggerRegisterAnyUnitEventBJ(t, EVENT_PLAYER_UNIT_USE_ITEM)
	TriggerAddCondition(t, Condition(function Mechanic_Recipe_Conditions))
	TriggerAddAction(t, function Mechanic_Recipe_Actions)
}