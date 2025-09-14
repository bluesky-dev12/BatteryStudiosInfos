/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path UT2k4Assault\Classes\Message_PowerCore.uc
 * Package Imports:
 *	UT2k4Assault
 *	Engine
 *	Core
 *
 * Stats:
 *	Functions:2
 *
 *******************************************************************************/
class Message_PowerCore extends LocalMessage
    hidecategories(Movement,Collision,Lighting,LightColor,Karma,Force);

static function string GetString(optional int Switch, optional PlayerReplicationInfo RelatedPRI_1, optional PlayerReplicationInfo RelatedPRI_2, optional Object OptionalObject)
{
    local ASOBJ_EnergyCore_Spawn EC;

    EC = ASOBJ_EnergyCore_Spawn(OptionalObject);
    // End:0xaa
    if(EC == none)
    {
        switch(Switch)
        {
            // End:0x45
            case 0:
                return RelatedPRI_1.PlayerName $ class'GameObject_EnergyCore'.default.PlayerDroppedMessage;
            // End:0x58
            case 1:
                return class'GameObject_EnergyCore'.default.DroppedMessage;
            // End:0x6c
            case 2:
                return class'GameObject_EnergyCore'.default.EnergyCorePickedUp;
            // End:0x90
            case 3:
                return RelatedPRI_1.PlayerName $ class'GameObject_EnergyCore'.default.PlayerPickedUpEnergyCore;
            // End:0xa4
            case 4:
                return class'GameObject_EnergyCore'.default.PlayerCoreReset;
            // End:0xffff
            default:
                // End:0x136 Break;
                break;
            }
    }
    switch(Switch)
    {
        // End:0xd4
        case 0:
            return RelatedPRI_1.PlayerName $ EC.PlayerDroppedMessage;
        // End:0xe7
        case 1:
            return EC.DroppedMessage;
        // End:0xfb
        case 2:
            return EC.EnergyCorePickedUp;
        // End:0x11f
        case 3:
            return RelatedPRI_1.PlayerName $ EC.PlayerPickedUpEnergyCore;
        // End:0x133
        case 4:
            return EC.PlayerCoreReset;
        // End:0xffff
        default:
}

static simulated function ClientReceive(PlayerController P, optional int Switch, optional PlayerReplicationInfo RelatedPRI_1, optional PlayerReplicationInfo RelatedPRI_2, optional Object OptionalObject)
{
    local ASOBJ_EnergyCore_Spawn EC;

    super.ClientReceive(P, Switch, RelatedPRI_1, RelatedPRI_2, OptionalObject);
    EC = ASOBJ_EnergyCore_Spawn(OptionalObject);
    // End:0xc4
    if(EC == none)
    {
        switch(Switch)
        {
            // End:0x45
            case 0:
            // End:0x6b
            case 1:
                P.QueueAnnouncement(class'GameObject_EnergyCore'.default.Announcer_EnergyCore_Dropped, 1);
                // End:0xc1
                break;
            // End:0x70
            case 2:
            // End:0x97
            case 3:
                P.QueueAnnouncement(class'GameObject_EnergyCore'.default.Announcer_EnergyCore_PickedUp, 1);
                // End:0xc1
                break;
            // End:0xbe
            case 4:
                P.QueueAnnouncement(class'GameObject_EnergyCore'.default.Announcer_EnergyCore_Reset, 1);
                // End:0xc1
                break;
            // End:0xffff
            default:
                // End:0x14b Break;
                break;
            }
    }
    switch(Switch)
    {
        // End:0xcf
        case 0:
        // End:0xf5
        case 1:
            P.QueueAnnouncement(EC.Announcer_EnergyCore_Dropped, 1);
            // End:0x14b
            break;
        // End:0xfa
        case 2:
        // End:0x121
        case 3:
            P.QueueAnnouncement(EC.Announcer_EnergyCore_PickedUp, 1);
            // End:0x14b
            break;
        // End:0x148
        case 4:
            P.QueueAnnouncement(EC.Announcer_EnergyCore_Reset, 1);
            // End:0x14b
            break;
        // End:0xffff
        default:
}

defaultproperties
{
    bIsConsoleMessage=true
    bFadeMessage=true
    DrawColor=(R=255,G=0,B=0,A=255)
    StackMode=2
    PosY=0.2420
    FontSize=1
}