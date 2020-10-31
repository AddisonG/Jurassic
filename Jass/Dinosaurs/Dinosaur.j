scope dinosaur {

	// The radius of the circle the dinosaur will move to, relative to the
	// length of the line between the dinosaur and the target
	private constant real CIRCLE_RADIUS_PERCENT = 0.40
	private constant int CIRCLE_RADIUS_MINIMUM = 300

	// The center of the circle the dinosaur will move to, relative to the
	// target, and the line between the dinosaur and the target
	// (0 is on the survivor, 1 is on the dinosaur)
	private constant real CIRCLE_CENTER_DISTANCE_PERCENT = 0.30
	private constant real CIRCLE_CENTER_DISTANCE_EXTRA = 100

	// A time between 0 and MAX_MOVE_DELAY seconds is chosen before the dinosaur
	// will actually begin its move. This is to prevent dinosaurs from moving at
	// the same moment if a loop is used to move several at once.
	private constant real MAX_MOVE_DELAY = 6

	public struct dinosaur {
		private unit u = null // The dinosaur
		private unit target = null // The unit this dinosaur is approaching

		public void init() {
			// init stuff
		}

		/**
		 * Sets the dinosaur to attack move somewhere in a circle located
		 * between the dinosaur and the target. This prevents the dinosaur from
		 * following in a straight line towards the target, and ensures that
		 * several dinosaurs don't clump up too much.
		 *
		 * There are a few variables here for attempting to get dinosaurs to
		 * surround the survivors, and not end up stuck in a single area.
		 *
		 * TODO: Consider: Factor in the previous target location???
		 * TODO: Factor in invisible targets
		 */
		public void move() {
			TriggerSleepAction(GetRandomReal(0, MAX_MOVE_DELAY))

			// Find the distance and angle between the dinosaur and target
			location dino_location = GetUnitLoc(dino)
			location target_location = GetUnitLoc(target)
			real distance = CIRCLE_CENTER_DISTANCE_EXTRA + \
				DistanceBetweenPoints(dino_location, target_location)
			real angle = AngleBetweenPoints(dino_location, target_location)

			// Find the center of the circle between the dinosaur and target
			location circle_center = PolarProjectionBJ(dino_location, \
				distance * CIRCLE_CENTER_DISTANCE_PERCENT, angle)

			// Offset from the point to a random place within the circle

			location destination = PolarProjectionBJ(circle_center, \
				GetRandomInt(0, max(CIRCLE_RADIUS_MINIMUM, \
					R2I(distance * CIRCLE_RADIUS_PERCENT))), \
				GetRandomInt(0, 360))
			// NOTE: The point selected tends towards the center, due to the
			// imperfect nature of the method I used. FIXME?

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
	}
}
