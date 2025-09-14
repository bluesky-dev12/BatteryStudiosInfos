class ACTION_ASOpenSentinel extends ScriptedAction
    editinlinenew
    collapsecategories
    hidecategories(Object);

var(Action) name SentinelTag;

function bool InitActionFor(ScriptedController C)
{
    local ASVehicle_Sentinel Sentinel;

    // End:0x3E
    if(SentinelTag != 'None')
    {
        // End:0x3D
        foreach C.DynamicActors(Class'UT2k4Assault_Decompressed.ASVehicle_Sentinel', Sentinel, SentinelTag)
        {
            Sentinel.AwakeSentinel();            
        }        
    }
    return false;
    //return;    
}

function string GetActionString()
{
    return ActionString @ string(SentinelTag);
    //return;    
}

defaultproperties
{
    ActionString="???? ???"
}