class wSkill_SupportDefence extends wSkill;

var bool bSupply;
var int nSupplyValue;
var int nSupplyAddValue;
var int nIncGrenadeSkillID;
var int nSplitGrenadeSkillID;
var int nHellfireSkillID;
var int nAirWeaponSkillID;
var int nIncGrenadeID;
var int nSplitGrenadeID;
var int nHellfireID;
var string AirStrikeSoundStandby;
var string AirStrikeSoundPickUP;

simulated function PostBeginPlay()
{
    local int Kills, idx;

    Kills = Base.Owner.PlayerReplicationInfo.Kills;
    Log((((("[wSkill_SupportDefence:PostBeginPlay] Kills:" $ string(Kills)) $ ", SupplyValue:") $ string(nSupplyValue)) $ ", AddValue:") $ string(nSupplyAddValue));
    nSupplyAddValue = GetAddValue(Kills);
    // End:0x15D
    if((Kills != 0) && Kills >= nSupplyAddValue)
    {
        nSupplyValue = Kills / 100;
        nSupplyValue *= float(100);
        idx = int(float(Kills) % float(100)) / nSupplyAddValue;
        nSupplyValue += ((idx + 1) * nSupplyAddValue);
        Log((("[wSkill_SupportDefence:PostBeginPlay] Idx:" $ string(idx)) $ ", SupplyValue:") $ string(nSupplyValue));
    }
    //return;    
}

simulated function Initialize(wSkillBase SkillBase, wSkillBaseParam Param)
{
    super.Initialize(SkillBase, Param);
    nSupplyAddValue = GetAddValue(0);
    nSupplyValue = nSupplyAddValue;
    //return;    
}

simulated function UpdateProcess()
{
    local int nSupplyIndex, Kills;
    local PlayerController PC;

    PC = PlayerController(Base.Owner);
    Kills = Base.Owner.PlayerReplicationInfo.Kills;
    // End:0x325
    if(Kills >= nSupplyValue)
    {
        nSupplyAddValue = GetAddValue(Kills);
        nSupplyIndex = int(float(nSupplyValue / nSupplyAddValue) % float(100 / nSupplyAddValue));
        Log((((((("[wSkill_SupportDefence:UpdateProcess] Kills:" $ string(Kills)) $ ", SupplyValue:") $ string(nSupplyValue)) $ ", AddValue:") $ string(nSupplyAddValue)) $ ", Index:") $ string(nSupplyIndex));
        nSupplyValue += nSupplyAddValue;
        // End:0x244
        if(nSupplyIndex == 0)
        {
            PC.Pawn.PlayerReplicationInfo.abySupplyItemFlag[int(3)] = 1;
            PC.myHUD.LastPickupTime = PC.Level.TimeSeconds;
            PC.myHUD.LastAirStirkePickupTime = PC.Level.TimeSeconds;
            PC.FmodClientPlaySound(AirStrikeSoundPickUP,,, 0);
            PC.QueueAnnouncement(Class'Engine_Decompressed.wGameManager'.default.VoicePackageName $ AirStrikeSoundStandby, 1);
            PC.ReceiveMessage_QuestType2(Class'Engine_Decompressed.wMessage_Quest', Class'Engine_Decompressed.wMessage_Quest'.default.Code_Quest_AcquireTrophy,,,, 3);
            // End:0x241
            if(int(PC.Role) == int(ROLE_Authority))
            {
                PC.Pawn.AddWeaponFromSkill(EmptyBtrDouble(), nAirWeaponSkillID);
            }            
        }
        else
        {
            nSupplyIndex = int(float(nSupplyIndex) % float(2));
            // End:0x2C6
            if(nSupplyIndex == 1)
            {
                PC.myHUD.InsertUsingSkillList(nIncGrenadeSkillID, 0, SkillID);
                // End:0x2C3
                if(int(PC.Role) == int(ROLE_Authority))
                {
                    PC.Pawn.AddWeaponFromSkill(EmptyBtrDouble(), nIncGrenadeID);
                }                
            }
            else
            {
                PC.myHUD.InsertUsingSkillList(nSplitGrenadeSkillID, 0, SkillID);
                // End:0x325
                if(int(PC.Role) == int(ROLE_Authority))
                {
                    PC.Pawn.AddWeaponFromSkill(EmptyBtrDouble(), nSplitGrenadeID);
                }
            }
        }
    }
    //return;    
}

function int GetAddValue(int Kills)
{
    // End:0x12
    if(Kills < 100)
    {
        return 20;        
    }
    else
    {
        // End:0x21
        if(Kills < 190)
        {
            return 15;
        }
    }
    return 10;
    //return;    
}

defaultproperties
{
    nSupplyAddValue=20
    nIncGrenadeSkillID=40017
    nSplitGrenadeSkillID=40022
    nHellfireSkillID=40018
    nAirWeaponSkillID=5006
    nIncGrenadeID=6005
    nSplitGrenadeID=7003
    nHellfireID=5013
    AirStrikeSoundStandby="/Combat_self/v_cb_ready_artillery_R"
    AirStrikeSoundPickUP="Warfare_Sound_ATS/cb/ats_cb_ready_artillery"
}