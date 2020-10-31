scope engineer {

	private constant int ENGINEER_RESEARCH = 'ENGI'

	public struct engineer {

		public static engineer create() {
			engineer data = engineer.allocate()

			return data
		}

		public bool isTrained(player owner) {
			// Check if upgrade is researched
			return GetPlayerTechCount(owner, ENGINEER_RESEARCH, true) >= 1
		}
	}
}
