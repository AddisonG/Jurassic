void Difficulty_Actions() {
	int difficulty_num = 4 // Number of choices available
	int i = 0
	while (i <= difficulty_num) {
		if (GetClickedButton() == DIFFICULTY_BUTTONS[i]) {
			DIFFICULTY = i
			DIFFICULTY_BUTTONS[i] = null
		}
		i++
	}

	DialogDestroy(DIFFICULTY_MENU)
	PauseGame(false)

	// Spawn and destroy a helicopter above the survivors. Pretty immersive, huh?
	location temp = Location(GetLocationX(MAP_CENTER), GetLocationY(MAP_CENTER) + 50)
	unit helicopter = CreateUnitAtLoc(Player(PLAYER_NEUTRAL_PASSIVE), 'cbra', temp, 0)
	KillUnit(helicopter)
	RemoveLocation(temp)

	// Play the re-mastered Jurassic Survival intro. I made it myself!
	StartSound(gg_snd_Welcome)
	if (GetRandomInt(1, 100) <= 5) {
		// 5% chance to slow it down, for the fun of it
		SetSoundPitch(gg_snd_Welcome, 0.7)
	}

	SPAWN_MIN_DIST = 1000 - 150 * DIFFICULTY
	DisplayTimedTextToPlayer(GetLocalPlayer(), 0, 0, 10, "Game Difficulty: " + I2S(DIFFICULTY + 1) + "/" + I2S(difficulty_num))
	DisplayTimedTextToPlayer(GetLocalPlayer(), 0, 0, 10, "Time to Survive: " + I2S(30 + 10 * DIFFICULTY) + " minutes")
	DisplayTimedTextToPlayer(GetLocalPlayer(), 0, 0, 10, "Period of Grace: " + I2S(120 - 12 * DIFFICULTY) + " seconds")
	DisplayTimedTextToPlayer(GetLocalPlayer(), 0, 0, 10, "Min Dino Spawn Distance: " + R2S(SPAWN_MIN_DIST) + " units")

	// Start the timer to delay dino spawning (period of grace)
	TimerStart(GRACE_TIMER, 120 - 12 * DIFFICULTY, false, null)
	TIMER_DISPLAY = CreateTimerDialog(GRACE_TIMER)
	TimerDialogSetTitle(TIMER_DISPLAY, "Grace period")
	TimerDialogDisplay(TIMER_DISPLAY, true)

	// Destroy this trigger
	DestroyTrigger(GetTriggeringTrigger())
}

//===========================================================================
void InitTrig_Difficulty() {
	trigger t = CreateTrigger()
	TriggerRegisterDialogEvent(t, DIFFICULTY_MENU)
	TriggerAddAction(t, function Difficulty_Actions)
}
