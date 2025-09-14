/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path UnrealGame\Classes\UnrealScriptedSequence.uc
 * Package Imports:
 *	UnrealGame
 *	Gameplay
 *	Engine
 *	Core
 *
 * Stats:
 *	Properties:17
 *	Functions:5
 *
 *******************************************************************************/
class UnrealScriptedSequence extends ScriptedSequence
    dependson(SnipingVolume);

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
var() class<wWeapon> WeaponPreference;
var float NumChecked;

function Reset()
{
    bDisabled = false;
    FreeScript();
}

function FreeScript()
{
    CurrentUser = none;
}

function bool CheckForErrors()
{
    // End:0x4b
    if(Tag == 'None')
    {
        Log(string(self) $ " has no tag - won't be assigned to any objective!");
        return true;
    }
    return super.CheckForErrors();
}

function BeginPlay()
{
    local UnrealScriptedSequence S, Last;
    local SnipingVolume V;

    super(Actor).BeginPlay();
    // End:0x2f
    if(EnemyAcquisitionScriptTag != 'None')
    {
        // End:0x2e
        foreach AllActors(class'UnrealScriptedSequence', EnemyAcquisitionScript, EnemyAcquisitionScriptTag)
        {
            // End:0x2e
            break;                        
        }
    }
    // End:0x7b
    if(Tag == 'None')
    {
        Warn(string(self) $ " has no tag - won't be assigned to any objective!");
    }
    // End:0xdd
    else
    {
        // End:0xdd
        if(bFirstScript)
        {
            Last = self;
            // End:0xdc
            foreach AllActors(class'UnrealScriptedSequence', S, Tag)
            {
                // End:0xdb
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
        foreach AllActors(class'SnipingVolume', V, SnipingVolumeTag)
        {
            V.AddDefensePoint(self);                        
        }
    }
}

function bool HigherPriorityThan(UnrealScriptedSequence S, Bot B)
{
    NumChecked = 1.0;
    // End:0x1e
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
    // End:0xd4
    if(CurrentUser != none && !CurrentUser.bDeleteMe && CurrentUser != B && CurrentUser.SameTeamAs(B))
    {
        // End:0xd2
        if(Bot(CurrentUser) != none && Bot(CurrentUser).GoalScript != self)
        {
            Bot(CurrentUser).GoalScript = none;
        }
        // End:0xd4
        else
        {
            return false;
        }
    }
    // End:0xff
    if(S == none || S.Priority < Priority)
    {
        return true;
    }
    // End:0x11d
    if(S.Priority > Priority)
    {
        return false;
    }
    // End:0x14d
    if(B.FavoriteWeapon != none && B.FavoriteWeapon == WeaponPreference)
    {
        return true;
    }
    S.NumChecked += float(1);
    return FRand() < float(1) / S.NumChecked;
}

defaultproperties
{
    bFirstScript=true
    bFreelance=true
    EnemyAcquisitionScriptProbability=1.0
    Actions=// Object reference not set to an instance of an object.
    
    ScriptControllerClass=class'Bot'
}