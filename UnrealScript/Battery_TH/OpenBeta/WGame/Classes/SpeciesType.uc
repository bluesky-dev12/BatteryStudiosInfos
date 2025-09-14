class SpeciesType extends Object
    abstract
    native;

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
    // End:0x3C
    if(bIsFemale)
    {
        // End:0x36
        if(Level.bLowSoundDetail)
        {
            return "WGame.JuggFemaleVoice";            
        }
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
    else
    {
        return default.MaleVoice;
    }
    //return;    
}

static function LoadResources(PlayerRecord Rec, LevelInfo Level, PlayerReplicationInfo PRI, int TeamNum)
{
    local string BodySkinName, SkelName, FaceSkinName;
    local Material NewBodySkin, NewFaceSkin, TeamFaceSkin;
    local Class<xPawnGibGroup> GibGroupClass;
    local Mesh customskel;

    // End:0x2F
    if((int(Level.NetMode) != int(NM_DedicatedServer)) && Class'UnrealGame.DeathMatch'.default.bForceDefaultCharacter)
    {
        return;
    }
    DynamicLoadObject(Rec.MeshName, Class'Engine.Mesh');
    // End:0x90
    if((int(Level.NetMode) != int(NM_DedicatedServer)) && Rec.Skeleton != "")
    {
        customskel = Mesh(DynamicLoadObject(Rec.Skeleton, Class'Engine.Mesh'));
    }
    // End:0x102
    if(Rec.Sex ~= "Female")
    {
        SkelName = default.FemaleSkeleton;
        // End:0xEF
        if(Level.bLowSoundDetail)
        {
            DynamicLoadObject("WGame.wJuggFemaleSoundGroup", Class'Core.Class');            
        }
        else
        {
            DynamicLoadObject(default.FemaleSoundGroup, Class'Core.Class');
        }        
    }
    else
    {
        SkelName = default.MaleSkeleton;
        // End:0x148
        if(Level.bLowSoundDetail)
        {
            DynamicLoadObject("WGame.wJuggMaleSoundGroup", Class'Core.Class');            
        }
        else
        {
            DynamicLoadObject(default.MaleSoundGroup, Class'Core.Class');
        }
    }
    // End:0x181
    if((customskel == none) && SkelName != "")
    {
        DynamicLoadObject(SkelName, Class'Engine.Mesh');
    }
    NewFaceSkin = Material(DynamicLoadObject(Rec.FaceSkinName, Class'Engine.Material'));
    // End:0x1EB
    if(((TeamNum == 255) && Level.GRI != none) && Level.GRI.bForceTeamSkins)
    {
        TeamNum = default.DMTeam;
    }
    // End:0x399
    if((TeamNum != 255) && (Level.GRI == none) || !Level.GRI.bNoTeamSkins)
    {
        // End:0x2AA
        if(Class'UnrealGame.DMMutator'.default.bBrightSkins && Left(Rec.BodySkinName, 12) ~= "PlayerSkins.")
        {
            BodySkinName = ((("Bright" $ Rec.BodySkinName) $ "_") $ string(TeamNum)) $ "B";
            NewBodySkin = Material(DynamicLoadObject(BodySkinName, Class'Engine.Material', true));
        }
        // End:0x34B
        if(NewBodySkin == none)
        {
            BodySkinName = (Rec.BodySkinName $ "_") $ string(TeamNum);
            NewBodySkin = Material(DynamicLoadObject(BodySkinName, Class'Engine.Material'));
            // End:0x34B
            if(Rec.TeamFace)
            {
                FaceSkinName = (Rec.FaceSkinName $ "_") $ string(TeamNum);
                TeamFaceSkin = Material(DynamicLoadObject(FaceSkinName, Class'Engine.Material'));
                // End:0x34B
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
            NewBodySkin = Material(DynamicLoadObject(Rec.BodySkinName, Class'Engine.Material'));
        }        
    }
    else
    {
        NewBodySkin = Material(DynamicLoadObject(Rec.BodySkinName, Class'Engine.Material'));
    }
    // End:0x418
    if(Rec.BodySkinName ~= "UT2004PlayerSkins.XanMk3V2_Body")
    {
        DynamicLoadObject("UT2004PlayerSkins.XanMk3V2_abdomen", Class'Engine.Material');
    }
    Level.AddPrecacheMaterial(Rec.Portrait);
    GibGroupClass = Class<xPawnGibGroup>(DynamicLoadObject(default.GibGroup, Class'Core.Class'));
    GibGroupClass.static.PrecacheContent(Level);
    //return;    
}

static function int ModifyReceivedDamage(int Damage, Pawn injured, Pawn instigatedBy, Vector HitLocation, Vector Momentum, Class<DamageType> DamageType)
{
    return int(float(Damage) * default.ReceivedDamageScaling);
    //return;    
}

static function int ModifyImpartedDamage(int Damage, Pawn injured, Pawn instigatedBy, Vector HitLocation, Vector Momentum, Class<DamageType> DamageType)
{
    return int(float(Damage) * default.DamageScaling);
    //return;    
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
    //return;    
}

static function string GetRagSkelName(string MeshName)
{
    // End:0x1B
    if(InStr(MeshName, "Female") >= 0)
    {
        return default.FemaleRagSkelName;
    }
    return default.MaleRagSkelName;
    //return;    
}

static function SetTeamSkin(wPawn P, PlayerRecord Rec, int TeamNum)
{
    //return;    
}

static function bool Setup(wPawn P, PlayerRecord Rec)
{
    local Mesh customskel;
    local string SkelName;
    local int TeamNum, i, j;

    // End:0x138
    if(P.bAlreadySetup)
    {
        // End:0x136
        if(int(P.Level.NetMode) == int(NM_Client))
        {
            // End:0x90
            if((P.PlayerReplicationInfo != none) && P.PlayerReplicationInfo.Team != none)
            {
                TeamNum = P.PlayerReplicationInfo.Team.TeamIndex;                
            }
            else
            {
                // End:0x11A
                if(((P.DrivenVehicle != none) && P.DrivenVehicle.PlayerReplicationInfo != none) && P.DrivenVehicle.PlayerReplicationInfo.Team != none)
                {
                    TeamNum = P.DrivenVehicle.PlayerReplicationInfo.Team.TeamIndex;
                }
            }
            // End:0x136
            if(int(P.TeamSkin) == TeamNum)
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
    // End:0x1ED
    if((int(P.Level.NetMode) != int(NM_DedicatedServer)) && Rec.Skeleton != "")
    {
        customskel = Mesh(DynamicLoadObject(Rec.Skeleton, Class'Engine.Mesh'));
    }
    // End:0x28B
    if(P.bIsFemale)
    {
        SkelName = default.FemaleSkeleton;
        // End:0x264
        if(P.Level.bLowSoundDetail)
        {
            P.SoundGroupClass = Class<wPawnSoundGroup>(DynamicLoadObject("WGame.wJuggFemaleSoundGroup", Class'Core.Class'));            
        }
        else
        {
            P.SoundGroupClass = Class<wPawnSoundGroup>(DynamicLoadObject(default.FemaleSoundGroup, Class'Core.Class'));
        }        
    }
    else
    {
        SkelName = default.MaleSkeleton;
        // End:0x2EE
        if(P.Level.bLowSoundDetail)
        {
            P.SoundGroupClass = Class<wPawnSoundGroup>(DynamicLoadObject("WGame.wJuggMaleSoundGroup", Class'Core.Class'));            
        }
        else
        {
            P.SoundGroupClass = Class<wPawnSoundGroup>(DynamicLoadObject(default.MaleSoundGroup, Class'Core.Class'));
        }
    }
    // End:0x334
    if(int(P.Level.NetMode) != int(NM_DedicatedServer))
    {
    }
    P.GibGroupClass = Class<xPawnGibGroup>(DynamicLoadObject(default.GibGroup, Class'Core.Class'));
    i = 0;
    J0x35F:

    // End:0x3EE [Loop If]
    if(i < 16)
    {
        // End:0x3E4
        if(default.TauntAnims[i] != 'None')
        {
            j = P.TauntAnims.Length;
            P.TauntAnims[j] = default.TauntAnims[i];
            P.TauntAnimNames[j] = default.TauntAnimNames[i];
            // End:0x3E4
            if(j == 15)
            {
                // [Explicit Break]
                goto J0x3EE;
            }
        }
        i++;
        // [Loop Continue]
        goto J0x35F;
    }
    J0x3EE:

    return true;
    //return;    
}

static function int GetOffsetForSequence(name Sequence)
{
    local int i;

    i = 0;
    J0x07:

    // End:0x53 [Loop If]
    if(i < 16)
    {
        // End:0x2E
        if(default.TauntAnims[i] == 'None')
        {
            return -1;
        }
        // End:0x49
        if(default.TauntAnims[i] == Sequence)
        {
            return i;
        }
        i++;
        // [Loop Continue]
        goto J0x07;
    }
    return -1;
    //return;    
}

defaultproperties
{
    PawnClassName="WGame.wPawn"
    SpeciesName="??"
    TauntAnims[0]="gesture_point"
    TauntAnims[1]="gesture_beckon"
    TauntAnims[2]="gesture_halt"
    TauntAnims[3]="gesture_cheer"
    TauntAnims[4]="PThrust"
    TauntAnims[5]="AssSmack"
    TauntAnims[6]="ThroatCut"
    TauntAnims[7]="Specific_1"
    TauntAnims[8]="Gesture_Taunt01"
    TauntAnims[9]="Idle_Character01"
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
    AirControl=1.0000000
    GroundSpeed=1.0000000
    WaterSpeed=1.0000000
    JumpZ=1.0000000
    ReceivedDamageScaling=1.0000000
    DamageScaling=1.0000000
    AccelRate=1.0000000
    DodgeSpeedFactor=1.0000000
    DodgeSpeedZ=1.0000000
}