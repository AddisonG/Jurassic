/**
 * Remember: The index expected to be typed by the player is in the range 1-7,
 * but the players actual indexes are 0-6.
 * 
 * This function is shared across all sharing triggers (pshare, fshare, unshare)
 */
boolean Sharing_Conditions() {
	// The index of the player to share control with.
	string message = GetEventPlayerChatString()
	integer targeted_player_index = S2I(SubString(message, StringLength(message), StringLength(message)))
	
	// Ensure that string entered is <= 10 characters. (longest is "-unshare 1")
	if (StringLength(GetEventPlayerChatString()) <= 10) {
		return false
	}
	
	// Can't share control with yourself.
	if (targeted_player_index + 1 == GetPlayerId(GetTriggerPlayer())) {
		return false
	}
	
	// Ensure that control is being shared with a valid player (in range 1-7).
	if (targeted_player_index < 1 || targeted_player_index > 7) {
		return false
	}
	
	return true
}

real Hit_Chance(real distance, int effectiveRange, int accuracy) {
	if (distance <= effectiveRange) {
		// The shot is within the effective range. Accuracy is unchanged
		return accuracy
	}
	if (distance >= effectiveRange * 2) {
		// A shot can never be taken more than twice the effective range away
		return 0
	}
	
	return Cos((distance - effectiveRange) / (effectiveRange * bj_PI / 10)) * (accuracy / 2) + (accuracy / 2)
}