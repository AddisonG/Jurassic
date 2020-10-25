scope biologist {

	private constant int BIOLOGIST_RESEARCH = 'BIOL'

	public struct biologist {

		public static biologist create() {
			biologist data = biologist.allocate()

			return data
		}

		public static bool isTrained(player owner) {
			// Check if upgrade is researched
			return GetPlayerTechCount(owner, BIOLOGIST_RESEARCH, true) >= 1
		}
	}
}