//==============================================================================
//  TEXT TAG - Floating text system by Cohadar - v5.0
//==============================================================================
//
//  PURPOSE:
//	 * Displaying floating text - the easy way
//	 * Has a set of useful and commonly needed texttag functions
//  
//  CREDITS:
//	 * DioD - for extracting proper color, fadepoint and lifespan parameters
//	 for default warcraft texttags (from miscdata.txt)
//
//  HOW TO IMPORT:
//	 * Just create a trigger named TextTag
//	 convert it to text and replace the whole trigger text with this one
//==============================================================================

library TextTag

globals 
	// for custom centered texttags
	constant real MEAN_CHAR_WIDTH = 5.5
	constant real MAX_TEXT_SHIFT = 200
	constant real DEFAULT_HEIGHT = 16
	
	// for default texttags
	constant real   SIGN_SHIFT = 16
	constant real   FONT_SIZE = 0.024
	constant string MISS = "miss"
endglobals

//===========================================================================
//   Custom centered texttag on (x,y) position
//   color is in default wc3 format, for example "|cFFFFCC00"
//===========================================================================
public function XY takes real x, real y, string text, string color returns nothing
	local texttag tt = CreateTextTag()
	local real shift = RMinBJ(StringLength(text)*MEAN_CHAR_WIDTH, MAX_TEXT_SHIFT)
	call SetTextTagText(tt, color+text, FONT_SIZE)
	call SetTextTagPos(tt, x-shift, y, DEFAULT_HEIGHT)
	call SetTextTagVelocity(tt, 0, 0.04)
	call SetTextTagVisibility(tt, true)
	call SetTextTagFadepoint(tt, 2.5)
	call SetTextTagLifespan(tt, 4)
	call SetTextTagPermanent(tt, false)
	set tt = null
endfunction

//===========================================================================
//   Custom centered texttag above unit
//===========================================================================
public function Unit takes unit whichUnit, string text, string color returns nothing
	local texttag tt = CreateTextTag()
	local real shift = RMinBJ(StringLength(text)*MEAN_CHAR_WIDTH, MAX_TEXT_SHIFT)
	call SetTextTagText(tt, color+text, FONT_SIZE)
	call SetTextTagPos(tt, GetUnitX(whichUnit)-shift, GetUnitY(whichUnit), DEFAULT_HEIGHT)
	call SetTextTagVelocity(tt, 0, 0.04)
	call SetTextTagVisibility(tt, true)
	call SetTextTagFadepoint(tt, 2.5)
	call SetTextTagLifespan(tt, 4)
	call SetTextTagPermanent(tt, false)
	set tt = null
endfunction
public function UnitColor takes unit whichUnit, string text, integer red, integer green, integer blue returns nothing
	local texttag tt = CreateTextTag()
	local real shift = RMinBJ(StringLength(text)*MEAN_CHAR_WIDTH, MAX_TEXT_SHIFT)
	call SetTextTagText(tt, text, FONT_SIZE)
	call SetTextTagColor(tt, red, green, blue, 255)
	call SetTextTagPos(tt, GetUnitX(whichUnit)-shift, GetUnitY(whichUnit), DEFAULT_HEIGHT)
	call SetTextTagVelocity(tt, 0, 0.04)
	call SetTextTagVisibility(tt, true)
	call SetTextTagFadepoint(tt, 2.5)
	call SetTextTagLifespan(tt, 4)
	call SetTextTagPermanent(tt, false)
	set tt = null
endfunction

//===========================================================================
//  Standard wc3 gold bounty texttag, displayed only to killing player 
//===========================================================================
public function GoldBounty takes unit whichUnit, integer bounty, player killer returns nothing
	local texttag tt = CreateTextTag()
	local string text = "+" + I2S(bounty)
	call SetTextTagText(tt, text, FONT_SIZE)
	call SetTextTagPos(tt, GetUnitX(whichUnit)-SIGN_SHIFT, GetUnitY(whichUnit), 0)
	call SetTextTagColor(tt, 255, 220, 0, 255)
	call SetTextTagVelocity(tt, 0, 0.03)
	call SetTextTagVisibility(tt, GetLocalPlayer()==killer)
	call SetTextTagFadepoint(tt, 2)
	call SetTextTagLifespan(tt, 3)
	call SetTextTagPermanent(tt, false)
	set text = null
	set tt = null
endfunction

//===========================================================================
//  Standard wc3 wood bounty texttag, displayed only to killing player 
//==============================================================================
public function LumberBounty takes unit whichUnit, integer bounty, player killer returns nothing
	local texttag tt = CreateTextTag()
	local string text = "+" + I2S(bounty)
	call SetTextTagText(tt, text, FONT_SIZE)
	call SetTextTagPos(tt, GetUnitX(whichUnit)-SIGN_SHIFT, GetUnitY(whichUnit), 0)
	call SetTextTagColor(tt, 0, 200, 80, 255)
	call SetTextTagVelocity(tt, 0, 0.03)
	call SetTextTagVisibility(tt, GetLocalPlayer()==killer)
	call SetTextTagFadepoint(tt, 2)
	call SetTextTagLifespan(tt, 3)
	call SetTextTagPermanent(tt, false)
	set text = null
	set tt = null
endfunction

//===========================================================================
public function Miss takes unit whichUnit returns nothing
	local texttag tt = CreateTextTag()
	call SetTextTagText(tt, MISS, FONT_SIZE)
	call SetTextTagPos(tt, GetUnitX(whichUnit), GetUnitY(whichUnit), 0)
	call SetTextTagColor(tt, 255, 0, 0, 255)
	call SetTextTagVelocity(tt, 0, 0.03)
	call SetTextTagVisibility(tt, true)
	call SetTextTagFadepoint(tt, 1)
	call SetTextTagLifespan(tt, 3)
	call SetTextTagPermanent(tt, false)
	set tt = null
endfunction

//===========================================================================
public function Firearm takes unit whichUnit, integer hitChance returns nothing
	local texttag tt = CreateTextTag()
	local string text = I2S(hitChance) + "%"
		
	if (hitChance > 80) {
		call SetTextTagColor(tt, 0, 255, 0, 255)
	} elseif (hitChance > 60) {
		call SetTextTagColor(tt, 210, 255, 0, 255)
	} elseif (hitChance > 40) {
		call SetTextTagColor(tt, 255, 240, 0, 255)
	} elseif (hitChance > 20) {
		call SetTextTagColor(tt, 255, 180, 0, 255)
	} else {
		call SetTextTagColor(tt, 255, 0, 0, 255)
	}
	
	call SetTextTagText(tt, text, FONT_SIZE)
	call SetTextTagPos(tt, GetUnitX(whichUnit), GetUnitY(whichUnit), 0)
	call SetTextTagVelocity(tt, 0, 0)
	call SetTextTagVisibility(tt, GetLocalPlayer()==whichUnit)
	call SetTextTagFadepoint(tt, 0.3)
	call SetTextTagLifespan(tt, 0.5)
	call SetTextTagPermanent(tt, false)
	set text = null
	set tt = null
endfunction

endlibrary