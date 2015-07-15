include "cj_types.j"
include "cj_typesEx.j"
include "cj_types_priv.j"
include "cj_typesEx_priv.j"

globals
	// Constants????
	force PLAYERS = CreateForce()
	group SURVIVORS
	rect WHOLE_MAP
	timer START_TIMER
	timer END_TIMER
	timer SPAWN_TIMER
	
	// Constants
	hashtable array DINOSAURS
	location MAP_CENTER
	
	// Variables
	int DIFFICULTY
	timer ANGER_TIMER
	timer LEVEL_TIMER
	int DINO_ANGER = 0
	int DINO_LEVEL = 0
	
	real SPAWN_MAX_DIST
	real SPAWN_MIN_DIST
	
	dialog DIFFICULTY_MENU
	button array DIFFICULTY_BUTTONS
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

void Init() {
	// Create groups
	boolexpr conditions = Condition(function Player_Definition)
	ForceEnumPlayers(PLAYERS, conditions)
	DestroyBoolExpr(conditions)
	
	// Define globals
	WHOLE_MAP = bj_mapInitialPlayableArea
	MAP_CENTER = Location(GetRectCenterX(bj_mapInitialPlayableArea), GetRectCenterY(bj_mapInitialPlayableArea))
	
	// Set up the dinosaurs (player 12 - brown) to give bounty
	SetPlayerState(Player(11), PLAYER_STATE_GIVES_BOUNTY, 1)
	
	// Set up each player
	ForForce(PLAYERS, function Player_Setup)
	
	// Prepare the menu
	//geaghaeghahrh
	
	DestroyTrigger(GetTriggeringTrigger())
}

//===========================================================================
void InitTrig_Init() {
	TriggerAddAction(CreateTrigger(), function Init)
}