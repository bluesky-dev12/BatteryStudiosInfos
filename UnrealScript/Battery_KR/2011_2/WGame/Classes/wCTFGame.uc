class wCTFGame extends CTFGame
    config
    hidecategories(Movement,Collision,Lighting,LightColor,Karma,Force);

static function PrecacheGameTextures(LevelInfo myLevel)
{
    Class'WGame_Decompressed.wTeamGame'.static.PrecacheGameTextures(myLevel);
    //return;    
}

static function PrecacheGameStaticMeshes(LevelInfo myLevel)
{
    Class'WGame_Decompressed.wDeathMatch'.static.PrecacheGameStaticMeshes(myLevel);
    //return;    
}

function Actor FindSpecGoalFor(PlayerReplicationInfo PRI, int TeamIndex)
{
    local wPlayer PC;
    local Controller C;
    local CTFFlag Flags[2], F;

    PC = wPlayer(PRI.Owner);
    // End:0x26
    if(PC == none)
    {
        return none;
    }
    C = Level.ControllerList;
    J0x3A:

    // End:0xD7 [Loop If]
    if(C != none)
    {
        // End:0xC0
        if(((C.PlayerReplicationInfo != none) && C.PlayerReplicationInfo.HasFlag != none) && (PC.ViewTarget == none) || PC.ViewTarget != C.Pawn)
        {
            return C.Pawn;
        }
        C = C.nextController;
        // [Loop Continue]
        goto J0x3A;
    }
    // End:0x104
    foreach AllActors(Class'UnrealGame.CTFFlag', F)
    {
        Flags[int(F.TeamNum)] = F;        
    }    
    // End:0x159
    if(VSize(PC.Location - Flags[0].Location) < VSize(PC.Location - Flags[1].Location))
    {
        return Flags[1];        
    }
    else
    {
        return Flags[0];
    }
    return none;
    //return;    
}

event SetGrammar()
{
    LoadSRGrammar("CTF");
    //return;    
}

defaultproperties
{
    DefaultEnemyRosterClass="WGame.wTeamRoster"
    HUDType="XInterface.HudCCaptureTheFlag"
    MapListType="XInterface.MapListCaptureTheFlag"
    DeathMessageClass=Class'WGame_Decompressed.wDeathMessage'
    OtherMesgGroup="CTFGame"
    GameName="?? ??"
    ScreenShotName="UT2004Thumbnails.CTFShots"
    DecoTextName="WGame.CTFGame"
    Acronym="CTF"
}