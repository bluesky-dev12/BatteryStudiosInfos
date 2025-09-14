class Message_PowerCore extends LocalMessage
    hidecategories(Movement,Collision,Lighting,LightColor,Karma,Force);

static function string GetString(optional int Switch, optional PlayerReplicationInfo RelatedPRI_1, optional PlayerReplicationInfo RelatedPRI_2, optional Object OptionalObject)
{
    local ASOBJ_EnergyCore_Spawn EC;

    EC = ASOBJ_EnergyCore_Spawn(OptionalObject);
    // End:0xAA
    if(EC == none)
    {
        switch(Switch)
        {
            // End:0x45
            case 0:
                return RelatedPRI_1.PlayerName $ Class'UT2k4Assault_Decompressed.GameObject_EnergyCore'.default.PlayerDroppedMessage;
            // End:0x58
            case 1:
                return Class'UT2k4Assault_Decompressed.GameObject_EnergyCore'.default.DroppedMessage;
            // End:0x6C
            case 2:
                return Class'UT2k4Assault_Decompressed.GameObject_EnergyCore'.default.EnergyCorePickedUp;
            // End:0x90
            case 3:
                return RelatedPRI_1.PlayerName $ Class'UT2k4Assault_Decompressed.GameObject_EnergyCore'.default.PlayerPickedUpEnergyCore;
            // End:0xA4
            case 4:
                return Class'UT2k4Assault_Decompressed.GameObject_EnergyCore'.default.PlayerCoreReset;
            // End:0xFFFF
            default:
                // End:0x136
                break;
                break;
        }
    }
    switch(Switch)
    {
        // End:0xD4
        case 0:
            return RelatedPRI_1.PlayerName $ EC.PlayerDroppedMessage;
        // End:0xE7
        case 1:
            return EC.DroppedMessage;
        // End:0xFB
        case 2:
            return EC.EnergyCorePickedUp;
        // End:0x11F
        case 3:
            return RelatedPRI_1.PlayerName $ EC.PlayerPickedUpEnergyCore;
        // End:0x133
        case 4:
            return EC.PlayerCoreReset;
        // End:0xFFFF
        default:
            //return;
            break;
    }    
}

static simulated function ClientReceive(PlayerController P, optional int Switch, optional PlayerReplicationInfo RelatedPRI_1, optional PlayerReplicationInfo RelatedPRI_2, optional Object OptionalObject)
{
    local ASOBJ_EnergyCore_Spawn EC;

    super.ClientReceive(P, Switch, RelatedPRI_1, RelatedPRI_2, OptionalObject);
    EC = ASOBJ_EnergyCore_Spawn(OptionalObject);
    // End:0xC4
    if(EC == none)
    {
        switch(Switch)
        {
            // End:0x45
            case 0:
            // End:0x6B
            case 1:
                P.QueueAnnouncement(Class'UT2k4Assault_Decompressed.GameObject_EnergyCore'.default.Announcer_EnergyCore_Dropped, 1);
                // End:0xC1
                break;
            // End:0x70
            case 2:
            // End:0x97
            case 3:
                P.QueueAnnouncement(Class'UT2k4Assault_Decompressed.GameObject_EnergyCore'.default.Announcer_EnergyCore_PickedUp, 1);
                // End:0xC1
                break;
            // End:0xBE
            case 4:
                P.QueueAnnouncement(Class'UT2k4Assault_Decompressed.GameObject_EnergyCore'.default.Announcer_EnergyCore_Reset, 1);
                // End:0xC1
                break;
            // End:0xFFFF
            default:
                break;
        }        
    }
    else
    {
        switch(Switch)
        {
            // End:0xCF
            case 0:
            // End:0xF5
            case 1:
                P.QueueAnnouncement(EC.Announcer_EnergyCore_Dropped, 1);
                // End:0x14B
                break;
            // End:0xFA
            case 2:
            // End:0x121
            case 3:
                P.QueueAnnouncement(EC.Announcer_EnergyCore_PickedUp, 1);
                // End:0x14B
                break;
            // End:0x148
            case 4:
                P.QueueAnnouncement(EC.Announcer_EnergyCore_Reset, 1);
                // End:0x14B
                break;
            // End:0xFFFF
            default:
                break;
        }
    }
    //return;    
}

defaultproperties
{
    bIsConsoleMessage=false
    bFadeMessage=true
    DrawColor=(R=255,G=0,B=0,A=255)
    StackMode=2
    PosY=0.2420000
    FontSize=1
}