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
    // End:0xB7
    if((P.myHUD != none) && P.myHUD.IsA('HUD_Assault'))
    {
        HUD_Assault(P.myHUD).CurrentObjective = none;
        Go = HUD_Assault(P.myHUD).GetCurrentObjective();
        bNotify = HUD_Assault(P.myHUD).CanSpawnNotify();
    }
    // End:0x12B
    if(bNotify)
    {
        switch(Switch)
        {
            // End:0xEA
            case 0:
                P.QueueAnnouncement(string(default.TeamSounds[0]), 2, 2);
                // End:0x110
                break;
            // End:0x10D
            case 1:
                P.QueueAnnouncement(string(default.TeamSounds[1]), 2, 2);
                // End:0x110
                break;
            // End:0xFFFF
            default:
                break;
        }
        AnnounceCurrentObjective(P, Go, Switch == 0);        
    }
    else
    {
        AnnounceCurrentObjective(P, none, Switch == 0);
    }
    //return;    
}

static function string GetString(optional int Switch, optional PlayerReplicationInfo RelatedPRI_1, optional PlayerReplicationInfo RelatedPRI_2, optional Object OptionalObject)
{
    switch(Switch)
    {
        // End:0x11
        case 0:
            return default.Message_PostLogin_Attacker;
        // End:0x1B
        case 1:
            return default.Message_PostLogin_Defender;
        // End:0xFFFF
        default:
            //return;
            break;
    }    
}

static function Color GetColor(optional int Switch, optional PlayerReplicationInfo RelatedPRI_1, optional PlayerReplicationInfo RelatedPRI_2)
{
    // End:0x50
    if((RelatedPRI_1 != none) && RelatedPRI_1.Team != none)
    {
        // End:0x47
        if(RelatedPRI_1.Team.TeamIndex == 0)
        {
            return default.RedColor;            
        }
        else
        {
            return default.BlueColor;
        }        
    }
    else
    {
        return default.DrawColor;
    }
    //return;    
}

static function AnnounceCurrentObjective(PlayerController PC, GameObjective Go, bool bAttacking)
{
    local Sound Announcer;

    // End:0xA9
    if(((Go != none) && Go.IsActive()) && !Go.bOptionalObjective)
    {
        // End:0x75
        if(bAttacking)
        {
            Announcer = Sound(DynamicLoadObject(Class'Engine.wGameManager'.default.VoicePackageName $ Go.Announcer_ObjectiveInfo, Class'Engine.Sound'));            
        }
        else
        {
            Announcer = Sound(DynamicLoadObject(Class'Engine.wGameManager'.default.VoicePackageName $ Go.Announcer_DefendObjective, Class'Engine.Sound'));
        }
    }
    // End:0xDC
    if(Announcer != none)
    {
        PC.QueueAnnouncement(string(Announcer.Name), 1, 1, 200);        
    }
    else
    {
        PC.QueueAnnouncement("", 1, 1, 201);
    }
    //return;    
}

defaultproperties
{
    Message_PostLogin_Attacker="??? ?????!!"
    Message_PostLogin_Defender="??? ?????!!"
    TeamSounds[0]="You_are_attacking"
    TeamSounds[1]="You_are_defending"
    BlueColor=(R=0,G=0,B=255,A=255)
    RedColor=(R=255,G=0,B=0,A=255)
    bIsUnique=true
    bIsConsoleMessage=false
    bFadeMessage=true
    StackMode=2
    PosY=0.3300000
}