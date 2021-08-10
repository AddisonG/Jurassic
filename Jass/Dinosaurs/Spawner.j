/*
A random point is generated somewhere within a donut shape around each
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
(which is not impossible).
*/

/*
This is a picture of how the spawning table works: http://i.imgur.com/Rgoxtn0.png
The values in the first column (0) MUST be at least 100,
or there will be bad times, as I don't think I added any failsafes.
*/
struct SpawnChances {
	int array chance[4]
}

struct Spawner {
	private SpawnChances chances

	// I did it this way because these multi-dimensional are much harder in structs
	private int array quick_dino_chances[10]
	private int array tanky_dino_chances[10]
	private int array flyer_dino_chances[10]
	private int array pest_dino_chances[10]

	public int min_distance = 1000

	// The current level of dinosaurs that are spawning
	public int current_level

	// The target that units spawned by this will hunt
	public unit target

	// Whether or not the spawner is enabled
	public bool enabled

	public static thistype create(unit target) {
		thistype data = thistype.allocate()
		data.target = target
		data.current_level = 0
		data.enabled = false

		int level = 0
		while (level < 5) {
			// Static, for now. Every level has the same chances
			data.quick_dino_chances[level] = 30
			data.tanky_dino_chances[level] = 30
			data.flyer_dino_chances[level] = 25
			data.pest_dino_chances[level] = 15

			level++
		}

		data.chances = SpawnChances.create()
		data.chances.chance[0] = data.quick_dino_chances[data.current_level]
		data.chances.chance[1] = data.tanky_dino_chances[data.current_level]
		data.chances.chance[2] = data.flyer_dino_chances[data.current_level]
		data.chances.chance[3] = data.pest_dino_chances[data.current_level]

		return data
	}

	/* If every dino had a spawn chance of 25, and the dino_type was 24, then
	 * the dinosaur in the first slot would spawn. (Because 24 <= 25)
	 *
	 * If the dino_type was 26, then the first dino would not spawn, but
	 * dino_type would be reduced by 25 (to a value of 1). The second dinosaur
	 * would spawn, since 1 <= 25
	**/
	private int get_dino_type() {
		int dino_type = GetRandomInt(1, 100)
		int i = 0
		while (dino_type > chances.chance[i]) {
			dino_type -= chances.chance[i]
			i++
		}
		return S2ID("d" + I2S(current_level) + "_" + I2S(i))
	}

	/* Ensure that the potential spawn location is not too close to other
	 * survivors. If it's too close to one of them, reject it.
	**/
	private bool valid_spawn_location(location loc) {
		// Ensure it is pathable, and inside map
		bool pathable = IsTerrainPathable(GetLocationX(loc), GetLocationY(loc), PATHING_TYPE_WALKABILITY)
		pathable = pathable && RectContainsCoords(WHOLE_MAP, GetLocationX(loc), GetLocationY(loc))
		if (not pathable) {
			return false
		}

		int s = 0
		while (s < 7) {
			if (SURVIVORS[s].is_alive()) {
				// If the spawn location is too close to a survivor, we reject it
				location other_survivor = GetUnitLoc(SURVIVORS[s].get_unit())
				if (proximity_check(loc, other_survivor, min_distance)) {
					RemoveLocation(other_survivor)
					return false
				}
				RemoveLocation(other_survivor)
			}
			s++
		}
		return true
	}

	private location get_dino_spawn_location() {
		location survivor_location = GetUnitLoc(target)
		int max_distance = min_distance + 3000

		location potential_spawn = null
		while (potential_spawn == null) {
			// Get a random point.
			potential_spawn = PolarProjectionBJ(survivor_location, \
				GetRandomReal(min_distance, max_distance), GetRandomReal(0, 359))

			// Ensure it isn't too close to any other survivor
			if (!valid_spawn_location(potential_spawn)) {
				RemoveLocation(potential_spawn)
				potential_spawn = null
			}

			// Slowly increase max distance up to 5000
			max_distance = IMinBJ(max_distance + 200, 5000)
		}

		RemoveLocation(survivor_location)
		survivor_location = null
		return potential_spawn
	}

	public Dinosaur spawn_dino() {
		if (not enabled) {
			debug BJDebugMsg("Spawner is disabled. Not spawning")
			return null
		}
		int dino_type = get_dino_type()
		location dino_spawn = get_dino_spawn_location()
		Dinosaur new_dino = Dinosaur.create(dino_type, dino_spawn, target)
		RemoveLocation(dino_spawn)

		return new_dino
	}

	public bool is_enabled() {
		return enabled
	}
}

// void Setup_Spawner() {
// 	// Create a spawner for each player
// 	// The spawn loop will manage them
// 	debug BJDebugMsg("SETUP SPAWNER")

// 	Spawner foo = Spawner.create(SURVIVORS[0].get_unit())
// 	foo.enabled = true
// 	foo.spawn_dino()
// }

// //===========================================================================
// void InitTrig_Spawner() {
// 	trigger t = CreateTrigger()
// 	TriggerAddAction(t, function Setup_Spawner)
// 	TriggerRegisterTimerEvent(t, 1, false)
// }
