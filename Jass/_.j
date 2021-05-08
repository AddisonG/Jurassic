/**
 * Remember: The index expected to be typed by the player is in the range 1-7,
 * but the players actual indexes are 0-6.
 *
 * This function is shared across all sharing triggers (pshare, fshare, unshare)
 */
bool Sharing_Conditions() {
	// The index of the player to share control with.
	string message = GetEventPlayerChatString()
	int targeted_player_index = S2I(SubString(message, StringLength(message), StringLength(message)))

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
	debug BJDebugMsg("distance: " + R2S(distance))
	debug BJDebugMsg("effectiveRange: " + I2S(effectiveRange))
	debug BJDebugMsg("accuracy: " + I2S(accuracy))
	if (distance <= effectiveRange) {
		// The shot is within the effective range. Accuracy is unchanged
		return I2R(accuracy)
	}
	if (distance >= effectiveRange * 2) {
		// A shot can never be taken more than twice the effective range away
		return 0.0
	}

	// At this point effectiveRange < distance
	return Cos((distance - effectiveRange) / (effectiveRange * bj_PI / 10)) * (accuracy / 2) + (accuracy / 2)
}

bool isSurvivor(unit survivor) {
	return GetUnitTypeId(survivor) == SURVIVOR_UNIT_TYPE
}

string tostring_unit(unit x_unit) {
	string output = "UNIT: " + GetUnitName(x_unit) + ". [" + R2S(GetUnitX(x_unit)) + ", " + R2S(GetUnitY(x_unit)) + "]"
	return output
}

string tostring_item(item x_item) {
	string output = "ITEM: " + GetItemName(x_item) + ". [" + R2S(GetItemX(x_item)) + ", " + R2S(GetItemY(x_item)) + "]"
	return output
}

string tostring_location(location x_location) {
	string output = "LOCATION: [" + R2S(GetLocationX(x_location)) + ", " + R2S(GetLocationY(x_location)) + "]"
	return output
}

string tostring_spell() {
	location target_loc = GetSpellTargetLoc()
	unit target_unit = GetSpellTargetUnit()

	string output = "SPELL: " + GetAbilityName(GetSpellAbilityId()) + ". "
	if (target_unit != null) {
		output += tostring_unit(target_unit)
	} elseif (target_loc != null) {
		output += tostring_location(target_loc)
	}
	return output
}

void debug_unit(unit x) {
	debug BJDebugMsg(tostring_unit(x))
}

void debug_item(item x) {
	debug BJDebugMsg(tostring_item(x))
}

void debug_location(location x) {
	debug BJDebugMsg(tostring_location(x))
}

void debug_spell() {
	debug BJDebugMsg(tostring_spell())
}
