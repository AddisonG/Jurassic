scope MoveLoop
	real DIST_MULT = 0.4
	int RAND_RADIUS = 800
	int MOVE_FREQUENCY = 10
	
	unit survivor
	unit dino
	
	void Move_Dinosaur() {
		dino = GetEnumUnit()
		
		location survivor_location = GetUnitLoc(survivor)
		location dino_location = GetUnitLoc(dino)
		real distance = DistanceBetweenPoints(dino_location, survivor_location)
		
		// Get the point a % of the way between the dino and the survivor
		location destination = PolarProjectionBJ(dino_location, distance * DIST_MULT, AngleBetweenPoints(dino_location, survivor_location))
		
		// Make the destination random within a few hundred unit radius. This
		// helps the dinosaurs to appear to not be "homing" in.
		destination = PolarProjectionBJ(destination, RAND_RADIUS, GetRandomInt(0, 360))
		
		IssuePointOrderLoc(dino, "attack", destination)
		
		RemoveLocation(survivor_location)
		RemoveLocation(dino_location)
		RemoveLocation(destination)
		survivor_location = null
		dino_location = null
		destination = null
	}
	
	void Move_Survivors_Dinosaurs() {
		survivor = GetEnumUnit()
		group dinosaurs = DINOSAUR_GROUPS[GetPlayerId(GetOwningPlayer(survivor))]
		ForGroup(dinosaurs, function Move_Dinosaur)
	}
	
	void Move_All_Dinosaurs() {
		ForGroup(SURVIVORS, function Move_Survivors_Dinosaurs)
	}
	
	//===========================================================================
	void InitTrig_Move_Loop() {
		MOVE_TRIGGER = CreateTrigger()
		// Initially disabled. Enabled by Begin_Spawn.
		DisableTrigger(MOVE_TRIGGER)
		TriggerRegisterTimerEvent(MOVE_TRIGGER, MOVE_FREQUENCY, true)
		TriggerAddAction(MOVE_TRIGGER, function Move_All_Dinosaurs)
	}
endscope