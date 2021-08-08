constant int MECHANIC_RESEARCH = 'MECH'
constant int VEHICLE_CAP = 3

struct Mechanic extends array {
	implement Alloc

	private int vehicle_count

	public static thistype create() {
		thistype data = thistype.allocate()
		data.vehicle_count = 0
		return data
	}

	public void build_vehicle(unit survivor, unittype vehicle) {
		if (this.vehicle_count >= VEHICLE_CAP) {
			// Friendly message
			return
		}

		this.vehicle_count++
	}

	public void destroy_vehicle(unit vehicle) {
		if (this.vehicle_count > 0) {
			this.vehicle_count--
		}
	}

	public static void mechanic_skill(unit survivor, unit target) {
		// Use mechanic secret skill
	}

	public bool is_trained(player owner) {
		// Check if upgrade is researched
		return GetPlayerTechCount(owner, MECHANIC_RESEARCH, true) >= 1
	}
}
