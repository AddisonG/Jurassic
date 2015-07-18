globals
	timer TIP_TIMER = CreateTimer()
	force TIP_PLAYERS = CreateForce()
	int TIP_NUM = 16
	string array TIPS
endglobals

void Show_Tip() {
	DisplayTimedTextToForce(TIP_PLAYERS, 5, TIPS[GetRandomInt(0, TIP_NUM)])
}

void Tip_Init_Actions() {
	TIPS[0] = "Type \"-base\" to show prospective places to set up at."
	TIPS[1] = "Type \"-share X\" to partially share units with player X. This allows them to get in your vehicles, tent, etc."
	TIPS[2] = "Type \"-fshare X\" to fully share units with player X. This allows them to control all of your units."
	TIPS[3] = "Type \"-unshare X\" to stop sharing units with player X."
	TIPS[4] = "type \"-drop\" to remove the ability to harvest, and \"-pickup\" to gain it again, Good for running through trees."
	TIPS[5] = "Mining sites can always be walked around, from all sides. However, the gap is very small."
	TIPS[6] = "Large dinosaurs deal cleave damage. This won't affect buildings much, but will eventually destroy trees."
	TIPS[7] = "Bigger dinosaurs spawn every " + I2S(180 + (20 * DIFFICULTY)) + \
		" seconds. They get more fiece every " + I2S(115 + (15 * DIFFICULTY)) + " seconds."
	TIPS[8] = "Tents have a moderate range to get in and out of them (just like in the original). Useful for jumping over barricades/cliffs."
	TIPS[9] = "Scout towers aren't always worth upgrading. No other building or unit provides comparable vision."
	TIPS[10] = "Bases usually can't sustain a team more than 15 minutes. Resources are limited, so moving bases is neccesary (and risky)."
	TIPS[11] = "When moving base, plan the journey beforehand, and organize who will barricade each entrance of the new base."
	TIPS[12] = "Dinosaurs, for the most part, spawn close to survivors, and move in their general direction."
	TIPS[13] = "More powerful \"Roaming\" dinosaurs spawn all across the map. They pose a major threat to lone survivors, and bases they encounter."
	TIPS[14] = "By mining a site as much as possible before upgrading it, its value is maximized. There's profit to be had."
	TIPS[15] = "Type \"-notips\" or \"-tips\" to enable/disable tips."
	TimerStart(TIP_TIMER, 90, true, function Show_Tip)
}

//===========================================================================
void InitTrig_Tip_Init() {
	trigger t = CreateTrigger()
	TriggerRegisterTimerEvent(t, 0, false)
	TriggerAddAction(t, function Tip_Init_Actions)
}