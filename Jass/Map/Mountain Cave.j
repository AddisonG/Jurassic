bool Trig_Mountain_Cave_Conditions() {
	// Must be a ground unit
	return IsUnitType(GetTriggerUnit(), UNIT_TYPE_GROUND)
}

void Trig_Mountain_Cave_Actions() {
	location temp
	TriggerSleepAction(0.30)
	ShowUnit(GetTriggerUnit(), false)
	TriggerSleepAction(1.20)
	ShowUnit(GetTriggerUnit(), true)
	
	if (RectContainsLoc(gg_rct_Cave_West, GetUnitLoc(GetTriggerUnit()))) {
		temp = Location(GetRectCenterX(gg_rct_Cave_East) + 150, GetRectCenterY(gg_rct_Cave_East))
		SetUnitPositionLocFacingBJ(GetTriggerUnit(), temp, 350)
	} else {
		temp = Location(GetRectCenterX(gg_rct_Cave_West) - 150, GetRectCenterY(gg_rct_Cave_West))
		SetUnitPositionLocFacingBJ(GetTriggerUnit(), temp, 200)
	}
	SelectUnitForPlayerSingle(GetTriggerUnit(), GetOwningPlayer(GetTriggerUnit()))
	
	RemoveLocation(temp)
	temp = null
}

//===========================================================================
void InitTrig_Mountain_Cave() {
	trigger t = CreateTrigger()
	
	// Enter east or west
	TriggerRegisterEnterRectSimple(t, gg_rct_Cave_West)
	TriggerRegisterEnterRectSimple(t, gg_rct_Cave_East)
	
	TriggerAddCondition(t, Condition(function Trig_Mountain_Cave_Conditions))
	TriggerAddAction(t, function Trig_Mountain_Cave_Actions)
}