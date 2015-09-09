include "cj_types.j"
include "cj_typesEx.j"
include "cj_types_priv.j"
include "cj_typesEx_priv.j"

globals
	force PLAYERS = CreateForce()
	group SURVIVORS = CreateGroup()
	group array DINOSAUR_GROUPS
	rect WHOLE_MAP
	timer START_TIMER = CreateTimer()
	timer END_TIMER = CreateTimer()
	trigger SPAWN_TRIGGER
	trigger MOVE_TRIGGER
	
	hashtable array DINO_TABLE[10]
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
	
	constant int SURVIVOR_UNIT_TYPE = 'h000'
	
	// Damage types
	constant attacktype AMMUNITION = ATTACK_TYPE_HERO
	constant attacktype SPIT       = ATTACK_TYPE_MAGIC
	constant attacktype FIRE       = ATTACK_TYPE_SIEGE
	constant attacktype BITE       = ATTACK_TYPE_CHAOS
	constant attacktype CLAW       = ATTACK_TYPE_MELEE
	constant attacktype ELECTRIC   = ATTACK_TYPE_PIERCE
	constant attacktype BLUNT      = ATTACK_TYPE_NORMAL
endglobals

bool Player_Definition() {
	// Player is both a user, and is playing (No idea if this is how you're meant to do it)
	return (GetPlayerController(GetFilterPlayer()) == MAP_CONTROL_USER) && \
		(GetPlayerSlotState(GetFilterPlayer()) == PLAYER_SLOT_STATE_PLAYING)
}

void Player_Setup() {
	location spawnpoint = PolarProjectionBJ(MAP_CENTER, GetRandomInt(0, 300), GetRandomInt(0, 360))
	
	// Spawn a survivor for the player
	unit survivor = CreateUnitAtLoc(GetEnumPlayer(), SURVIVOR_UNIT_TYPE, spawnpoint, GetRandomInt(0, 360))
	RemoveLocation(spawnpoint)
	spawnpoint = null
	
	// Add them to the SURVIVORS group, and select them for the player
	GroupAddUnit(SURVIVORS, survivor)
	if (GetLocalPlayer() == GetEnumPlayer()) {
		// Select the unit for the player who owns it
		ClearSelection()
		SelectUnit(survivor, true)
	}
	survivor = null
	
	// Create a group for storing the dinosaurs assigned to this player
	DINOSAUR_GROUPS[GetPlayerId(GetEnumPlayer())] = CreateGroup()
	
	// Set the player's resources
	SetPlayerState(GetEnumPlayer(), PLAYER_STATE_GOLD_GATHERED, 1000)
	SetPlayerState(GetEnumPlayer(), PLAYER_STATE_LUMBER_GATHERED, 1000)
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