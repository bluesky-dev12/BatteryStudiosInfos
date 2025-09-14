/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path WMission\Classes\wMSMutator.uc
 * Package Imports:
 *	WMission
 *	UnrealGame
 *	Engine
 *	Core
 *
 * Stats:
 *	Functions:1
 *
 *******************************************************************************/
class wMSMutator extends DMMutator
    hidecategories(Movement,Collision,Lighting,LightColor,Karma,Force)
    config()
    hidedropdown;

function bool IsRelevant(Actor Other, out byte bSuperRelevant)
{
    // End:0x1e
    if(Other.IsA('AdrenalinePickup'))
    {
        bSuperRelevant = 0;
        return false;
    }
    // End:0x6f
    if(Controller(Other) != none && MessagingSpectator(Other) == none)
    {
        Controller(Other).bAdrenalineEnabled = false;
        Controller(Other).PlayerReplicationInfoClass = class'wMSPlayerReplicationInfo';
    }
    return super(Mutator).IsRelevant(Other, bSuperRelevant);
}
