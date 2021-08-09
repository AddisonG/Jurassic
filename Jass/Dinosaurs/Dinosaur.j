// The radius of the circle the dinosaur will move to, relative to the
// length of the line between the dinosaur and the target
constant real CIRCLE_RADIUS_PERCENT = 0.40
constant int CIRCLE_RADIUS_MINIMUM = 800

// The center of the circle the dinosaur will move to, relative to the
// target, and the line between the dinosaur and the target
// (0 is on the survivor, 1 is on the dinosaur)
constant real CIRCLE_CENTER_DISTANCE_PERCENT = 0.20
constant real CIRCLE_CENTER_DISTANCE_EXTRA = 500

struct Dinosaur extends array {
	implement Alloc

	// The dino unit
	public unit dino

	// Linked list (list of all dinosaurs)
	public Dinosaur next
	public Dinosaur prev

	// The unit that this dino is hunting
	public unit target

	public static thistype create(integer dino_type, location spawn_loc, unit target) {
		log("Dino create")
		thistype data = thistype.allocate()

		data.target = target
		data.dino = CreateUnitAtLoc(Player(11), dino_type, spawn_loc, 0)
		data.next = -1
		data.prev = -1

		// Stop it from trying to defend the position it spawned at
		RemoveGuardPosition(data.dino)

		return data
	}

	/**
	 * Sets the dinosaur to attack move somewhere in a circle around the
	 * target. This prevents the dinosaur from following in a straight line
	 * towards the target, and ensures that several dinosaurs don't clump up
	 * too much.
	 *
	 * There are a few variables here for attempting to get dinosaurs to
	 * surround the survivors, and not end up stuck in a single area.
	 *
	 * TODO: Consider: Factor in the previous target location???
	 * TODO: Factor in invisible targets
	 */
	public void approach() {
		log("Dino approach")

		// Find the distance and angle between the dinosaur and target
		location dino_location = GetUnitLoc(dino)
		location target_location = GetUnitLoc(target)
		real distance = CIRCLE_CENTER_DISTANCE_EXTRA + \
			DistanceBetweenPoints(dino_location, target_location)
		real angle = AngleBetweenPoints(dino_location, target_location)

		// Find a point between the dinosaur and the target
		location circle_center = PolarProjectionBJ(dino_location, \
			distance * CIRCLE_CENTER_DISTANCE_PERCENT, angle)

		// Offset from the point to a random place within a circle
		location destination = PolarProjectionBJ(circle_center, \
			GetRandomInt(0, IMaxBJ(CIRCLE_RADIUS_MINIMUM, \
				R2I(distance * CIRCLE_RADIUS_PERCENT))), \
			GetRandomInt(0, 360))

		// CODE FOR PERFECT DISTRIBUTION OF POINTS IN CIRCLE
		/*real t = 2 * bj_PI * GetRandomReal(0, 1)
		real r = SquareRoot(GetRandomReal(0, 1))
		real x_coord = r * Cos(t)
		real y_coord = r * Sin(t)*/

		IssuePointOrderLoc(dino, "attack", destination)

		RemoveLocation(dino_location)
		RemoveLocation(target_location)
		RemoveLocation(circle_center)
		RemoveLocation(destination)
	}

	// Make the dino wander aimlessly, within a small area
	public void wander() {
		log("Dino wander")
	}

	// This executes on dinosaur death
	public void death() {
		log("Dino death")
	}

	public void print_dino() {
		log("")
	}

	public void destroy() {
		// Remove self from the linked list
		if (prev > 0) {
			prev.next = next
		}
		if (next > 0) {
			next.prev = prev
		}
		this.deallocate()
	}
}
