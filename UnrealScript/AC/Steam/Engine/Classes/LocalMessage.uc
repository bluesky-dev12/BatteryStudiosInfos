/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path Engine\Classes\LocalMessage.uc
 * Package Imports:
 *	Engine
 *	Core
 *
 * Stats:
 *	Enums:1
 *	Properties:16
 *	Functions:13
 *
 *******************************************************************************/
class LocalMessage extends Info
    dependson(InteractionMaster)
    dependson(Console)
    hidecategories(Movement,Collision,Lighting,LightColor,Karma,Force)
    notplaceable;

enum EStackMode
{
    SM_None,
    SM_Up,
    SM_Down
};

var(Message) bool bComplexString;
var(Message) bool bIsSpecial;
var(Message) bool bIsUnique;
var(Message) bool bIsPartiallyUnique;
var(Message) bool bIsConsoleMessage;
var(Message) bool bFadeMessage;
var(Message) bool bBeep;
var(Message) int Lifetime;
var(Message) bool bDrawWithTexture;
var(Message) class<LocalMessage> ChildMessage;
var(Message) Color DrawColor;
var(Message) Core.Object.EDrawPivot DrawPivot;
var(Message) LocalMessage.EStackMode StackMode;
var(Message) float PosX;
var(Message) float PosY;
var(Message) int FontSize;

static function RenderComplexMessage(Canvas Canvas, out float XL, out float YL, optional string MessageString, optional int Switch, optional PlayerReplicationInfo RelatedPRI_1, optional PlayerReplicationInfo RelatedPRI_2, optional Object OptionalObject);
static function string GetRelatedString(optional int Switch, optional PlayerReplicationInfo RelatedPRI_1, optional PlayerReplicationInfo RelatedPRI_2, optional Object OptionalObject)
{
    return GetString(Switch, RelatedPRI_1, RelatedPRI_2, OptionalObject);
}

static function string GetString(optional int Switch, optional PlayerReplicationInfo RelatedPRI_1, optional PlayerReplicationInfo RelatedPRI_2, optional Object OptionalObject)
{
    // End:0x34
    if(class<Actor>(OptionalObject) != none)
    {
        return class<Actor>(OptionalObject).static.GetLocalString(Switch, RelatedPRI_1, RelatedPRI_2);
    }
    return "";
}

static function string AssembleString(HUD myHUD, optional int Switch, optional PlayerReplicationInfo RelatedPRI_1, optional string MessageString)
{
    return "";
}

static function ClientReceive(PlayerController P, optional int Switch, optional PlayerReplicationInfo RelatedPRI_1, optional PlayerReplicationInfo RelatedPRI_2, optional Object OptionalObject)
{
    // End:0x69
    if(P.myHUD != none && GotoHud(P, Switch, RelatedPRI_1, RelatedPRI_2, OptionalObject))
    {
        P.myHUD.LocalizedMessage(default.Class, Switch, RelatedPRI_1, RelatedPRI_2, OptionalObject);
    }
    // End:0xb7
    if(P.DemoViewer != none)
    {
        P.DemoViewer.myHUD.LocalizedMessage(default.Class, Switch, RelatedPRI_1, RelatedPRI_2, OptionalObject);
    }
    // End:0x151
    if(IsConsoleMessage(Switch) && P.Player != none && P.Player.Console != none)
    {
        P.Player.InteractionMaster.Process_Message(GetString(Switch, RelatedPRI_1, RelatedPRI_2, OptionalObject), 6.0, P.Player.LocalInteractions);
    }
    // End:0x1d1
    if(GotoBTConsole(P, Switch, RelatedPRI_1, RelatedPRI_2, OptionalObject))
    {
        P.Player.Console.AddMessageItem(P.Player.Console.ConstructMessageItem(GetString(Switch, RelatedPRI_1, RelatedPRI_2, OptionalObject), 6));
    }
}

static function bool GotoHud(PlayerController P, optional int Switch, optional PlayerReplicationInfo RelatedPRI_1, optional PlayerReplicationInfo RelatedPRI_2, optional Object OptionalObject)
{
    return true;
}

static function bool GotoBTConsole(PlayerController P, optional int Switch, optional PlayerReplicationInfo RelatedPRI_1, optional PlayerReplicationInfo RelatedPRI_2, optional Object OptionalObject)
{
    return false;
}

static function Color GetConsoleColor(PlayerReplicationInfo RelatedPRI_1)
{
    return default.DrawColor;
}

static function Color GetColor(optional int Switch, optional PlayerReplicationInfo RelatedPRI_1, optional PlayerReplicationInfo RelatedPRI_2)
{
    return default.DrawColor;
}

static function GetPos(int Switch, out Core.Object.EDrawPivot OutDrawPivot, out LocalMessage.EStackMode OutStackMode, out float OutPosX, out float OutPosY)
{
    OutDrawPivot = default.DrawPivot;
    OutStackMode = default.StackMode;
    OutPosX = default.PosX;
    OutPosY = default.PosY;
}

static function int GetFontSize(int Switch, PlayerReplicationInfo RelatedPRI1, PlayerReplicationInfo RelatedPRI2, PlayerReplicationInfo LocalPlayer)
{
    return default.FontSize;
}

static function float GetLifeTime(int Switch)
{
    return float(default.Lifetime);
}

static function bool IsConsoleMessage(int Switch)
{
    return default.bIsConsoleMessage;
}

defaultproperties
{
    bIsSpecial=true
    bIsConsoleMessage=true
    Lifetime=3
    DrawColor=(R=255,G=255,B=255,A=255)
    DrawPivot=8
    PosX=0.50
    PosY=0.830
}