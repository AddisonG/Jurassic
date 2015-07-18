void Game_Start_Actions() {
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
	DIFFICULTY_MENU = null
	PauseGame(false)
	
	// Spawn and destroy a helicopter above the survivors. Pretty immersive, huh?
	location temp = Location(GetLocationX(MAP_CENTER), GetLocationY(MAP_CENTER) + 50)
	unit helicopter = CreateUnitAtLoc(Player(PLAYER_NEUTRAL_PASSIVE), 'n009', temp, 0)
	KillUnit(helicopter)
	RemoveLocation(temp)
	helicopter = null
	temp = null
	
	// Play the re-mastered Jurassic Survival intro. I made it myself!
	StartSound(gg_snd_Welcome)
	if (GetRandomInt(1, 100) <= 5) {
		// 5% chance to slow it down, for the fun of it
		SetSoundPitch(gg_snd_Welcome, 0.7)
	}
	
	SPAWN_MIN_DIST = 1000 - 150 * DIFFICULTY
	DisplayTimedTextToPlayer(GetLocalPlayer(), 0, 0, 10, "Game Difficulty: " + I2S(DIFFICULTY + 1) + "/" + I2S(difficulty_num))
	DisplayTimedTextToPlayer(GetLocalPlayer(), 0, 0, 10, "Time to Survive: " + I2S(30 + 10 * DIFFICULTY) + " minutes")
	DisplayTimedTextToPlayer(GetLocalPlayer(), 0, 0, 10, "Period of Grace: " + I2S(60 - 12 * DIFFICULTY) + " seconds")
	DisplayTimedTextToPlayer(GetLocalPlayer(), 0, 0, 10, "Min Dino Spawn Distance: " + R2S(SPAWN_MIN_DIST) + " units")
	
	// Start the timer to mark the end of the game
	TimerStart(END_TIMER, 1800 + 600 * DIFFICULTY, false, null)
	timerdialog timerdiag = CreateTimerDialog(END_TIMER)
	TimerDialogSetTitle(timerdiag, "Time until rescue")
	TimerDialogDisplay(timerdiag, true)
	timerdiag = null
	
	// Start the timer t delay dino spawning (period of grace)
	TimerStart(START_TIMER, 60 - 12 * DIFFICULTY, false, null)
	
	// Destroy this trigger
	DestroyTrigger(GetTriggeringTrigger())
}

//===========================================================================
void InitTrig_Game_Start() {
	trigger t = CreateTrigger()
	TriggerRegisterDialogEvent(t, DIFFICULTY_MENU)
	TriggerAddAction(t, function Game_Start_Actions)
}