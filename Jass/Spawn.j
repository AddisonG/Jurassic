/*
A random point will is generated somewhere within a doughnut shape around each
survivor, to be used as the point to spawn a dinosaur at.

The initial minimum distance is: (1000 - 150 * difficulty) units
The initial maximum distance is: (minimum distance + 3000) units

In this way, there is always a chance of a dinosaur spawning dangerously close,
or several spawning far away before they eventually gather at the survivors location.

To prevent the issue of a dinosaur spawning on top of another friendly survivor
(such as in the case of 2 survivors standing 1500 units apart), the point generated
will be tested to ensure it is not within the minimum threshold of any other survivor.

Additionally, the points 'walkability' value must be on, to prevent spawns
outside of the map, within trees (mostly), and on cliffs.

If either of these conditions mentioned above fail, then the maximum spawn
distance will increase by 10% (stacking), and the trigger will be called again.
The increase in spawn distance is to prevent the situation in which there are no
(or very few) valid spawn points in range of the survivor.

For example, consider the case in which a survivor is in the very top left corner
of the map. 3/4 of his spawns will fail simply due to the random angle they are
located in (any spawns not between 90 and 180 degrees are outside the map). Now
consider if the whole group of survivors was in the corner, spread out over a
few thousand units. Even spawns that are in the correct direction have a near
guaranteed chance of failure because of their proximity to other friendly survivors.
In this way, it will become more likely to spawn successfully the longer the
spawner tries, although the maximum spawn distance is reset upon a successful
spawn. This method is not a completely effective fix, as the game will likely
lag terribly (when dinos spawn) in the event of the previous scenario occurring
(which is not impossible or improbable).
*/

globals
	// spawn_point is set as a global, so it may be used in Verify_Point.
	location spawn_point
endglobals

// Returns false if the point is closer than MinDistance to the point.
// Math is: sqrt((player_x - spawn_x)^2 + (player_y - spawn_y)^2).
boolean Proximity_Check(location player_point) {
	real x_diff_sqrd = Pow(GetLocationX(spawn_point) - GetLocationX(player_point), 2)
	real y_diff_sqrd = Pow(GetLocationY(spawn_point) - GetLocationY(player_point), 2)
	return SquareRoot(x_diff_sqrd + y_diff_sqrd) >= SPAWN_MIN_DIST
}

// As this is for execution in a ForGroup loop, no parameters or retval is allowed.
void Verify_Point() {
	location player_point = GetUnitLoc(GetEnumUnit())
	if (!Proximity_Check(player_point)) {
		// Point was too close to a survivor. Increase MaxDistance, to approach 5'000
		SPAWN_MAX_DIST = SPAWN_MAX_DIST * 0.96 + 200
		RemoveLocation(player_point)
		// This point has been proved invalid. Free it.
		RemoveLocation(spawn_point)
		spawn_point = null
		
		// We have failed, while inside of a ForGroup().
		// By setting the global variable 'spawn_point' to null, we can let our caller know we failed.
	}
	player_point = null
}

// Note that SPAWN_Survivor is set before this method is called.
void Spawn_Actions() {
	loop
		spawn_point = PolarProjectionBJ(udg_SPAWN_Survivor, GetRandomReal(SPAWN_MIN_DIST, SPAWN_MAX_DIST), GetRandomReal(0, 360))
		// Loop/retry until point is pathable.
		boolean pathable = IsTerrainPathable(GetLocationX(spawn_point), GetLocationY(spawn_point), PATHING_TYPE_WALKABILITY)
		// Ensures point chosen is not closer than (SPAWN_MinDistance) units from any survivor.
		ForGroup(SURVIVORS, function Verify_Point)
		boolean failed = (spawn_point == null)
		// MaxDistance approaches 5'000, to increase chances of point being pathable
		SPAWN_MAX_DIST = SPAWN_MAX_DIST * 0.96 + 200
	endloop
	
	// Ensures point chosen is within playable map bounds. PROBABLY DON'T NEED THIS ANYMORE, BECAUSE OF WALKABILITY CHECK???
//	if (RectContainsCoords(WHOLE_MAP, GetLocationX(spawn_point), GetLocationY(spawn_point))) {
//		set SPAWN_MAX_DIST = SPAWN_MAX_DIST * 0.96 + 200
//	}
	
	// Found a point to spawn a dinosaur at. Now to decide which one.
	
	int dino_type = GetRandomInt(0, 100)
	//DisplayTimedTextToPlayer(GetLocalPlayer(), 0, 0, 4, ("RANDOM = " + I2S(dino_type)))
	
	// If every dino had a spawn chance of 25, and the dino_type was 24, then
	// the dinosaur in the first slot would spawn. (Because 24 < 25)
	// 
	// If the dino_type was 26, then the first dino would not spawn, but
	// dino_type would be reduced by 25 (to a value of 1). The second dinosaur
	// would spawn, since 1 < 25
	int i = 0
	while (dino_type > LoadInteger(DINOSAURS[DINO_LEVEL], i, 0)) {
		dino_type -= LoadInteger(DINOSAURS[DINO_LEVEL], i, 0)
		i++
	}
	// The dino_type has been decided on, as well as the spawn location. Spawn.
	CreateUnitAtLoc(Player(11), LoadInteger(DINOSAURS[DINO_LEVEL], i, 1), spawn_point, bj_UNIT_FACING)
	
	spawn_point = null
}

//===========================================================================
void InitTrig_Spawn() {
	// Don't rename this trigger
	gg_trg_Spawn = CreateTrigger()
	DisableTrigger(gg_trg_Spawn)
	TriggerAddAction(gg_trg_Spawn, function Spawn_Actions)
}