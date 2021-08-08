struct Director extends array {
	implement Alloc

	private Dinosaur dino_list

	public static thistype create() {
		thistype data = thistype.allocate()

		// Linked list starts with nothing in it
		data.dino_list = -1

		// Each survivor should already have a spawner - Enable them all
		int i = 0
		while (i < 7) {
			Survivor s = SURVIVORS[i]
			if (s.is_alive()) {
				s.get_spawner().enabled = true
			}
			i++
		}

		return data
	}

	private void prepend_dino(Dinosaur dino) {
		dino.next = dino_list
		if (dino_list > 0) {
			dino_list.prev = dino
		}
		dino_list = dino
	}

	private void spawn() {
		// Spawn a dinosaur to hunt each survivor
		int i = 0
		while (i < 7) {
			Survivor s = SURVIVORS[i]
			if (s.is_alive()) {
				Dinosaur dino = s.get_spawner().spawn_dino()
				prepend_dino(dino)
			}
			i++
		}
	}

	private void move() {
		Dinosaur dino = dino_list
		while (dino > 0) {
			dino.approach()
			dino = dino.next
		}
	}

	public void test() {
		while (true) {
			TriggerSleepAction(10)
			spawn()
			move()
		}
	}
}

void Director_Actions() {
	debug BJDebugMsg("Director_Actions")
	// Create and run the director
	Director director = Director.create()
	director.test()
}

//===========================================================================
void InitTrig_Director() {
	// The director begins as soon as the grace period is over
	trigger t = CreateTrigger()
	// TriggerRegisterTimerExpireEvent(t, GRACE_TIMER)
	TriggerRegisterTimerEvent(t, 1, false) // TEMPORARY
	TriggerAddAction(t, function Director_Actions)
}
