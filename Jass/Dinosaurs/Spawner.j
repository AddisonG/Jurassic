struct dino_group extends array {
	implement Alloc

	public int foo

	public static thistype create(int bar) {
		thistype data = thistype.allocate()
		data.foo = bar
		return data
	}

	public void destroy() {
		this.deallocate()
	}
}

struct spawn_chance_map {
	int array chance[4]
	int array dino[4]
}

struct spawner {
	private spawn_chance_map spawn_map

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

	public void init(unit target) {
		this.target = target
		this.current_level = 0

		int level = 0
		while (level < 5) {
			// Static, for now. Every level has the same chances
			quick_dino_chances[level] = 30
			tanky_dino_chances[level] = 30
			flyer_dino_chances[level] = 25
			pest_dino_chances[level] = 15

			level++
		}

		// Start
		spawn_map = spawn_chance_map.create()
		spawn_map.chance[0] = quick_dino_chances[current_level]
		spawn_map.chance[1] = tanky_dino_chances[current_level]
		spawn_map.chance[2] = flyer_dino_chances[current_level]
		spawn_map.chance[3] = pest_dino_chances[current_level]

		spawn_map.dino[0] = S2ID("d" + I2S(current_level) + "_" + I2S(0)) // Quick
		spawn_map.dino[1] = S2ID("d" + I2S(current_level) + "_" + I2S(1)) // Tanky
		spawn_map.dino[2] = S2ID("d" + I2S(current_level) + "_" + I2S(2)) // Flyer
		spawn_map.dino[3] = S2ID("d" + I2S(current_level) + "_" + I2S(3)) // Pest
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
		while (dino_type > spawn_map.chance[i]) {
			dino_type -= spawn_map.chance[i]
			i++
		}

		return spawn_map.dino[i]
		// return S2ID("d" + I2S(current_level) + "_" + I2S(i))
	}

	private bool valid_spawn_location(location loc) {
		int s = 0
		debug_location(loc)
		while (s <= 10) {
			if (SURVIVORS[s] >= 0) {
				// If the spawn location is too close to a survivor, we reject it
				location other_survivor = GetUnitLoc(SURVIVORS[s].getUnit())
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

			// Ensure it is pathable, and inside map
			bool pathable = IsTerrainPathable(GetLocationX(potential_spawn), GetLocationY(potential_spawn), PATHING_TYPE_WALKABILITY)
			pathable = pathable && RectContainsCoords(WHOLE_MAP, GetLocationX(potential_spawn), GetLocationY(potential_spawn))

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

	public dinosaur spawn_dino() {
		int dino_type = get_dino_type()
		location dino_spawn = get_dino_spawn_location()

		return dinosaur.create(dino_type, dino_spawn, this.target)
	}
}

/*
This is a picture of how the spawning table works: http://i.imgur.com/Rgoxtn0.png
The values in the first column (0) MUST be at least 100,
or there will be bad times, as I don't think I added any failsafes.
*/

void Setup_Spawner() {
	// Create a spawner for each player
	// The spawn loop will manage them
	debug BJDebugMsg("SETUP SPAWNER")

	debug_unit(SURVIVORS[0].getUnit())

	spawner foo = spawner.create()
	foo.init(SURVIVORS[0].getUnit())
	foo.spawn_dino()
}

//===========================================================================
void InitTrig_Spawner() {
	trigger t = CreateTrigger()
	TriggerAddAction(t, function Setup_Spawner)
	TriggerRegisterTimerEvent(t, 1, false)
}
