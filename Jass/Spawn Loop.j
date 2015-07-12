void Spawn_Dino() {
	location spawn_location = GetUnitLoc(GetEnumUnit())
	// MaxDistance is set to the MinDistance + 3000. This makes a donut shape
	// in which dinosaurs will spawn. MinDistance is static, and is set according
	// to difficulty. MaxDistance increases slightly (x1.1) every time spawning
	// a dinosaur fails. This is to prevent lag if there are very few valid
	// spawning locations, such as at the very corner of the map.
	SPAWN_MAX_DIST = SPAWN_MIN_DIST + 3000
	TriggerExecute(gg_trg_Spawn)
	spawn_location = null
}

void Spawn_Loop_Actions() {
	ForGroup(SURVIVORS, function Spawn_Dino)
}

//===========================================================================
void InitTrig_Spawn_Loop() {
	// I am not using a local var, as this trigger is referenced by Begin_Spawn
	gg_trg_Spawn_Loop = CreateTrigger()
	// Initially disabled. Enabled by Begin_Spawn.
	DisableTrigger(gg_trg_Spawn_Loop)
	TriggerRegisterTimerEvent(gg_trg_Spawn_Loop, 5, true)
	TriggerAddAction(gg_trg_Spawn_Loop, function Spawn_Loop_Actions)
}