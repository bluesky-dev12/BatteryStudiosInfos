class LocalMessage extends Info
    notplaceable
    hidecategories(Movement,Collision,Lighting,LightColor,Karma,Force);

enum EStackMode
{
    SM_None,                        // 0
    SM_Up,                          // 1
    SM_Down                         // 2
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
var(Message) Class<LocalMessage> ChildMessage;
var(Message) Color DrawColor;
var(Message) Object.EDrawPivot DrawPivot;
var(Message) LocalMessage.EStackMode StackMode;
var(Message) float PosX;
var(Message) float PosY;
var(Message) int FontSize;

static function RenderComplexMessage(Canvas Canvas, out float XL, out float YL, optional string MessageString, optional int Switch, optional PlayerReplicationInfo RelatedPRI_1, optional PlayerReplicationInfo RelatedPRI_2, optional Object OptionalObject)
{
    //return;    
}

static function string GetRelatedString(optional int Switch, optional PlayerReplicationInfo RelatedPRI_1, optional PlayerReplicationInfo RelatedPRI_2, optional Object OptionalObject)
{
    return GetString(Switch, RelatedPRI_1, RelatedPRI_2, OptionalObject);
    //return;    
}

static function string GetString(optional int Switch, optional PlayerReplicationInfo RelatedPRI_1, optional PlayerReplicationInfo RelatedPRI_2, optional Object OptionalObject)
{
    // End:0x34
    if(Class<Actor>(OptionalObject) != none)
    {
        return Class<Actor>(OptionalObject).static.GetLocalString(Switch, RelatedPRI_1, RelatedPRI_2);
    }
    return "";
    //return;    
}

static function string AssembleString(HUD myHUD, optional int Switch, optional PlayerReplicationInfo RelatedPRI_1, optional string MessageString)
{
    return "";
    //return;    
}

static function ClientReceive(PlayerController P, optional int Switch, optional PlayerReplicationInfo RelatedPRI_1, optional PlayerReplicationInfo RelatedPRI_2, optional Object OptionalObject)
{
    // End:0x69
    if((P.myHUD != none) && GotoHud(P, Switch, RelatedPRI_1, RelatedPRI_2, OptionalObject))
    {
        P.myHUD.LocalizedMessage(default.Class, Switch, RelatedPRI_1, RelatedPRI_2, OptionalObject);
    }
    // End:0xB7
    if(P.DemoViewer != none)
    {
        P.DemoViewer.myHUD.LocalizedMessage(default.Class, Switch, RelatedPRI_1, RelatedPRI_2, OptionalObject);
    }
    // End:0x151
    if(((IsConsoleMessage(Switch)) && P.Player != none) && P.Player.Console != none)
    {
        P.Player.InteractionMaster.Process_Message(GetString(Switch, RelatedPRI_1, RelatedPRI_2, OptionalObject), 6.0000000, P.Player.LocalInteractions);
    }
    // End:0x1DA
    if(GotoBTConsole(P, Switch, RelatedPRI_1, RelatedPRI_2, OptionalObject))
    {
        P.Player.Console.AddMessageItem(P.Player.Console.ConstructMessageItem(GetString(Switch, RelatedPRI_1, RelatedPRI_2, OptionalObject), GetConsoleMessageType(Switch)));
    }
    //return;    
}

static function ClientReceiveEx(PlayerController P, optional int Switch, optional PlayerReplicationInfo RelatedPRI_1, optional PlayerReplicationInfo RelatedPRI_2, optional Object OptionalObject, optional int iReserve)
{
    // End:0x6F
    if((P.myHUD != none) && GotoHud(P, Switch, RelatedPRI_1, RelatedPRI_2, OptionalObject))
    {
        P.myHUD.LocalizedMessageEx(default.Class, Switch, RelatedPRI_1, RelatedPRI_2, OptionalObject,, iReserve);
    }
    // End:0xBD
    if(P.DemoViewer != none)
    {
        P.DemoViewer.myHUD.LocalizedMessageEx(default.Class, Switch, RelatedPRI_1, RelatedPRI_2, OptionalObject);
    }
    // End:0x157
    if(((IsConsoleMessage(Switch)) && P.Player != none) && P.Player.Console != none)
    {
        P.Player.InteractionMaster.Process_Message(GetString(Switch, RelatedPRI_1, RelatedPRI_2, OptionalObject), 6.0000000, P.Player.LocalInteractions);
    }
    // End:0x1E0
    if(GotoBTConsole(P, Switch, RelatedPRI_1, RelatedPRI_2, OptionalObject))
    {
        P.Player.Console.AddMessageItem(P.Player.Console.ConstructMessageItem(GetString(Switch, RelatedPRI_1, RelatedPRI_2, OptionalObject), GetConsoleMessageType(Switch)));
    }
    //return;    
}

static function RemoveLocalizedMessage(PlayerController P, optional int Switch, optional PlayerReplicationInfo RelatedPRI_1, optional PlayerReplicationInfo RelatedPRI_2, optional Object OptionalObject)
{
    // End:0x69
    if((P.myHUD != none) && GotoHud(P, Switch, RelatedPRI_1, RelatedPRI_2, OptionalObject))
    {
        P.myHUD.RemoveLocalizedMessage(default.Class, Switch, RelatedPRI_1, RelatedPRI_2, OptionalObject);
    }
    //return;    
}

static function bool GotoHud(PlayerController P, optional int Switch, optional PlayerReplicationInfo RelatedPRI_1, optional PlayerReplicationInfo RelatedPRI_2, optional Object OptionalObject)
{
    return true;
    //return;    
}

static function bool GotoBTConsole(PlayerController P, optional int Switch, optional PlayerReplicationInfo RelatedPRI_1, optional PlayerReplicationInfo RelatedPRI_2, optional Object OptionalObject)
{
    return false;
    //return;    
}

static function Color GetConsoleColor(PlayerReplicationInfo RelatedPRI_1)
{
    return default.DrawColor;
    //return;    
}

static function Color GetColor(optional int Switch, optional PlayerReplicationInfo RelatedPRI_1, optional PlayerReplicationInfo RelatedPRI_2)
{
    switch(Switch)
    {
        // End:0x30
        case Class'Engine_Decompressed.wMessage_Game_ImpSystem'.default.Code_EnableInstallSentryGun:
            return Class'Engine_Decompressed.Canvas'.static.MakeColor(0, byte(255), 0);
        // End:0x59
        case Class'Engine_Decompressed.wMessage_Game_ImpSystem'.default.Code_DisableInstallSentryGun:
            return Class'Engine_Decompressed.Canvas'.static.MakeColor(byte(255), 0, 0);
        // End:0xFFFF
        default:
            return default.DrawColor;
            break;
    }
    //return;    
}

static function GetPos(int Switch, out Object.EDrawPivot OutDrawPivot, out LocalMessage.EStackMode OutStackMode, out float OutPosX, out float OutPosY)
{
    OutDrawPivot = default.DrawPivot;
    OutStackMode = default.StackMode;
    OutPosX = default.PosX;
    OutPosY = default.PosY;
    //return;    
}

static function int GetFontSize(int Switch, PlayerReplicationInfo RelatedPRI1, PlayerReplicationInfo RelatedPRI2, PlayerReplicationInfo LocalPlayer)
{
    return default.FontSize;
    //return;    
}

static function float GetLifeTime(int Switch)
{
    return float(default.Lifetime);
    //return;    
}

static function bool IsConsoleMessage(int Switch)
{
    return default.bIsConsoleMessage;
    //return;    
}

static function Object.MessageType GetConsoleMessageType(int Switch)
{
    return 6;
    //return;    
}

defaultproperties
{
    bIsSpecial=true
    bIsConsoleMessage=true
    Lifetime=3
    DrawColor=(R=255,G=255,B=255,A=255)
    DrawPivot=8
    PosX=0.5000000
    PosY=0.8300000
}