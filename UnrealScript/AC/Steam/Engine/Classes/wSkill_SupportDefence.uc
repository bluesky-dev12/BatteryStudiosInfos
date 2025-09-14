/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path Engine\Classes\wSkill_SupportDefence.uc
 * Package Imports:
 *	Engine
 *	Core
 *
 * Stats:
 *	Properties:12
 *	Functions:4
 *
 *******************************************************************************/
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
    Log("[wSkill_SupportDefence:PostBeginPlay] Kills:" $ string(Kills) $ ", SupplyValue:" $ string(nSupplyValue) $ ", AddValue:" $ string(nSupplyAddValue));
    nSupplyAddValue = GetAddValue(Kills);
    // End:0x15d
    if(Kills != 0 && Kills >= nSupplyAddValue)
    {
        nSupplyValue = Kills / 100;
        nSupplyValue *= float(100);
        idx = int(float(Kills) % float(100)) / nSupplyAddValue;
        nSupplyValue += idx + 1 * nSupplyAddValue;
        Log("[wSkill_SupportDefence:PostBeginPlay] Idx:" $ string(idx) $ ", SupplyValue:" $ string(nSupplyValue));
    }
}

simulated function Initialize(wSkillBase SkillBase, wSkillBaseParam Param)
{
    super.Initialize(SkillBase, Param);
    nSupplyAddValue = GetAddValue(0);
    nSupplyValue = nSupplyAddValue;
}

simulated function UpdateProcess()
{
    local int nSupplyIndex, Kills;
    local PlayerController PC;

    PC = PlayerController(Base.Owner);
    Kills = Base.Owner.PlayerReplicationInfo.Kills;
    // End:0x32e
    if(Kills >= nSupplyValue)
    {
        nSupplyAddValue = GetAddValue(Kills);
        nSupplyIndex = int(float(nSupplyValue / nSupplyAddValue) % float(100 / nSupplyAddValue));
        Log("[wSkill_SupportDefence:UpdateProcess] Kills:" $ string(Kills) $ ", SupplyValue:" $ string(nSupplyValue) $ ", AddValue:" $ string(nSupplyAddValue) $ ", Index:" $ string(nSupplyIndex));
        nSupplyValue += nSupplyAddValue;
        // End:0x24f
        if(nSupplyIndex == 0)
        {
            PC.Pawn.PlayerReplicationInfo.bySupply_AirStrike = 1;
            PC.myHUD.LastPickupTime = PC.Level.TimeSeconds;
            PC.myHUD.LastAirStirkePickupTime = PC.Level.TimeSeconds;
            PC.ClientPlaySound(Sound(DynamicLoadObject(AirStrikeSoundPickUP, class'Sound')),,, 0);
            PC.QueueAnnouncement(class'wGameManager'.default.VoicePackageName $ AirStrikeSoundStandby, 1);
            PC.ReceiveMessage_QuestType2(class'wMessage_Quest', class'wMessage_Quest'.default.Code_Quest_AcquireTrophy,,,, 3);
            // End:0x24c
            if(PC.Role == 4)
            {
                PC.Pawn.AddWeaponFromSkill(EmptyBtrDouble(), nAirWeaponSkillID);
            }
        }
        // End:0x32e
        else
        {
            nSupplyIndex = int(float(nSupplyIndex) % float(2));
            // End:0x2d0
            if(nSupplyIndex == 1)
            {
                PC.myHUD.InsertUsingSkillList(nIncGrenadeSkillID, SkillID);
                // End:0x2cd
                if(PC.Role == 4)
                {
                    PC.Pawn.AddWeaponFromSkill(EmptyBtrDouble(), nIncGrenadeID);
                }
            }
            // End:0x32e
            else
            {
                PC.myHUD.InsertUsingSkillList(nSplitGrenadeSkillID, SkillID);
                // End:0x32e
                if(PC.Role == 4)
                {
                    PC.Pawn.AddWeaponFromSkill(EmptyBtrDouble(), nSplitGrenadeID);
                }
            }
        }
    }
}

function int GetAddValue(int Kills)
{
    // End:0x12
    if(Kills < 100)
    {
        return 20;
    }
    // End:0x21
    else
    {
        // End:0x21
        if(Kills < 190)
        {
            return 15;
        }
    }
    return 10;
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
    AirStrikeSoundStandby=".Combat_self.v_cb_ready_artillery_R"
    AirStrikeSoundPickUP="Warfare_Sound_ATS.cb.ats_cb_ready_artillery"
}