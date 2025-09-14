class UnrealScriptedSequence extends ScriptedSequence;

var UnrealScriptedSequence EnemyAcquisitionScript;
var Controller CurrentUser;
var UnrealScriptedSequence NextScript;
var bool bFirstScript;
var() bool bSniping;
var() bool bDontChangeScripts;
var bool bFreelance;
var() bool bRoamingScript;
var bool bAvoid;
var bool bDisabled;
var() bool bNotInVehicle;
var() byte Priority;
var() name EnemyAcquisitionScriptTag;
var() float EnemyAcquisitionScriptProbability;
var() name SnipingVolumeTag;
var() Class<wWeapon> WeaponPreference;
var float NumChecked;

function Reset()
{
    bDisabled = false;
    FreeScript();
    //return;    
}

function FreeScript()
{
    CurrentUser = none;
    //return;    
}

function bool CheckForErrors()
{
    // End:0x4B
    if(Tag == 'None')
    {
        Log(string(self) $ " has no tag - won't be assigned to any objective!");
        return true;
    }
    return super.CheckForErrors();
    //return;    
}

function BeginPlay()
{
    local UnrealScriptedSequence S, Last;
    local SnipingVolume V;

    super(Actor).BeginPlay();
    // End:0x2F
    if(EnemyAcquisitionScriptTag != 'None')
    {
        // End:0x2E
        foreach AllActors(Class'UnrealGame_Decompressed.UnrealScriptedSequence', EnemyAcquisitionScript, EnemyAcquisitionScriptTag)
        {
            // End:0x2E
            break;            
        }        
    }
    // End:0x7B
    if(Tag == 'None')
    {
        Warn(string(self) $ " has no tag - won't be assigned to any objective!");        
    }
    else
    {
        // End:0xDD
        if(bFirstScript)
        {
            Last = self;
            // End:0xDC
            foreach AllActors(Class'UnrealGame_Decompressed.UnrealScriptedSequence', S, Tag)
            {
                // End:0xDB
                if(S != self)
                {
                    Last.NextScript = S;
                    S.bFirstScript = false;
                    Last = S;
                }                
            }            
        }
    }
    // End:0x113
    if(SnipingVolumeTag != 'None')
    {
        // End:0x112
        foreach AllActors(Class'UnrealGame_Decompressed.SnipingVolume', V, SnipingVolumeTag)
        {
            V.AddDefensePoint(self);            
        }        
    }
    //return;    
}

function bool HigherPriorityThan(UnrealScriptedSequence S, Bot B)
{
    NumChecked = 1.0000000;
    // End:0x1E
    if(bAvoid)
    {
        bAvoid = false;
        return false;
    }
    // End:0x44
    if(bNotInVehicle && Vehicle(B.Pawn) != none)
    {
        return false;
    }
    // End:0xD4
    if((((CurrentUser != none) && !CurrentUser.bDeleteMe) && CurrentUser != B) && CurrentUser.SameTeamAs(B))
    {
        // End:0xD2
        if((Bot(CurrentUser) != none) && Bot(CurrentUser).GoalScript != self)
        {
            Bot(CurrentUser).GoalScript = none;            
        }
        else
        {
            return false;
        }
    }
    // End:0xFF
    if((S == none) || int(S.Priority) < int(Priority))
    {
        return true;
    }
    // End:0x11D
    if(int(S.Priority) > int(Priority))
    {
        return false;
    }
    // End:0x14D
    if((B.FavoriteWeapon != none) && B.FavoriteWeapon == WeaponPreference)
    {
        return true;
    }
    S.NumChecked += float(1);
    return FRand() < (float(1) / S.NumChecked);
    //return;    
}

defaultproperties
{
    bFirstScript=true
    bFreelance=true
    EnemyAcquisitionScriptProbability=1.0000000
    Actions=/* Array type was not detected. */
    ScriptControllerClass=Class'UnrealGame_Decompressed.Bot'
}