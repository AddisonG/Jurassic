globals
	/////////////
	// ENGINES //
	/////////////
	
	int ENGINE_NUM = 7
	int array ENGINE_LIST
	int array ENGINE_FUELTANK
	int array ENGINE_REFUEL
	int array ENGINE_SPEED
	int array ENGINE_USAGE
	
	// Heat
	ENGINE_LIST[0] = 'I005'
	ENGINE_FUELTANK[0] = 'A00M'
	ENGINE_REFUEL[0] = 'A013'
	ENGINE_SPEED[0] = 'A00S'
	ENGINE_USAGE[0] = 'A00Z'
	// Steam
	ENGINE_LIST[1] = 'I006'
	ENGINE_FUELTANK[1] = 'A00N'
	ENGINE_REFUEL[1] = 'A01O'
	ENGINE_SPEED[1] = 'A00T'
	ENGINE_USAGE[1] = 'A00Z'
	// Diesel
	ENGINE_LIST[2] = 'I007'
	ENGINE_FUELTANK[2] = 'A00O'
	ENGINE_REFUEL[2] = 'A01P'
	ENGINE_SPEED[2] = 'A00U'
	ENGINE_USAGE[2] = 'A010'
	// Gas
	ENGINE_LIST[3] = 'I008'
	ENGINE_FUELTANK[3] = 'A00O'
	ENGINE_REFUEL[3] = 'A01Q'
	ENGINE_SPEED[3] = 'A00V'
	ENGINE_USAGE[3] = 'A00Z'
	// Electric
	ENGINE_LIST[4] = 'I009'
	ENGINE_FUELTANK[4] = 'A00P'
	ENGINE_REFUEL[4] = 'A01R'
	ENGINE_SPEED[4] = 'A00W'
	ENGINE_USAGE[4] = 'A011'
	// Hybrid
	ENGINE_LIST[5] = 'I00A'
	ENGINE_FUELTANK[5] = 'A00Q'
	ENGINE_REFUEL[5] = 'A01S'
	ENGINE_SPEED[5] = 'A00X'
	ENGINE_USAGE[5] = 'A011'
	// Reactor
	ENGINE_LIST[6] = 'I00B'
	ENGINE_FUELTANK[6] = 'A00R'
	ENGINE_REFUEL[6] = 'A01S'
	ENGINE_SPEED[6] = 'A00Y'
	ENGINE_USAGE[6] = 'A012'
	
	/////////////
	// CHASSIS //
	/////////////
	
	int CHASSIS_NUM = 8
	int array CHASSIS_LIST
	int array CHASSIS_ARMOUR
	int array CHASSIS_HEALTH
	int array CHASSIS_SPEED
	
	// Wooden
	CHASSIS_LIST[0] = 'I00I'
	CHASSIS_ARMOUR[0] = 'A01B'
	CHASSIS_HEALTH[0] = 'A01I'
	CHASSIS_SPEED[0] = 'A014'
	// Copper
	CHASSIS_LIST[1] = 'I00J'
	CHASSIS_ARMOUR[1] = 'A01C'
	CHASSIS_HEALTH[1] = 'A01J'
	CHASSIS_SPEED[1] = 'A015'
	// Iron
	CHASSIS_LIST[2] = 'I00K'
	CHASSIS_ARMOUR[2] = 'A01D'
	CHASSIS_HEALTH[2] = 'A01K'
	CHASSIS_SPEED[2] = 'A016'
	// Steel
	CHASSIS_LIST[3] = 'I00L'
	CHASSIS_ARMOUR[3] = 'A01E'
	CHASSIS_HEALTH[3] = 'A01K'
	CHASSIS_SPEED[3] = 'A017'
	// Aluminium
	CHASSIS_LIST[4] = 'I00M'
	CHASSIS_ARMOUR[4] = 'A01F'
	CHASSIS_HEALTH[4] = 'A01L'
	CHASSIS_SPEED[4] = 'A015'
	// Titanium
	CHASSIS_LIST[5] = 'I00N'
	CHASSIS_ARMOUR[5] = 'A01G'
	CHASSIS_HEALTH[5] = 'A01M'
	CHASSIS_SPEED[5] = 'A018'
	// Fibreglass
	CHASSIS_LIST[6] = 'I00O'
	CHASSIS_ARMOUR[6] = 'A01D'
	CHASSIS_HEALTH[6] = 'A01L'
	CHASSIS_SPEED[6] = 'A019'
	// Reinforced
	CHASSIS_LIST[7] = 'I00P'
	CHASSIS_ARMOUR[7] = 'A01H'
	CHASSIS_HEALTH[7] = 'A01N'
	CHASSIS_SPEED[7] = 'A01A'

	//////////////
	// RECIPIES //
	//////////////
	int BLUEPRINTS_JEEP = 'I00Q'
	int BLUEPRINTS_HUMVEE = 'I00R'
	int BLUEPRINTS_TANK = 'I00S'
	int BLUEPRINTS_COBRA = 'I00T'
	int BLUEPRINTS_TRANSPORT = 'I00U'
	int BLUEPRINTS_AAHELI = 'I00V'
	
endglobals

bool Trig_Mechanic_Recipie_Conditions() {
	// TODO: GetTriggerUnit() should be survivor, too
	int itemId = GetItemTypeId(GetManipulatedItem())
	return \
		itemId == BLUEPRINTS_JEEP || \
		itemId == BLUEPRINTS_HUMVEE || \
		itemId == BLUEPRINTS_TANK || \
		itemId == BLUEPRINTS_COBRA || \
		itemId == BLUEPRINTS_TRANSPORT || \
		itemId == BLUEPRINTS_AAHELI
}

void Trig_Mechanic_Recipie_Actions() {
	player owner = GetOwningPlayer(GetTriggerUnit())
	location point = GetUnitLoc(GetTriggerUnit())
	int itemId = GetItemTypeId(GetManipulatedItem())
	
	int chassis_index = -1
	int engine_index = -1
	int vehicle = 0
	int i
	
	
	i = 0
	while (i < ENGINE_NUM) {
		// Item in slot 1 (top left) should be an engine. Find out which one.
		if (GetItemTypeId(UnitItemInSlot(GetTriggerUnit(), 0)) == ENGINE_LIST[i]) {
			engine_index = i
			break
		}
	}
	
	i = 0
	while (i < CHASSIS_NUM) {
		// Item in slot 2 (top right) should be a chassis. Find out which one.
		if (GetItemTypeId(UnitItemInSlot(GetTriggerUnit(), 1)) == CHASSIS_LIST[i]) {
			chassis_index = i
			break
		}
	}
	
	if (engine_index < 0 || chassis_index < 0) {
		// No chassis or engine. Fail
		force ownerForce = GetForceOfPlayer(owner))
		DisplayTimedTextToForce(ownerForce, 3, "Invalid recipie usage. Ensure an engine of a sufficient tier is at top left inventory slot, and a chassis of a sufficient tier is in top right inventory slot.")
		DestroyForce(ownerForce)
		RemoveLocation(point)
		ownerForce = null
		point = null
		return
	}
	
	// JEEP
	if (itemId == 'I00Q') {
		CreateUnitAtLoc(owner, 'h00G', point, bj_UNIT_FACING)
	}
	// HUMVEE
	if (Trig_Mechanic_Recipie_Func009C()) {
		CreateNUnitsAtLoc(1, 'h00G', owner, point, bj_UNIT_FACING)
		RemoveItem(GetItemOfTypeFromUnitBJ(GetTriggerUnit(), 'I00R'))
		udg_TEMP_Real = 1
	}
	// TANK
	if (Trig_Mechanic_Recipie_Func011C()) {
		CreateNUnitsAtLoc(1, 'h00H', owner, point, bj_UNIT_FACING)
		RemoveItem(GetItemOfTypeFromUnitBJ(GetTriggerUnit(), 'I00S'))
		udg_TEMP_Real = 1
	}
	// COBRA
	if (Trig_Mechanic_Recipie_Func013C()) {
		CreateNUnitsAtLoc(1, 'n009', owner, point, bj_UNIT_FACING)
		RemoveItem(GetItemOfTypeFromUnitBJ(GetTriggerUnit(), 'I00T'))
		udg_TEMP_Real = 1
	}
	// TRANSPORT
	if (Trig_Mechanic_Recipie_Func015C()) {
		CreateNUnitsAtLoc(1, 'n005', owner, point, bj_UNIT_FACING)
		RemoveItem(GetItemOfTypeFromUnitBJ(GetTriggerUnit(), 'I00U'))
		udg_TEMP_Real = 1
	}
	// AH-64
	if (Trig_Mechanic_Recipie_Func017C()) {
		CreateNUnitsAtLoc(1, 'n00B', owner, point, bj_UNIT_FACING)
		RemoveItem(GetItemOfTypeFromUnitBJ(GetTriggerUnit(), 'I00V'))
		udg_TEMP_Real = 1
	}
	if (Trig_Mechanic_Recipie_Func019C()) {
		udg_TEMP_Player_Group = GetForceOfPlayer(owner)
		DisplayTimedTextToForce(udg_TEMP_Player_Group, 3, "TRIGSTR_1512")
		DestroyForce(udg_TEMP_Player_Group)
		return
	} else {
		RemoveItem(UnitItemInSlotBJ(GetTriggerUnit(), 1))
		RemoveItem(UnitItemInSlotBJ(GetTriggerUnit(), 2))
		UnitAddAbilityBJ(ENGINE_SPEED[engine_index], GetLastCreatedUnit())
		UnitAddAbilityBJ(ENGINE_FUELTANK[engine_index], GetLastCreatedUnit())
		UnitAddAbilityBJ(ENGINE_USAGE[engine_index], GetLastCreatedUnit())
		UnitAddAbilityBJ(ENGINE_REFUEL[engine_index], GetLastCreatedUnit())
		UnitAddAbilityBJ(CHASSIS_ARMOUR[chassis_index], GetLastCreatedUnit())
		UnitAddAbilityBJ(CHASSIS_HEALTH[chassis_index], GetLastCreatedUnit())
	}
	RemoveItem(GetItemOfTypeFromUnitBJ(GetTriggerUnit(), GetItemTypeId(GetManipulatedItem())))
	RemoveLocation(point)
}

//===========================================================================
void InitTrig_Mechanic_Recipie() {
	gg_trg_Mechanic_Recipie = CreateTrigger()
	TriggerRegisterAnyUnitEventBJ(gg_trg_Mechanic_Recipie, EVENT_PLAYER_UNIT_USE_ITEM)
	TriggerAddCondition(gg_trg_Mechanic_Recipie, Condition(Trig_Mechanic_Recipie_Conditions))
	TriggerAddAction(gg_trg_Mechanic_Recipie, Trig_Mechanic_Recipie_Actions)
}