/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path Engine\Classes\wBtrIni.uc
 * Package Imports:
 *	Engine
 *	Core
 *
 * Stats:
 *	Properties:1
 *	Functions:5
 *
 *******************************************************************************/
class wBtrIni extends Object
    native;

var string m_IniSection;

// Export UwBtrIni::execAddStringToMap(FFrame&, void* const)
native function bool AddStringToMap(string key, string Value);
// Export UwBtrIni::execAddIntToMap(FFrame&, void* const)
native function bool AddIntToMap(string key, int Value);
// Export UwBtrIni::execAddFloatToMap(FFrame&, void* const)
native function bool AddFloatToMap(string key, float Value);
// Export UwBtrIni::execAddBoolToMap(FFrame&, void* const)
native function bool AddBoolToMap(string key, bool Value);
event RegistMap();

defaultproperties
{
    m_IniSection="wBtrIni"
}