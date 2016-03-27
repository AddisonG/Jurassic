scope mechanic {
	
	private static final int VEHICLE_CAP = 3
	
	public struct mechanic {
		
		private int vehicleCount
		
		public static mechanic create() {
			mechanic data = mechanic.allocate()
			
			data.vehicleCount = 0
			
			return data
		}
		
		public void buildVehicle(unit survivor, unittype vehicle) {
			if (vehicleCount >= VEHICLE_CAP) {
				// Friendly message
				return
			}
			
			vehicleCount++
		}
		
		public void destroyVehicle(unit vehicle) {
			if (vehicleCount > 0) {
				vehicleCount--
			}
		}
		
		public static void mechanicSkill(unit survivor, unit target) {
			// Use mechanic secret skill
		}
		
		public static bool isTrained(player owner) {
			// Check if upgrade is researched
			return GetPlayerTechCount(owner, '0000', true) >= 1
		}
	}
}