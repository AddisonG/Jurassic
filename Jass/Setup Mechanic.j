void Setup_Mechanic() {
	// -------- Set Engines --------
	// Heat
	MECH_ENGINE_List[0] = 'I005'
	MECH_ENGINE_FuelTank[0] = 'A00M'
	MECH_ENGINE_Refuel[0] = 'A013'
	MECH_ENGINE_Speed[0] = 'A00S'
	MECH_ENGINE_Usage[0] = 'A00Z'
	// Steam
	MECH_ENGINE_List[1] = 'I006'
	MECH_ENGINE_FuelTank[1] = 'A00N'
	MECH_ENGINE_Refuel[1] = 'A01O'
	MECH_ENGINE_Speed[1] = 'A00T'
	MECH_ENGINE_Usage[1] = 'A00Z'
	// Diesel
	MECH_ENGINE_List[2] = 'I007'
	MECH_ENGINE_FuelTank[2] = 'A00O'
	MECH_ENGINE_Refuel[2] = 'A01P'
	MECH_ENGINE_Speed[2] = 'A00U'
	MECH_ENGINE_Usage[2] = 'A010'
	// Gas
	MECH_ENGINE_List[3] = 'I008'
	MECH_ENGINE_FuelTank[3] = 'A00O'
	MECH_ENGINE_Refuel[3] = 'A01Q'
	MECH_ENGINE_Speed[3] = 'A00V'
	MECH_ENGINE_Usage[3] = 'A00Z'
	// Electric
	MECH_ENGINE_List[4] = 'I009'
	MECH_ENGINE_FuelTank[4] = 'A00P'
	MECH_ENGINE_Refuel[4] = 'A01R'
	MECH_ENGINE_Speed[4] = 'A00W'
	MECH_ENGINE_Usage[4] = 'A011'
	// Hybrid
	MECH_ENGINE_List[5] = 'I00A'
	MECH_ENGINE_FuelTank[5] = 'A00Q'
	MECH_ENGINE_Refuel[5] = 'A01S'
	MECH_ENGINE_Speed[5] = 'A00X'
	MECH_ENGINE_Usage[5] = 'A011'
	// Reactor
	MECH_ENGINE_List[6] = 'I00B'
	MECH_ENGINE_FuelTank[6] = 'A00R'
	MECH_ENGINE_Refuel[6] = 'A01S'
	MECH_ENGINE_Speed[6] = 'A00Y'
	MECH_ENGINE_Usage[6] = 'A012'
	
	// -------- Set Chassis --------
	// Wooden
	MECH_CHASSIS_List[0] = 'I00I'
	MECH_CHASSIS_Armour[0] = 'A01B'
	MECH_CHASSIS_Health[0] = 'A01I'
	MECH_CHASSIS_Speed[0] = 'A014'
	// Copper
	MECH_CHASSIS_List[1] = 'I00J'
	MECH_CHASSIS_Armour[1] = 'A01C'
	MECH_CHASSIS_Health[1] = 'A01J'
	MECH_CHASSIS_Speed[1] = 'A015'
	// Iron
	MECH_CHASSIS_List[2] = 'I00K'
	MECH_CHASSIS_Armour[2] = 'A01D'
	MECH_CHASSIS_Health[2] = 'A01K'
	MECH_CHASSIS_Speed[2] = 'A016'
	// Steel
	MECH_CHASSIS_List[3] = 'I00L'
	MECH_CHASSIS_Armour[3] = 'A01E'
	MECH_CHASSIS_Health[3] = 'A01K'
	MECH_CHASSIS_Speed[3] = 'A017'
	// Aluminium
	MECH_CHASSIS_List[4] = 'I00M'
	MECH_CHASSIS_Armour[4] = 'A01F'
	MECH_CHASSIS_Health[4] = 'A01L'
	MECH_CHASSIS_Speed[4] = 'A015'
	// Titanium
	MECH_CHASSIS_List[5] = 'I00N'
	MECH_CHASSIS_Armour[5] = 'A01G'
	MECH_CHASSIS_Health[5] = 'A01M'
	MECH_CHASSIS_Speed[5] = 'A018'
	// Fibreglass
	MECH_CHASSIS_List[6] = 'I00O'
	MECH_CHASSIS_Armour[6] = 'A01D'
	MECH_CHASSIS_Health[6] = 'A01L'
	MECH_CHASSIS_Speed[6] = 'A019'
	// Reinforced
	MECH_CHASSIS_List[7] = 'I00P'
	MECH_CHASSIS_Armour[7] = 'A01H'
	MECH_CHASSIS_Health[7] = 'A01N'
	MECH_CHASSIS_Speed[7] = 'A01A'
}

//===========================================================================
void InitTrig_Setup_Mechanic() {
	trigger t = CreateTrigger()
	TriggerAddAction(t, function Setup_Mechanic)
}