constant int ENGINEER_RESEARCH = 'ENGI'

struct Engineer extends array {
	implement Alloc

	public static thistype create() {
		thistype data = thistype.allocate()
		return data
	}

	public bool is_trained(player owner) {
		// Check if upgrade is researched
		return GetPlayerTechCount(owner, ENGINEER_RESEARCH, true) >= 1
	}
}
