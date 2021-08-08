constant int POACHER_RESEARCH = 'POCH'

struct Poacher extends array {
	implement Alloc

	public static thistype create() {
		thistype data = thistype.allocate()
		return data
	}

	public bool is_trained(player owner) {
		// Check if upgrade is researched
		return GetPlayerTechCount(owner, POACHER_RESEARCH, true) >= 1
	}
}
