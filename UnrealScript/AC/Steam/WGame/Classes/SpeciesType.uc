/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path WGame\Classes\SpeciesType.uc
 * Package Imports:
 *	WGame
 *	Core
 *
 * Stats:
 *	Properties:24
 *	Functions:9
 *
 *******************************************************************************/
class SpeciesType extends Object
    native
    abstract;

var string MaleVoice;
var string FemaleVoice;
var string GibGroup;
var string MaleRagSkelName;
var string FemaleRagSkelName;
var string FemaleSkeleton;
var string MaleSkeleton;
var string MaleSoundGroup;
var string FemaleSoundGroup;
var string PawnClassName;
var localized string SpeciesName;
var int RaceNum;
var int DMTeam;
var name TauntAnims[16];
var localized string TauntAnimNames[16];
var float AirControl;
var float GroundSpeed;
var float WaterSpeed;
var float JumpZ;
var float ReceivedDamageScaling;
var float DamageScaling;
var float AccelRate;
var float DodgeSpeedFactor;
var float DodgeSpeedZ;

static function string GetVoiceType(bool bIsFemale, LevelInfo Level)
{
    // End:0x3c
    if(bIsFemale)
    {
        // End:0x36
        if(Level.bLowSoundDetail)
        {
            return "WGame.JuggFemaleVoice";
        }
        // End:0x3c
        else
        {
            return default.FemaleVoice;
        }
    }
    // End:0x67
    if(Level.bLowSoundDetail)
    {
        return "WGame.JuggMaleVoice";
    }
    // End:0x6d
    else
    {
        return default.MaleVoice;
    }
}

static function LoadResources(PlayerRecord Rec, LevelInfo Level, PlayerReplicationInfo PRI, int TeamNum)
{
    local string BodySkinName, SkelName, FaceSkinName;
    local Material NewBodySkin, NewFaceSkin, TeamFaceSkin;
    local class<xPawnGibGroup> GibGroupClass;
    local Mesh customskel;

    // End:0x2f
    if(Level.NetMode != 1 && class'DeathMatch'.default.bForceDefaultCharacter)
    {
        return;
    }
    DynamicLoadObject(Rec.MeshName, class'Mesh');
    // End:0x90
    if(Level.NetMode != 1 && Rec.Skeleton != "")
    {
        customskel = Mesh(DynamicLoadObject(Rec.Skeleton, class'Mesh'));
    }
    // End:0x102
    if(Rec.Sex ~= "Female")
    {
        SkelName = default.FemaleSkeleton;
        // End:0xef
        if(Level.bLowSoundDetail)
        {
            DynamicLoadObject("WGame.wJuggFemaleSoundGroup", class'Class');
        }
        // End:0xff
        else
        {
            DynamicLoadObject(default.FemaleSoundGroup, class'Class');
        }
    }
    // End:0x158
    else
    {
        SkelName = default.MaleSkeleton;
        // End:0x148
        if(Level.bLowSoundDetail)
        {
            DynamicLoadObject("WGame.wJuggMaleSoundGroup", class'Class');
        }
        // End:0x158
        else
        {
            DynamicLoadObject(default.MaleSoundGroup, class'Class');
        }
    }
    // End:0x181
    if(customskel == none && SkelName != "")
    {
        DynamicLoadObject(SkelName, class'Mesh');
    }
    NewFaceSkin = Material(DynamicLoadObject(Rec.FaceSkinName, class'Material'));
    // End:0x1eb
    if(TeamNum == 255 && Level.GRI != none && Level.GRI.bForceTeamSkins)
    {
        TeamNum = default.DMTeam;
    }
    // End:0x399
    if(TeamNum != 255 && Level.GRI == none || !Level.GRI.bNoTeamSkins)
    {
        // End:0x2aa
        if(class'DMMutator'.default.bBrightSkins && Left(Rec.BodySkinName, 12) ~= "PlayerSkins.")
        {
            BodySkinName = "Bright" $ Rec.BodySkinName $ "_" $ string(TeamNum) $ "B";
            NewBodySkin = Material(DynamicLoadObject(BodySkinName, class'Material', true));
        }
        // End:0x34b
        if(NewBodySkin == none)
        {
            BodySkinName = Rec.BodySkinName $ "_" $ string(TeamNum);
            NewBodySkin = Material(DynamicLoadObject(BodySkinName, class'Material'));
            // End:0x34b
            if(Rec.TeamFace)
            {
                FaceSkinName = Rec.FaceSkinName $ "_" $ string(TeamNum);
                TeamFaceSkin = Material(DynamicLoadObject(FaceSkinName, class'Material'));
                // End:0x34b
                if(TeamFaceSkin != none)
                {
                    NewFaceSkin = TeamFaceSkin;
                }
            }
        }
        // End:0x396
        if(NewBodySkin == none)
        {
            Log("TeamSkin not found " $ string(NewBodySkin));
            NewBodySkin = Material(DynamicLoadObject(Rec.BodySkinName, class'Material'));
        }
    }
    // End:0x3b9
    else
    {
        NewBodySkin = Material(DynamicLoadObject(Rec.BodySkinName, class'Material'));
    }
    // End:0x418
    if(Rec.BodySkinName ~= "UT2004PlayerSkins.XanMk3V2_Body")
    {
        DynamicLoadObject("UT2004PlayerSkins.XanMk3V2_abdomen", class'Material');
    }
    Level.AddPrecacheMaterial(Rec.Portrait);
    GibGroupClass = class<xPawnGibGroup>(DynamicLoadObject(default.GibGroup, class'Class'));
    GibGroupClass.static.PrecacheContent(Level);
}

static function int ModifyReceivedDamage(int Damage, Pawn injured, Pawn instigatedBy, Vector HitLocation, Vector Momentum, class<DamageType> DamageType)
{
    return int(float(Damage) * default.ReceivedDamageScaling);
}

static function int ModifyImpartedDamage(int Damage, Pawn injured, Pawn instigatedBy, Vector HitLocation, Vector Momentum, class<DamageType> DamageType)
{
    return int(float(Damage) * default.DamageScaling);
}

static function ModifyPawn(Pawn P)
{
    P.AirControl = P.default.AirControl * default.AirControl;
    P.GroundSpeed = P.default.GroundSpeed * default.GroundSpeed;
    P.WaterSpeed = P.default.WaterSpeed * default.WaterSpeed;
    P.JumpZ = P.default.JumpZ * default.JumpZ;
    P.AccelRate = P.default.AccelRate * default.AccelRate;
    P.DodgeSpeedFactor = P.default.DodgeSpeedFactor * default.DodgeSpeedFactor;
    P.DodgeSpeedZ = P.default.DodgeSpeedZ * default.DodgeSpeedZ;
}

static function string GetRagSkelName(string MeshName)
{
    // End:0x1b
    if(InStr(MeshName, "Female") >= 0)
    {
        return default.FemaleRagSkelName;
    }
    return default.MaleRagSkelName;
}

static function SetTeamSkin(wPawn P, PlayerRecord Rec, int TeamNum);
static function bool Setup(wPawn P, PlayerRecord Rec)
{
    local Mesh customskel;
    local string SkelName;
    local int TeamNum, i, j;

    // End:0x138
    if(P.bAlreadySetup)
    {
        // End:0x136
        if(P.Level.NetMode == 3)
        {
            // End:0x90
            if(P.PlayerReplicationInfo != none && P.PlayerReplicationInfo.Team != none)
            {
                TeamNum = P.PlayerReplicationInfo.Team.TeamIndex;
            }
            // End:0x11a
            else
            {
                // End:0x11a
                if(P.DrivenVehicle != none && P.DrivenVehicle.PlayerReplicationInfo != none && P.DrivenVehicle.PlayerReplicationInfo.Team != none)
                {
                    TeamNum = P.DrivenVehicle.PlayerReplicationInfo.Team.TeamIndex;
                }
            }
            // End:0x136
            if(P.TeamSkin == TeamNum)
            {
                return true;
            }
        }
        return true;
    }
    P.bIsFemale = Rec.Sex ~= "Female";
    // End:0x198
    if(P.PlayerReplicationInfo != none)
    {
        P.PlayerReplicationInfo.bIsFemale = P.bIsFemale;
    }
    // End:0x1ed
    if(P.Level.NetMode != 1 && Rec.Skeleton != "")
    {
        customskel = Mesh(DynamicLoadObject(Rec.Skeleton, class'Mesh'));
    }
    // End:0x28b
    if(P.bIsFemale)
    {
        SkelName = default.FemaleSkeleton;
        // End:0x264
        if(P.Level.bLowSoundDetail)
        {
            P.SoundGroupClass = class<wPawnSoundGroup>(DynamicLoadObject("WGame.wJuggFemaleSoundGroup", class'Class'));
        }
        // End:0x288
        else
        {
            P.SoundGroupClass = class<wPawnSoundGroup>(DynamicLoadObject(default.FemaleSoundGroup, class'Class'));
        }
    }
    // End:0x312
    else
    {
        SkelName = default.MaleSkeleton;
        // End:0x2ee
        if(P.Level.bLowSoundDetail)
        {
            P.SoundGroupClass = class<wPawnSoundGroup>(DynamicLoadObject("WGame.wJuggMaleSoundGroup", class'Class'));
        }
        // End:0x312
        else
        {
            P.SoundGroupClass = class<wPawnSoundGroup>(DynamicLoadObject(default.MaleSoundGroup, class'Class'));
        }
    }
    // End:0x334
    if(P.Level.NetMode != 1)
    {
    }
    P.GibGroupClass = class<xPawnGibGroup>(DynamicLoadObject(default.GibGroup, class'Class'));
    i = 0;
    J0x35f:
    // End:0x3ee [While If]
    if(i < 16)
    {
        // End:0x3e4
        if(default.TauntAnims[i] != 'None')
        {
            j = P.TauntAnims.Length;
            P.TauntAnims[j] = default.TauntAnims[i];
            P.TauntAnimNames[j] = default.TauntAnimNames[i];
            // End:0x3e4
            if(j == 15)
            {
            }
            // End:0x3ee
            else
            {
            }
            ++ i;
            // This is an implied JumpToken; Continue!
            goto J0x35f;
        }
    }
    return true;
}

static function int GetOffsetForSequence(name Sequence)
{
    local int i;

    i = 0;
    J0x07:
    // End:0x53 [While If]
    if(i < 16)
    {
        // End:0x2e
        if(default.TauntAnims[i] == 'None')
        {
            return -1;
        }
        // End:0x49
        if(default.TauntAnims[i] == Sequence)
        {
            return i;
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x07;
    }
    return -1;
}

defaultproperties
{
    PawnClassName="WGame.wPawn"
    SpeciesName="??"
    TauntAnims[0]=gesture_point
    TauntAnims[1]=gesture_beckon
    TauntAnims[2]=gesture_halt
    TauntAnims[3]=gesture_cheer
    TauntAnims[4]=PThrust
    TauntAnims[5]=AssSmack
    TauntAnims[6]=ThroatCut
    TauntAnims[7]=Specific_1
    TauntAnims[8]=Gesture_Taunt01
    TauntAnims[9]=Idle_Character01
    TauntAnimNames[0]="???"
    TauntAnimNames[1]="??"
    TauntAnimNames[2]="?????"
    TauntAnimNames[3]="???"
    TauntAnimNames[4]="?? ???"
    TauntAnimNames[5]="??? ???"
    TauntAnimNames[6]="???"
    TauntAnimNames[7]="??"
    TauntAnimNames[8]="? ??"
    TauntAnimNames[9]="? ???"
    AirControl=1.0
    GroundSpeed=1.0
    WaterSpeed=1.0
    JumpZ=1.0
    ReceivedDamageScaling=1.0
    DamageScaling=1.0
    AccelRate=1.0
    DodgeSpeedFactor=1.0
    DodgeSpeedZ=1.0
}