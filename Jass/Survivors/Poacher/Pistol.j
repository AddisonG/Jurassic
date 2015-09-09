globals
	constant int PISTOL_DAMAGE = 60
	constant int PISTOL_RANGE = 500 // Effective range (No extra accuracy loss)
	constant int PISTOL_RELOAD = 1000 // Milliseconds
	constant int PISTOL_JAM_TIME = 5
	constant int PISTOL_TRAINED_JAM_CHANCE = 10
	constant int PISTOL_UNTRAINED_JAM_CHANCE = 25
	constant int PISTOL_TRAINED_ACCURACY = 100
	constant int PISTOL_UNTRAINED_ACCURACY = 80
	
	constant int PISTOL_ITEM = 'P_I0'
	constant int PISTOL_ABILITY = 'P_A0'
endglobals

bool Pistol_Conditions () {
	return GetItemTypeId(GetManipulatedItem()) == PISTOL_ITEM && \
		GetUnitTypeId(GetTriggerUnit()) == SURVIVOR_UNIT_TYPE
}

void Pistol_Actions () {
	unit survivor = GetTriggerUnit()
	unit target = GetEventTargetUnit()
	
	location survivor_location = GetUnitLoc(survivor)
	location target_location = GetUnitLoc(target)
	real distance = DistanceBetweenPoints(target_location, survivor_location)
	RemoveLocation(survivor_location)
	RemoveLocation(target_location)
	survivor_location = null
	target_location = null
	
	real hitChance
	int jamChance
	if (GetUnitAbilityLevel(survivor, PISTOL_ABILITY) >= 1) {
		// Trained
		hitChance = Hit_Chance(distance, PISTOL_RANGE, PISTOL_TRAINED_ACCURACY)
		jamChance = PISTOL_TRAINED_JAM_CHANCE
	} else {
		// Untrained
		hitChance = Hit_Chance(distance, PISTOL_RANGE, PISTOL_UNTRAINED_ACCURACY)
		jamChance = PISTOL_UNTRAINED_JAM_CHANCE
	}
	
	if (jamChance >= GetRandomInt(1, 100)) {
		// Gun jammed
		TextTag_UnitColor(survivor, "Jammed!", 255, 0, 0)
		return
	}
	
	// Print out the % chance of hitting above the survivors head
	TextTag_Firearm(survivor, R2I(hitChance))
	
	if (hitChance < GetRandomInt(1, 100)) {
		// Missed
		TextTag_Miss(target)
		return
	}
	
	// TODO - Play a sound
	
	UnitDamageTarget(survivor, target, PISTOL_DAMAGE, false, true,\
		AMMUNITION, DAMAGE_TYPE_NORMAL, WEAPON_TYPE_WHOKNOWS)
}

//===========================================================================
void InitTrig_Pistol () {
	trigger t = CreateTrigger()
	TriggerRegisterAnyUnitEventBJ(t, EVENT_PLAYER_UNIT_USE_ITEM)
	TriggerAddCondition(t, Condition(function Pistol_Conditions))
	TriggerAddAction(t, function Pistol_Actions)
}