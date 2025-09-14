/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path WGame\Classes\wCTFGame.uc
 * Package Imports:
 *	WGame
 *	UnrealGame
 *	Engine
 *	Core
 *
 * Stats:
 *	Functions:4
 *
 *******************************************************************************/
class wCTFGame extends CTFGame
    hidecategories(Movement,Collision,Lighting,LightColor,Karma,Force)
    config();

static function PrecacheGameTextures(LevelInfo myLevel)
{
    class'wTeamGame'.static.PrecacheGameTextures(myLevel);
}

static function PrecacheGameStaticMeshes(LevelInfo myLevel)
{
    class'wDeathMatch'.static.PrecacheGameStaticMeshes(myLevel);
}

function Actor FindSpecGoalFor(PlayerReplicationInfo PRI, int TeamIndex)
{
    local wPlayer PC;
    local Controller C;
    local CTFFlag Flags[2], f;

    PC = wPlayer(PRI.Owner);
    // End:0x26
    if(PC == none)
    {
        return none;
    }
    C = Level.ControllerList;
    J0x3a:
    // End:0xd7 [While If]
    if(C != none)
    {
        // End:0xc0
        if(C.PlayerReplicationInfo != none && C.PlayerReplicationInfo.HasFlag != none && PC.ViewTarget == none || PC.ViewTarget != C.Pawn)
        {
            return C.Pawn;
        }
        C = C.nextController;
        // This is an implied JumpToken; Continue!
        goto J0x3a;
    }
    // End:0x104
    foreach AllActors(class'CTFFlag', f)
    {
        Flags[f.TeamNum] = f;                
    }
    // End:0x159
    if(VSize(PC.Location - Flags[0].Location) < VSize(PC.Location - Flags[1].Location))
    {
        return Flags[1];
    }
    // End:0x161
    else
    {
        return Flags[0];
    }
    return none;
}

event SetGrammar()
{
    LoadSRGrammar("CTF");
}

defaultproperties
{
    DefaultEnemyRosterClass="WGame.wTeamRoster"
    HUDType="XInterface.HudCCaptureTheFlag"
    MapListType="XInterface.MapListCaptureTheFlag"
    DeathMessageClass=class'wDeathMessage'
    OtherMesgGroup=CTFGame
    GameName="?? ??"
    ScreenShotName="UT2004Thumbnails.CTFShots"
    DecoTextName="WGame.CTFGame"
    Acronym="CTF"
}