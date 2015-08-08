globals
	int ENGINE_NUM = 7
	string array ENGINE_NAME
	int array ENGINE_LIST
	int array ENGINE_FUELTANK
	int array ENGINE_REFUEL
	int array ENGINE_SPEED
	int array ENGINE_USAGE
	
	int CHASSIS_NUM = 8
	string array CHASSIS_NAME
	int array CHASSIS_LIST
	int array CHASSIS_ARMOUR
	int array CHASSIS_HEALTH
	int array CHASSIS_SPEED
	
	int BLUEPRINTS_JEEP = 'I00Q'
	int BLUEPRINTS_HUMVEE = 'I00R'
	int BLUEPRINTS_TANK = 'I00S'
	int BLUEPRINTS_COBRA = 'I00T'
	int BLUEPRINTS_TRANSPORT = 'I00U'
	int BLUEPRINTS_AAHELI = 'I00V'
	
	int VEHICLE_JEEP = 'h00G'
	int VEHICLE_HUMVEE = 'h00G' // Haven't made Humvee yet
	int VEHICLE_TANK = 'h00H'
	int VEHICLE_COBRA = 'n009'
	int VEHICLE_TRANSPORT = 'n005'
	int VEHICLE_AAHELI = 'n00B' // lol, n00b
endglobals

void Setup_Mechanic() {
	/////////////
	// ENGINES //
	/////////////
	
	// Heat
	ENGINE_NAME[0] = "Heat"
	ENGINE_LIST[0] = 'I005'
	ENGINE_FUELTANK[0] = 'A00M'
	ENGINE_REFUEL[0] = 'A013'
	ENGINE_SPEED[0] = 'A00S'
	ENGINE_USAGE[0] = 'A00Z'
	// Steam
	ENGINE_NAME[1] = "Steam"
	ENGINE_LIST[1] = 'I006'
	ENGINE_FUELTANK[1] = 'A00N'
	ENGINE_REFUEL[1] = 'A01O'
	ENGINE_SPEED[1] = 'A00T'
	ENGINE_USAGE[1] = 'A00Z'
	// Diesel
	ENGINE_NAME[2] = "Diesel"
	ENGINE_LIST[2] = 'I007'
	ENGINE_FUELTANK[2] = 'A00O'
	ENGINE_REFUEL[2] = 'A01P'
	ENGINE_SPEED[2] = 'A00U'
	ENGINE_USAGE[2] = 'A010'
	// Gas
	ENGINE_NAME[3] = "Gas"
	ENGINE_LIST[3] = 'I008'
	ENGINE_FUELTANK[3] = 'A00O'
	ENGINE_REFUEL[3] = 'A01Q'
	ENGINE_SPEED[3] = 'A00V'
	ENGINE_USAGE[3] = 'A00Z'
	// Electric
	ENGINE_NAME[4] = "Electric"
	ENGINE_LIST[4] = 'I009'
	ENGINE_FUELTANK[4] = 'A00P'
	ENGINE_REFUEL[4] = 'A01R'
	ENGINE_SPEED[4] = 'A00W'
	ENGINE_USAGE[4] = 'A011'
	// Hybrid
	ENGINE_NAME[5] = "Hybrid"
	ENGINE_LIST[5] = 'I00A'
	ENGINE_FUELTANK[5] = 'A00Q'
	ENGINE_REFUEL[5] = 'A01S'
	ENGINE_SPEED[5] = 'A00X'
	ENGINE_USAGE[5] = 'A011'
	// Reactor
	ENGINE_NAME[6] = "Reactor"
	ENGINE_LIST[6] = 'I00B'
	ENGINE_FUELTANK[6] = 'A00R'
	ENGINE_REFUEL[6] = 'A01S'
	ENGINE_SPEED[6] = 'A00Y'
	ENGINE_USAGE[6] = 'A012'
	
	/////////////
	// CHASSIS //
	/////////////
	
	// Wooden
	CHASSIS_NAME[0] = "Wooden"
	CHASSIS_LIST[0] = 'I00I'
	CHASSIS_ARMOUR[0] = 'A01B'
	CHASSIS_HEALTH[0] = 'A01I'
	CHASSIS_SPEED[0] = 'A014'
	// Copper
	CHASSIS_NAME[1] = "Copper"
	CHASSIS_LIST[1] = 'I00J'
	CHASSIS_ARMOUR[1] = 'A01C'
	CHASSIS_HEALTH[1] = 'A01J'
	CHASSIS_SPEED[1] = 'A015'
	// Iron
	CHASSIS_NAME[2] = "Iron"
	CHASSIS_LIST[2] = 'I00K'
	CHASSIS_ARMOUR[2] = 'A01D'
	CHASSIS_HEALTH[2] = 'A01K'
	CHASSIS_SPEED[2] = 'A016'
	// Steel
	CHASSIS_NAME[3] = "Steel"
	CHASSIS_LIST[3] = 'I00L'
	CHASSIS_ARMOUR[3] = 'A01E'
	CHASSIS_HEALTH[3] = 'A01K'
	CHASSIS_SPEED[3] = 'A017'
	// Aluminium
	CHASSIS_NAME[4] = "Aluminium"
	CHASSIS_LIST[4] = 'I00M'
	CHASSIS_ARMOUR[4] = 'A01F'
	CHASSIS_HEALTH[4] = 'A01L'
	CHASSIS_SPEED[4] = 'A015'
	// Titanium
	CHASSIS_NAME[5] = "Titanium"
	CHASSIS_LIST[5] = 'I00N'
	CHASSIS_ARMOUR[5] = 'A01G'
	CHASSIS_HEALTH[5] = 'A01M'
	CHASSIS_SPEED[5] = 'A018'
	// Fibreglass
	CHASSIS_NAME[6] = "Fibreglass"
	CHASSIS_LIST[6] = 'I00O'
	CHASSIS_ARMOUR[6] = 'A01D'
	CHASSIS_HEALTH[6] = 'A01L'
	CHASSIS_SPEED[6] = 'A019'
	// Reinforced
	CHASSIS_NAME[7] = "Reinforced"
	CHASSIS_LIST[7] = 'I00P'
	CHASSIS_ARMOUR[7] = 'A01H'
	CHASSIS_HEALTH[7] = 'A01N'
	CHASSIS_SPEED[7] = 'A01A'
}

//===========================================================================
void InitTrig_Mechanic_Init() {
	trigger t = CreateTrigger()
	TriggerAddAction(t, function Setup_Mechanic)
	TriggerRegisterTimerEvent(t, 0.01, false)
}