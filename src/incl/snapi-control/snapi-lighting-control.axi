program_name='snapi-lighting-control'

#if_not_defined __SNAPI_LIGHTING_CONTROL__
#define __SNAPI_LIGHTING_CONTROL__

/*
 * --------------------
 * Lighting constants
 * --------------------
 */

define_constant

// lighting levels by percentage 
INTEGER LIGHTING_LEVEL_0_PERCENT    = 0
INTEGER LIGHTING_LEVEL_10_PERCENT   = 25
INTEGER LIGHTING_LEVEL_20_PERCENT   = 51
INTEGER LIGHTING_LEVEL_30_PERCENT   = 76
INTEGER LIGHTING_LEVEL_40_PERCENT   = 102
INTEGER LIGHTING_LEVEL_50_PERCENT   = 127
INTEGER LIGHTING_LEVEL_60_PERCENT   = 153
INTEGER LIGHTING_LEVEL_70_PERCENT   = 178
INTEGER LIGHTING_LEVEL_80_PERCENT   = 204
INTEGER LIGHTING_LEVEL_90_PERCENT   = 230
INTEGER LIGHTING_LEVEL_100_PERCENT  = 255

/*
 * --------------------
 * Lighting Functions
 * --------------------
 */

define_function snapiLightingPassThroughData (dev virtual, char strData[])
{
	sendCommand (virtual,"'PASSTHRU-',strData")
}

define_function snapiLightingSetLevel (dev virtual, char strLightAddress[], integer lightingLevel)
{
	sendCommand (virtual,"'LIGHTSYSTEMLEVEL-',strLightAddress,',',itoa(lightingLevel)")
}

define_function snapiLightingSetLevelWithFade (dev virtual, char strLightAddress[], integer lightingLevel, integer fadeRateInSeconds)
{
	sendCommand (virtual,"'LIGHTSYSTEMLEVEL-',strLightAddress,',',itoa(lightingLevel),',',itoa(fadeRateInSeconds)")
}

define_function snapiLightingToggle (dev virtual, char strLightAddress[])
{
	sendCommand (virtual,"'LIGHTSYSTEMSTATE-',strLightAddress,',TOGGLE'")
}

define_function snapiLightingOn (dev virtual, char strLightAddress[])
{
	sendCommand (virtual,"'LIGHTSYSTEMSTATE-',strLightAddress,',ON'")
}

define_function snapiLightingOff (dev virtual, char strLightAddress[])
{
	sendCommand (virtual,"'LIGHTSYSTEMSTATE-',strLightAddress,',OFF'")
}

define_function snapiLightingEnableRampUp (dev virtual, char strLightAddress[])
{
	sendCommand (virtual, "'LIGHTSYSTEMRAMP-',strLightAddress,',UP'")
}

define_function snapiLightingEnableRampDown (dev virtual, char strLightAddress[])
{
	sendCommand (virtual, "'LIGHTSYSTEMRAMP-',strLightAddress,',DOWN'")
}

define_function snapiLightingDisableRamp (dev virtual, char strLightAddress[])
{
	sendCommand (virtual, "'LIGHTSYSTEMRAMP-',strLightAddress,',STOP'")
}


#end_if
