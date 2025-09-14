/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path UT2k4Assault\Classes\Message_AssaultTeamRole.uc
 * Package Imports:
 *	UT2k4Assault
 *	Engine
 *	Core
 *
 * Stats:
 *	Properties:5
 *	Functions:4
 *
 *******************************************************************************/
class Message_AssaultTeamRole extends LocalMessage
    hidecategories(Movement,Collision,Lighting,LightColor,Karma,Force);

var localized string Message_PostLogin_Attacker;
var localized string Message_PostLogin_Defender;
var name TeamSounds[2];
var Color BlueColor;
var Color RedColor;

static function ClientReceive(PlayerController P, optional int Switch, optional PlayerReplicationInfo RelatedPRI_1, optional PlayerReplicationInfo RelatedPRI_2, optional Object OptionalObject)
{
    local GameObjective Go;
    local bool bNotify;

    super.ClientReceive(P, Switch, RelatedPRI_1, RelatedPRI_2, OptionalObject);
    // End:0xb7
    if(P.myHUD != none && P.myHUD.IsA('HUD_Assault'))
    {
        HUD_Assault(P.myHUD).CurrentObjective = none;
        Go = HUD_Assault(P.myHUD).GetCurrentObjective();
        bNotify = HUD_Assault(P.myHUD).CanSpawnNotify();
    }
    // End:0x12b
    if(bNotify)
    {
        switch(Switch)
        {
            // End:0xea
            case 0:
                P.QueueAnnouncement(string(default.TeamSounds[0]), 2, 2);
                // End:0x110
                break;
            // End:0x10d
            case 1:
                P.QueueAnnouncement(string(default.TeamSounds[1]), 2, 2);
                // End:0x110
                break;
            // End:0xffff
            default:
                AnnounceCurrentObjective(P, Go, Switch == 0);
                // End:0x13f Break;
                break;
            }
    }
    AnnounceCurrentObjective(P, none, Switch == 0);
}

static function string GetString(optional int Switch, optional PlayerReplicationInfo RelatedPRI_1, optional PlayerReplicationInfo RelatedPRI_2, optional Object OptionalObject)
{
    switch(Switch)
    {
        // End:0x11
        case 0:
            return default.Message_PostLogin_Attacker;
        // End:0x1b
        case 1:
            return default.Message_PostLogin_Defender;
        // End:0xffff
        default:
}

static function Color GetColor(optional int Switch, optional PlayerReplicationInfo RelatedPRI_1, optional PlayerReplicationInfo RelatedPRI_2)
{
    // End:0x50
    if(RelatedPRI_1 != none && RelatedPRI_1.Team != none)
    {
        // End:0x47
        if(RelatedPRI_1.Team.TeamIndex == 0)
        {
            return default.RedColor;
        }
        // End:0x4d
        else
        {
            return default.BlueColor;
        }
    }
    // End:0x56
    else
    {
        return default.DrawColor;
    }
}

static function AnnounceCurrentObjective(PlayerController PC, GameObjective Go, bool bAttacking)
{
    local Sound Announcer;

    // End:0xa9
    if(Go != none && Go.IsActive() && !Go.bOptionalObjective)
    {
        // End:0x75
        if(bAttacking)
        {
            Announcer = Sound(DynamicLoadObject(class'wGameManager'.default.VoicePackageName $ Go.Announcer_ObjectiveInfo, class'Sound'));
        }
        // End:0xa9
        else
        {
            Announcer = Sound(DynamicLoadObject(class'wGameManager'.default.VoicePackageName $ Go.Announcer_DefendObjective, class'Sound'));
        }
    }
    // End:0xdc
    if(Announcer != none)
    {
        PC.QueueAnnouncement(string(Announcer.Name), 1, 1, 200);
    }
    // End:0xf3
    else
    {
        PC.QueueAnnouncement("", 1, 1, 201);
    }
}

defaultproperties
{
    Message_PostLogin_Attacker="??? ?????!!"
    Message_PostLogin_Defender="??? ?????!!"
    TeamSounds[0]=You_are_attacking
    TeamSounds[1]=You_are_defending
    BlueColor=(R=0,G=0,B=255,A=255)
    RedColor=(R=255,G=0,B=0,A=255)
    bIsUnique=true
    bIsConsoleMessage=true
    bFadeMessage=true
    StackMode=2
    PosY=0.330
}