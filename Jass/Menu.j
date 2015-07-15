void Menu_Actions() {
	StopMusic(false)
	DialogSetMessage(DIFFICULTY_MENU, "- |c00ff0000Select Difficulty|r -")
	DIFFICULTY_BUTTONS[0] = DialogAddButton(DIFFICULTY_MENU, "|c0066ff33EASY|r", 0)
	DIFFICULTY_BUTTONS[1] = DialogAddButton(DIFFICULTY_MENU, "|c00ffff00MEDIUM|r", 0)
	DIFFICULTY_BUTTONS[2] = DialogAddButton(DIFFICULTY_MENU, "|c00ff9900HARD|r", 0)
	DIFFICULTY_BUTTONS[3] = DialogAddButton(DIFFICULTY_MENU, "|c00ff0000JURASSIC|r", 0)
	
	DialogDisplay(Player(0), DIFFICULTY_MENU, true)
	// Only display for 1 second, since the game is paused
	DisplayTimedTextToPlayer(GetLocalPlayer(), 0, 0, 1, "Red is deciding on difficulty...")
	PauseGame(true)
	DestroyTrigger(GetTriggeringTrigger())
}

//===========================================================================
void InitTrig_Menu() {
	trigger t = CreateTrigger()
	TriggerRegisterTimerEvent(t, 0, false)
	TriggerAddAction(t, function Menu_Actions)
}