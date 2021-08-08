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

bool proximity_check(location first, location second, real threshold) {
	// Returns true if the locations are within threshold of each other
	real x_diff_sqrd = Pow(GetLocationX(first) - GetLocationX(second), 2)
	real y_diff_sqrd = Pow(GetLocationY(first) - GetLocationY(second), 2)
	return SquareRoot(x_diff_sqrd + y_diff_sqrd) <= threshold
}

bool proximity_check_units(unit first, unit second, real threshold) {
	// Returns true if the units are within threshold of each other
	location first_loc = GetUnitLoc(first)
	location second_loc = GetUnitLoc(second)
	real x_diff_sqrd = Pow(GetLocationX(first_loc) - GetLocationX(second_loc), 2)
	real y_diff_sqrd = Pow(GetLocationY(first_loc) - GetLocationY(second_loc), 2)
	RemoveLocation(first_loc)
	RemoveLocation(second_loc)
	return SquareRoot(x_diff_sqrd + y_diff_sqrd) <= threshold
}

bool isSurvivor(unit x) {
	return GetUnitTypeId(x) == SURVIVOR_UNIT_TYPE
}

string tostring_unit(unit x) {
	string output = "UNIT: '" + GetUnitName(x) + "'. [" + I2S(R2I(GetUnitX(x))) + ", " + I2S(R2I(GetUnitY(x))) + "]"
	return output
}

string tostring_item(item x) {
	string output = "ITEM: '" + GetItemName(x) + "'. [" + I2S(R2I(GetItemX(x))) + ", " + I2S(R2I(GetItemY(x))) + "]"
	return output
}

string tostring_location(location x) {
	string output = "LOCATION: [" + I2S(R2I(GetLocationX(x))) + ", " + I2S(R2I(GetLocationY(x))) + "]"
	return output
}

string tostring_spell() {
	location target_loc = GetSpellTargetLoc()
	unit target_unit = GetSpellTargetUnit()

	string output = "SPELL: '" + GetAbilityName(GetSpellAbilityId()) + "'. "
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
