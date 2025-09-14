class wMessage_Game_Mode extends wMessage_Game
    notplaceable
    hidecategories(Movement,Collision,Lighting,LightColor,Karma,Force);

var int Code_GameMode_TD;
var int Code_GameMode_DOM;
var int Code_GameMode_FFA;
var int Code_GameMode_SDAttack;
var int Code_GameMode_SDDefense;
var int Code_GameMode_SBT;
var int Code_GameMode_SBTGetBomb;
var int Code_GameMode_DOA;
var localized string strGameModeTD;
var localized string strGameModeDOM;
var localized string strGameModeFFA;
var localized string strGameModeSDAttack;
var localized string strGameModeSDDefense;
var localized string strGameModeSBT;
var localized string strGameModeSBTGetBomb;
var localized string strGameModeSDAttackObjectivePlanted;
var localized string strGameModeSDDefenseObjectivePlanted;
var localized string strGameModeDOA;

static function bool GotoHud(PlayerController P, optional int Switch, optional PlayerReplicationInfo RelatedPRI_1, optional PlayerReplicationInfo RelatedPRI_2, optional Object OptionalObject)
{
    return false;
    //return;    
}

static function bool GotoBTConsole(PlayerController P, optional int Switch, optional PlayerReplicationInfo RelatedPRI_1, optional PlayerReplicationInfo RelatedPRI_2, optional Object OptionalObject)
{
    return false;
    //return;    
}

static function string GetString(optional int Switch, optional PlayerReplicationInfo RelatedPRI_1, optional PlayerReplicationInfo RelatedPRI_2, optional Object OptionalObject)
{
    switch(Switch)
    {
        // End:0x15
        case default.Code_GameMode_TD:
            return default.strGameModeTD;
        // End:0x23
        case default.Code_GameMode_DOM:
            return default.strGameModeDOM;
        // End:0x31
        case default.Code_GameMode_FFA:
            return default.strGameModeFFA;
        // End:0x3F
        case default.Code_GameMode_SDAttack:
            return default.strGameModeSDAttack;
        // End:0x4D
        case default.Code_GameMode_SDDefense:
            return default.strGameModeSDDefense;
        // End:0x5B
        case default.Code_GameMode_SBT:
            return default.strGameModeSBT;
        // End:0x69
        case default.Code_GameMode_SBTGetBomb:
            return default.strGameModeSBTGetBomb;
        // End:0x77
        case default.Code_SDAllyBombPlanted:
            return default.strGameModeSDAttackObjectivePlanted;
        // End:0x85
        case default.Code_SDEnemyBombPlanted:
            return default.strGameModeSDDefenseObjectivePlanted;
        // End:0x93
        case default.Code_SBTAllyBombPlanted:
            return default.strGameModeSDAttackObjectivePlanted;
        // End:0xA1
        case default.Code_SBTEnemyBombPlanted:
            return default.strGameModeSDDefenseObjectivePlanted;
        // End:0xAF
        case default.Code_GameMode_DOA:
            return default.strGameModeDOA;
        // End:0xFFFF
        default:
            //return;
            break;
    }    
}

static simulated function ClientReceive(PlayerController P, optional int Switch, optional PlayerReplicationInfo RelatedPRI_1, optional PlayerReplicationInfo RelatedPRI_2, optional Object OptionalObject)
{
    switch(Switch)
    {
        // End:0xFFFF
        default:
            //return;
            break;
    }    
}

defaultproperties
{
    Code_GameMode_TD=10001
    Code_GameMode_DOM=10002
    Code_GameMode_FFA=10003
    Code_GameMode_SDAttack=10004
    Code_GameMode_SDDefense=10005
    Code_GameMode_SBT=10006
    Code_GameMode_DOA=10007
    strGameModeTD="Destroy the enemy!"
    strGameModeDOM="Capture the flag to increase your team score!"
    strGameModeFFA="Kill your enemies!"
    strGameModeSDAttack="Destroy the target!"
    strGameModeSDDefense="Defend the target!"
    strGameModeSBT="Assist the soldier with the bomb and destroy that target!"
    strGameModeSBTGetBomb="Secure the bomb!"
    strGameModeSDAttackObjectivePlanted="Protect the bomb until it detonates!"
    strGameModeSDDefenseObjectivePlanted="Defuse the target!"
    Lifetime=0
    DrawColor=(R=255,G=153,B=0,A=255)
    DrawPivot=0
    StackMode=0
    PosY=0.0700000
    FontSize=17
}