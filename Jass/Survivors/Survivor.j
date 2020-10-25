scope survivor {
	public struct survivor {
		private unit u = null // The survivor
		private player p = null // The player
		private location pos = null
		private bool alive = true

		// The skill trees
		private biologist_biologist biol
		private mechanic_mechanic mech
		private poacher_poacher poach
		private engineer_engineer engi

		public int killCounter

		public static survivor create(unit surv, player play) {
			debug BJDebugMsg("Creating survivor")
			survivor data = survivor.allocate()

			data.u = surv
			data.p = play
			data.killCounter = 0

			return data
		}

		public player getPlayer() {
			return this.p
		}

		public unit getUnit() {
			return this.u
		}

		public bool isAlive() {
			return this.alive
		}

		public void deathActions() {
			// Do all the stuff that happens after the survivor dies
			this.alive = false
		}

		public void debug() {
			DisplayTimedTextToPlayer(this.p, 0, 0, 5, "Player: " + I2S(GetPlayerId(this.p)))
			DisplayTimedTextToPlayer(this.p, 0, 0, 5, "Name: " + GetUnitName(this.u))
			DisplayTimedTextToPlayer(this.p, 0, 0, 5, "Position: " + R2S(GetUnitX(this.u)) + ", " + R2S(GetUnitY(this.u)))
		}

		public void killedUnit() {
			this.killCounter++
			if (this.poach.isTrained(this.getPlayer())) {
				// get gold
			}
		}
	}
}