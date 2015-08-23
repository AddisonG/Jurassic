globals
	int PISTOL_DAMAGE = 60
	int PISTOL_RANGE = 500
	int PISTOL_RELOAD = 1000 // ms
	int PISTOL_JAM_TIME = 5
	int PISTOL_TRAINED_JAM_CHANCE = 10
	int PISTOL_UNTRAINED_JAM_CHANCE = 25
	int PISTOL_TRAINED_ACCURACY = 100
	int PISTOL_UNTRAINED_ACCURACY = 80
endglobals

bool Pistol_Conditions () {
	return GetItemTypeId(GetManipulatedItem()) == 'I00W'
}

void Pistol_Actions () {
	UnitDamageTarget(GetTriggerUnit(), GetEventTargetUnit(), PISTOL_DAMAGE, false, true,\
		ATTACK_TYPE_HERO, DAMAGE_TYPE_NORMAL, WEAPON_TYPE_WHOKNOWS)
}

//===========================================================================
void InitTrig_Pistol () {
	trigger t = CreateTrigger()
	TriggerRegisterAnyUnitEventBJ(t, EVENT_PLAYER_UNIT_USE_ITEM)
	TriggerAddCondition(t, Condition(function Pistol_Conditions))
	TriggerAddAction(t, function Pistol_Actions)
}