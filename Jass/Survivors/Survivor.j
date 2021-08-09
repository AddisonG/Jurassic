struct Survivor extends array {
	implement Alloc

	private unit u // The survivor
	private player p // The player
	private bool alive
	private Spawner spawner

	// The skill trees
	private Biologist biol
	private Mechanic mech
	private Poacher poach
	private Engineer engi

	public int kill_counter

	public static thistype create(location loc, player play) {
		log("Creating survivor")
		thistype data = thistype.allocate()

		data.u = CreateUnitAtLoc(play, SURVIVOR_UNIT_TYPE, loc, GetRandomInt(0, 360))
		data.p = play
		data.alive = true
		data.kill_counter = 0
		data.spawner = Spawner.create(data.u)

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

	public Spawner get_spawner() {
		return spawner
	}

	public void death_actions() {
		// Do all the stuff that happens after the survivor dies
		this.alive = false
		this.spawner.enabled = false
	}

	public void debug() {
		log("Player: " + I2S(GetPlayerId(this.p)))
		log("Name: " + GetUnitName(this.u))
		log("Position: " + I2S(R2I(GetUnitX(this.u))) + ", " + I2S(R2I(GetUnitY(this.u))))
	}

	public void killed_unit() {
		this.kill_counter++
		if (this.poach.is_trained(this.get_player())) {
			// get gold
		}
	}
}
