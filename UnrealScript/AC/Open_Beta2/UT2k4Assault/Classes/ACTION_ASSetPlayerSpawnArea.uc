class ACTION_ASSetPlayerSpawnArea extends ScriptedAction
    editinlinenew
    collapsecategories
    hidecategories(Object);

var(Action) name PlayerSpawnManagerTag;
var(Action) bool bEnabled;
var array<PlayerSpawnManager> PSMs;

event PostBeginPlay(ScriptedSequence ss)
{
    local PlayerSpawnManager PSM;

    super.PostBeginPlay(ss);
    // End:0x4C
    if(PlayerSpawnManagerTag != 'None')
    {
        // End:0x4B
        foreach ss.AllActors(Class'UT2k4Assault_Decompressed.PlayerSpawnManager', PSM, PlayerSpawnManagerTag)
        {
            PSMs[PSMs.Length] = PSM;            
        }        
    }
    //return;    
}

function bool InitActionFor(ScriptedController C)
{
    local int i;

    i = 0;
    J0x07:

    // End:0x3C [Loop If]
    if(i < PSMs.Length)
    {
        PSMs[i].SetEnabled(bEnabled);
        i++;
        // [Loop Continue]
        goto J0x07;
    }
    return false;
    //return;    
}

function string GetActionString()
{
    return ((ActionString @ string(PlayerSpawnManagerTag)) @ "bEnabled") @ string(bEnabled);
    //return;    
}

defaultproperties
{
    ActionString="??_???????? ?? "
}