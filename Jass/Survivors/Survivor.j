scope survivor {
	public struct survivor {
		private unit u = null // The survivor
		private player p = null // The player
		private location pos = null
		
		// The skill trees
		private biologist_biologist biol
		private mechanic_mechanic mech
		private poacher_poacher poach
		private engineer_engineer engi
		
		public int killCounter
		
		public static survivor create(unit surv, player play) {
			survivor data = survivor.allocate()
			
			data.u = surv
			data.p = play
			data.killCounter = 0
			
			return data
		}
		
		public void killedUnit() {
			this.killCounter++
			if (this.poach.isTrained(this.p)) {
				// get gold
			}
		}
	}
}