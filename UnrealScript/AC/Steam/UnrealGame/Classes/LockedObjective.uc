/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path UnrealGame\Classes\LockedObjective.uc
 * Package Imports:
 *	UnrealGame
 *	Engine
 *	Core
 *
 * Stats:
 *	Properties:2
 *	Functions:3
 *
 *******************************************************************************/
class LockedObjective extends ProximityObjective
    hidecategories(Lighting,LightColor,Karma,Force);

var() name KeyTag;
var KeyPickup MyKey;

function FindKey()
{
    // End:0x23
    if(MyKey != none && !MyKey.bDeleteMe)
    {
        return;
    }
    MyKey = none;
    // End:0x43
    foreach AllActors(class'KeyPickup', MyKey, KeyTag)
    {
        // End:0x43
        break;                
    }
}

function bool TellBotHowToDisable(Bot B)
{
    local KeyInventory k;
    local Controller C;

    k = KeyInventory(B.Pawn.FindInventoryType(class'KeyInventory'));
    // End:0x59
    if(k != none && k.Tag == KeyTag)
    {
        return super.TellBotHowToDisable(B);
    }
    C = Level.ControllerList;
    J0x6d:
    // End:0x15f [While If]
    if(C != none)
    {
        // End:0x148
        if(C.PlayerReplicationInfo != none && C.Pawn != none && C.PlayerReplicationInfo.Team == B.PlayerReplicationInfo.Team)
        {
            k = KeyInventory(C.Pawn.FindInventoryType(class'KeyInventory'));
            // End:0x148
            if(k != none && k.Tag == KeyTag)
            {
                B.Squad.TellBotToFollow(B, C);
                return true;
            }
        }
        C = C.nextController;
        // This is an implied JumpToken; Continue!
        goto J0x6d;
    }
    FindKey();
    // End:0x172
    if(MyKey == none)
    {
        return false;
    }
    // End:0x1cf
    if(B.actorReachable(MyKey))
    {
        B.GoalString = "almost at " $ string(MyKey);
        B.MoveTarget = MyKey;
        B.SetAttractionState();
        return true;
    }
    B.GoalString = "No path to key " $ string(MyKey);
    // End:0x215
    if(!B.FindBestPathToward(MyKey, false, true))
    {
        return false;
    }
    B.GoalString = "Follow path to " $ string(MyKey);
    B.SetAttractionState();
    return true;
}

function bool IsRelevant(Pawn Instigator, bool bAliveCheck)
{
    local KeyInventory k;

    // End:0x5f
    if(Instigator != none)
    {
        k = KeyInventory(Instigator.FindInventoryType(class'KeyInventory'));
        // End:0x5f
        if(k != none && k.Tag == KeyTag)
        {
            k.UnLock(self);
        }
    }
    return false;
}

defaultproperties
{
    KeyTag=KeyPickup
}