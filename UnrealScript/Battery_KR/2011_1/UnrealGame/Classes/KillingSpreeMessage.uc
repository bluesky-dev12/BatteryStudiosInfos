class KillingSpreeMessage extends CriticalEventPlus
    hidecategories(Movement,Collision,Lighting,LightColor,Karma,Force);

var localized string EndSpreeNote;
var localized string EndSelfSpree;
var localized string EndFemaleSpree;
var localized string MultiKillString;
var localized string SpreeNote[10];
var localized string SelfSpreeNote[10];
var Sound SpreeSound[10];
var name SpreeSoundName[10];
var localized string EndSpreeNoteTrailer;

static function int GetFontSize(int Switch, PlayerReplicationInfo RelatedPRI1, PlayerReplicationInfo RelatedPRI2, PlayerReplicationInfo LocalPlayer)
{
    local Pawn ViewPawn;

    // End:0x83
    if(RelatedPRI2 == none)
    {
        // End:0x1D
        if(LocalPlayer == RelatedPRI1)
        {
            return 2;
        }
        // End:0x83
        if(LocalPlayer.bOnlySpectator)
        {
            ViewPawn = Pawn(LocalPlayer.Level.GetLocalPlayerController().ViewTarget);
            // End:0x83
            if((ViewPawn != none) && ViewPawn.PlayerReplicationInfo == RelatedPRI1)
            {
                return 2;
            }
        }
    }
    return default.FontSize;
    //return;    
}

static function string GetRelatedString(optional int Switch, optional PlayerReplicationInfo RelatedPRI_1, optional PlayerReplicationInfo RelatedPRI_2, optional Object OptionalObject)
{
    // End:0x17
    if(RelatedPRI_2 == none)
    {
        return default.SelfSpreeNote[Switch];
    }
    return GetString(Switch, RelatedPRI_1, RelatedPRI_2, OptionalObject);
    //return;    
}

static function string GetString(optional int Switch, optional PlayerReplicationInfo RelatedPRI_1, optional PlayerReplicationInfo RelatedPRI_2, optional Object OptionalObject)
{
    // End:0x4D
    if(RelatedPRI_2 == none)
    {
        // End:0x19
        if(RelatedPRI_1 == none)
        {
            return "";
        }
        // End:0x4A
        if(RelatedPRI_1.PlayerName != "")
        {
            return RelatedPRI_1.PlayerName @ default.SpreeNote[Switch];
        }        
    }
    else
    {
        // End:0xB1
        if(RelatedPRI_1 == none)
        {
            // End:0xAE
            if(RelatedPRI_2.PlayerName != "")
            {
                // End:0x98
                if(RelatedPRI_2.bIsFemale)
                {
                    return RelatedPRI_2.PlayerName @ default.EndFemaleSpree;                    
                }
                else
                {
                    return RelatedPRI_2.PlayerName @ default.EndSelfSpree;
                }
            }            
        }
        else
        {
            return ((RelatedPRI_1.PlayerName $ default.EndSpreeNote) @ RelatedPRI_2.PlayerName) @ default.EndSpreeNoteTrailer;
        }
    }
    return "";
    //return;    
}

static simulated function ClientReceive(PlayerController P, optional int Switch, optional PlayerReplicationInfo RelatedPRI_1, optional PlayerReplicationInfo RelatedPRI_2, optional Object OptionalObject)
{
    super(LocalMessage).ClientReceive(P, Switch, RelatedPRI_1, RelatedPRI_2, OptionalObject);
    // End:0x2C
    if(RelatedPRI_2 != none)
    {
        return;
    }
    // End:0xC4
    if((RelatedPRI_1 == P.PlayerReplicationInfo) || (P.PlayerReplicationInfo.bOnlySpectator && Pawn(P.ViewTarget) != none) && Pawn(P.ViewTarget).PlayerReplicationInfo == RelatedPRI_1)
    {
        P.PlayRewardAnnouncement(default.SpreeSoundName[Switch], 1, true);        
    }
    else
    {
        P.PlayBeepSound();
    }
    //return;    
}

defaultproperties
{
    EndSpreeNote="?? ???? ??? ??? ????? "
    EndSelfSpree="?? ???? ??? ??? ?????"
    EndFemaleSpree="?? ???? ??? ??? ?????"
    SpreeNote[0]="?? ???? ??? ?? ????!"
    SpreeNote[1]="?, ?? ???? ???? ?????!"
    SpreeNote[2]="?, ?? ? ????!"
    SpreeNote[3]="?? ?? ? ????!"
    SpreeNote[4]="?, ?? ?? ??? ?????!"
    SpreeNote[5]="?, ?? ???? ?????!"
    SelfSpreeNote[0]="?? ???!"
    SelfSpreeNote[1]="????!"
    SelfSpreeNote[2]="?????!"
    SelfSpreeNote[3]="?????!"
    SelfSpreeNote[4]="????!"
    SelfSpreeNote[5]="??? ?!"
    SpreeSoundName[0]="Killing_Spree"
    SpreeSoundName[1]="Rampage"
    SpreeSoundName[2]="Dominating"
    SpreeSoundName[3]="Unstoppable"
    SpreeSoundName[4]="GodLike"
    SpreeSoundName[5]="WhickedSick"
    FontSize=0
}