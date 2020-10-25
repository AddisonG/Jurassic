scope poacher {

	private constant int POACHER_RESEARCH = 'POCH'

	public struct poacher {

		public static poacher create() {
			poacher data = poacher.allocate()

			return data
		}

		public static bool isTrained(player owner) {
			// Check if upgrade is researched
			return GetPlayerTechCount(owner, POACHER_RESEARCH, true) >= 1
		}
	}
}