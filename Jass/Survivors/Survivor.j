struct Survivor extends array {
	implement Alloc

	private unit u // The survivor
	private player p // The player
	private bool alive

	// The skill trees
	private Biologist biol
	private Mechanic mech
	private Poacher poach
	private Engineer engi

	public int kill_counter

	public static thistype create(location loc, player play) {
		debug BJDebugMsg("Creating survivor")
		thistype data = thistype.allocate()

		data.u = CreateUnitAtLoc(play, SURVIVOR_UNIT_TYPE, loc, GetRandomInt(0, 360))
		data.p = play
		data.alive = true
		data.kill_counter = 0

		return data
	}

	public player get_player() {
		return this.p
	}

	public unit get_unit() {
		return this.u
	}

	public bool is_alive() {
		return this.alive
	}

	public void death_actions() {
		// Do all the stuff that happens after the survivor dies
		this.alive = false
	}

	public void debug() {
		debug BJDebugMsg("Player: " + I2S(GetPlayerId(this.p)))
		debug BJDebugMsg("Name: " + GetUnitName(this.u))
		debug BJDebugMsg("Position: " + I2S(R2I(GetUnitX(this.u))) + ", " + I2S(R2I(GetUnitY(this.u))))
	}

	public void killed_unit() {
		this.kill_counter++
		if (this.poach.is_trained(this.get_player())) {
			// get gold
		}
	}
}
