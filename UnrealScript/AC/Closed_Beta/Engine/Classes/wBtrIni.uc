class wBtrIni extends Object
    native;

var string m_IniSection;

// Export UwBtrIni::execAddStringToMap(FFrame&, void* const)
native function bool AddStringToMap(string key, string Value)
{
    //native.key;
    //native.Value;        
}

// Export UwBtrIni::execAddIntToMap(FFrame&, void* const)
native function bool AddIntToMap(string key, int Value)
{
    //native.key;
    //native.Value;        
}

// Export UwBtrIni::execAddFloatToMap(FFrame&, void* const)
native function bool AddFloatToMap(string key, float Value)
{
    //native.key;
    //native.Value;        
}

// Export UwBtrIni::execAddBoolToMap(FFrame&, void* const)
native function bool AddBoolToMap(string key, bool Value)
{
    //native.key;
    //native.Value;        
}

event RegistMap()
{
    //return;    
}

defaultproperties
{
    m_IniSection="wBtrIni"
}