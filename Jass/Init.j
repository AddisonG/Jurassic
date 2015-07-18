include "cj_types.j"
include "cj_typesEx.j"
include "cj_types_priv.j"
include "cj_typesEx_priv.j"

globals
	force PLAYERS = CreateForce()
	group SURVIVORS = CreateGroup()
	rect WHOLE_MAP
	timer START_TIMER = CreateTimer()
	timer END_TIMER = CreateTimer()
	timer SPAWN_TIMER = CreateTimer()
	
	hashtable array DINOSAURS
	location MAP_CENTER
	
	int DIFFICULTY
	timer ANGER_TIMER = CreateTimer()
	timer LEVEL_TIMER = CreateTimer()
	int DINO_ANGER
	int DINO_LEVEL
	
	real SPAWN_MAX_DIST
	real SPAWN_MIN_DIST
	
	dialog DIFFICULTY_MENU = DialogCreate()
	button array DIFFICULTY_BUTTONS
	
	hashtable FOGMODS = InitHashtable()
endglobals

bool Player_Definition() {
	// Player is both a user, and is playing (No idea if this is how you're meant to do it)
	return (GetPlayerController(GetFilterPlayer()) == MAP_CONTROL_USER) && \
		(GetPlayerSlotState(GetFilterPlayer()) == PLAYER_SLOT_STATE_PLAYING)
}

void Player_Setup() {
	location spawnpoint = PolarProjectionBJ(MAP_CENTER, GetRandomReal(0, 300), GetRandomReal(0, 360))
	
	// Spawn a survivor for the player
	CreateUnitAtLoc(GetEnumPlayer(), 'h000', spawnpoint, GetRandomReal(0, 360))
	GroupAddUnit(SURVIVORS, bj_lastCreatedUnit)
	
	if (GetLocalPlayer() == GetEnumPlayer()) {
		// Select the unit for the player who owns it
		ClearSelection()
		SelectUnit(bj_lastCreatedUnit, true)
	}
	
	// Set the player's resources
	SetPlayerStateBJ(GetEnumPlayer(), PLAYER_STATE_RESOURCE_GOLD, 1000)
	SetPlayerStateBJ(GetEnumPlayer(), PLAYER_STATE_RESOURCE_LUMBER, 1000)
	RemoveLocation(spawnpoint)
}

void Init_Actions() {
	StopMusic(false)
	PauseGame(true)
	
	// Create groups
	boolexpr conditions = Condition(function Player_Definition)
	ForceEnumPlayers(PLAYERS, conditions)
	DestroyBoolExpr(conditions)
	conditions = null
	
	// Define globals
	WHOLE_MAP = bj_mapInitialPlayableArea
	MAP_CENTER = Location(GetRectCenterX(WHOLE_MAP), GetRectCenterY(WHOLE_MAP))
	
	// Set up the dinosaurs (player 12 - brown) to give bounty
	SetPlayerState(Player(11), PLAYER_STATE_GIVES_BOUNTY, 1)
	
	// Set up each player
	ForForce(PLAYERS, function Player_Setup)
	
	// Only display for 1 second, since the game is paused
	DisplayTimedTextToPlayer(GetLocalPlayer(), 0, 0, 1, "Red is deciding on difficulty...")
	
	// Display difficulty menu to first player
	DialogSetMessage(DIFFICULTY_MENU, "- |c00ff0000Select Difficulty|r -")
	DIFFICULTY_BUTTONS[0] = DialogAddButton(DIFFICULTY_MENU, "|c0066ff33EASY|r", 0)
	DIFFICULTY_BUTTONS[1] = DialogAddButton(DIFFICULTY_MENU, "|c00ffff00MEDIUM|r", 0)
	DIFFICULTY_BUTTONS[2] = DialogAddButton(DIFFICULTY_MENU, "|c00ff9900HARD|r", 0)
	DIFFICULTY_BUTTONS[3] = DialogAddButton(DIFFICULTY_MENU, "|c00ff0000JURASSIC|r", 0)
	DialogDisplay(Player(0), DIFFICULTY_MENU, true)
	
	DestroyTrigger(GetTriggeringTrigger())
}

//===========================================================================
void InitTrig_Init() {
	trigger t = CreateTrigger()
	TriggerAddAction(t, function Init_Actions)
	TriggerRegisterTimerEvent(t, 0, false)
}