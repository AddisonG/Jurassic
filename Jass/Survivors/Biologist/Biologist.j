constant int BIOLOGIST_RESEARCH = 'BIOL'

struct Biologist extends array {
	implement Alloc

	public static thistype create() {
		thistype data = thistype.allocate()
		return data
	}

	public bool is_trained(player owner) {
		// Check if upgrade is researched
		return GetPlayerTechCount(owner, BIOLOGIST_RESEARCH, true) >= 1
	}
}
