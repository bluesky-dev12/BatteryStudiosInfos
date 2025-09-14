class StartupMessage extends CriticalEventPlus
    hidecategories(Movement,Collision,Lighting,LightColor,Karma,Force);

var localized string Stage[100];
var localized string NotReady;
var localized string SinglePlayer;
var Sound Riff;

static simulated function ClientReceive(PlayerController P, optional int Switch, optional PlayerReplicationInfo RelatedPRI_1, optional PlayerReplicationInfo RelatedPRI_2, optional Object OptionalObject)
{
    super(LocalMessage).ClientReceive(P, Switch, RelatedPRI_1, RelatedPRI_2, OptionalObject);
    // End:0x85
    if(Switch < 7)
    {
        P.Level.FillPrecacheMaterialsArray(false);
        P.Level.FillPrecacheStaticMeshesArray(false);
        P.Level.FillPrecacheSkeletalMeshesArray(false);
        P.PrecacheAnnouncements();
    }
    // End:0x172
    if(((((Switch == 5) && P != none) && P.Level != none) && P.Level.Game != none) && !P.Level.Game.IsA('DeathMatch') || !DeathMatch(P.Level.Game).bQuickStart && !DeathMatch(P.Level.Game).bSkipPlaySound)
    {
        P.PlayStatusAnnouncement("Play", 1, true);        
    }
    else
    {
        // End:0x19D
        if((Switch > 1) && Switch < 5)
        {
            P.PlayBeepSound();            
        }
        else
        {
            // End:0x1BD
            if(Switch == 7)
            {
                P.ClientPlaySound(default.Riff);
            }
        }
    }
    //return;    
}

static function string GetString(optional int Switch, optional PlayerReplicationInfo RelatedPRI_1, optional PlayerReplicationInfo RelatedPRI_2, optional Object OptionalObject)
{
    local int i, PlayerCount;
    local GameReplicationInfo GRI;

    // End:0x94
    if((RelatedPRI_1 != none) && int(RelatedPRI_1.Level.NetMode) == int(NM_Standalone))
    {
        // End:0x7F
        if((DeathMatch(RelatedPRI_1.Level.Game) != none) && DeathMatch(RelatedPRI_1.Level.Game).bQuickStart)
        {
            return "";
        }
        // End:0x91
        if(Switch < 2)
        {
            return default.SinglePlayer;
        }        
    }
    else
    {
        // End:0x1DD
        if((Switch == 0) && RelatedPRI_1 != none)
        {
            GRI = RelatedPRI_1.Level.GRI;
            // End:0xDC
            if(GRI == none)
            {
                return default.Stage[0];
            }
            i = 0;
            J0xE3:

            // End:0x194 [Loop If]
            if(i < GRI.PRIArray.Length)
            {
                // End:0x18A
                if(((GRI.PRIArray[i] != none) && !GRI.PRIArray[i].bOnlySpectator) && !GRI.PRIArray[i].bIsSpectator || GRI.PRIArray[i].bWaitingPlayer)
                {
                    PlayerCount++;
                }
                i++;
                // [Loop Continue]
                goto J0xE3;
            }
            // End:0x1DA
            if((GRI.MinNetPlayers - PlayerCount) > 0)
            {
                return ((default.Stage[0] @ "(") $ string(GRI.MinNetPlayers - PlayerCount)) $ ")";
            }            
        }
        else
        {
            // End:0x237
            if(Switch == 1)
            {
                // End:0x214
                if((RelatedPRI_1 == none) || !RelatedPRI_1.bWaitingPlayer)
                {
                    return default.Stage[0];                    
                }
                else
                {
                    // End:0x231
                    if(RelatedPRI_1.bReadyToPlay)
                    {
                        return default.Stage[1];                        
                    }
                    else
                    {
                        return default.NotReady;
                    }
                }
            }
        }
    }
    return default.Stage[Switch];
    //return;    
}

static function bool GotoHud(PlayerController P, optional int Switch, optional PlayerReplicationInfo RelatedPRI_1, optional PlayerReplicationInfo RelatedPRI_2, optional Object OptionalObject)
{
    return true;
    //return;    
}

defaultproperties
{
    Stage[0]="?? ????? ???? ?."
    Stage[1]="?? ?? ???? ?. ???????."
    Stage[2]="??? ? ?????...3?"
    Stage[3]="??? ? ?????...2?"
    Stage[4]="??? ? ?????...1?"
    Stage[5]="??? ???????!"
    Stage[6]="??? ???????!"
    Stage[7]="???? ??!"
    Stage[8]="Waiting for changing host"
    Stage[9]="Continue match!!"
    Stage[10]="0"
    Stage[11]="1"
    Stage[12]="2"
    Stage[13]="3"
    Stage[14]="4"
    Stage[15]="5"
    Stage[16]="6"
    Stage[17]="7"
    Stage[18]="8"
    Stage[19]="9"
    Stage[20]="10"
    Stage[21]="11"
    Stage[22]="12"
    Stage[23]="13"
    Stage[24]="14"
    Stage[25]="15"
    Stage[26]="16"
    Stage[27]="17"
    Stage[28]="18"
    Stage[29]="19"
    Stage[30]="20"
    Stage[31]="21"
    Stage[32]="22"
    Stage[33]="23"
    Stage[34]="24"
    Stage[35]="25"
    Stage[36]="26"
    Stage[37]="27"
    Stage[38]="28"
    Stage[39]="29"
    Stage[40]="30"
    Stage[41]="31"
    Stage[42]="32"
    Stage[43]="33"
    Stage[44]="34"
    Stage[45]="35"
    Stage[46]="36"
    Stage[47]="37"
    Stage[48]="38"
    Stage[49]="39"
    Stage[50]="40"
    Stage[51]="41"
    Stage[52]="42"
    Stage[53]="43"
    Stage[54]="44"
    Stage[55]="45"
    Stage[56]="46"
    Stage[57]="47"
    Stage[58]="48"
    Stage[59]="49"
    Stage[60]="50"
    Stage[61]="Changing Host"
    Stage[62]="Changing Host"
    Stage[63]="Changing Host"
    Stage[64]="Changing Host"
    Stage[65]="Changing Host"
    Stage[66]="Changing Host"
    Stage[67]="Changing Host"
    Stage[68]="Changing Host"
    Stage[69]="Changing Host"
    Stage[70]="Changing Host"
    Stage[71]="Changing Host"
    Stage[72]="Continue Game...1"
    Stage[73]="Continue Game...2"
    Stage[74]="Continue Game...3"
    Stage[75]="Continue Game...4"
    Stage[76]="Continue Game...5"
    Stage[77]="Continue Game...6"
    Stage[78]="Continue Game...7"
    Stage[79]="Continue Game...8"
    Stage[80]="Continue Game...9"
    Stage[81]="Continue Game...10"
    Stage[82]="Continue Game...11"
    Stage[83]="Continue Game...12"
    Stage[84]="Continue Game...13"
    Stage[85]="Continue Game...14"
    Stage[86]="Continue Game...15"
    NotReady="??? ??????. ?? ?? ?????!"
    SinglePlayer="??? ????? ??? ?????."
    bIsConsoleMessage=false
    DrawColor=(R=32,G=64,B=255,A=255)
}