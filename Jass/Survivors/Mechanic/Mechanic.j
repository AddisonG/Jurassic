scope mechanic {
	
	private constant int MECHANIC_RESEARCH = 'MECH'
	private constant int VEHICLE_CAP = 3
	
	public struct mechanic {
		
		private int vehicleCount
		
		public static mechanic create() {
			mechanic data = mechanic.allocate()
			
			data.vehicleCount = 0
			
			return data
		}
		
		public void buildVehicle(unit survivor, unittype vehicle) {
			if (this.vehicleCount >= VEHICLE_CAP) {
				// Friendly message
				return
			}
			
			this.vehicleCount++
		}
		
		public void destroyVehicle(unit vehicle) {
			if (this.vehicleCount > 0) {
				this.vehicleCount--
			}
		}
		
		public static void mechanicSkill(unit survivor, unit target) {
			// Use mechanic secret skill
		}
		
		public static bool isTrained(player owner) {
			// Check if upgrade is researched
			return GetPlayerTechCount(owner, MECHANIC_RESEARCH, true) >= 1
		}
	}
}