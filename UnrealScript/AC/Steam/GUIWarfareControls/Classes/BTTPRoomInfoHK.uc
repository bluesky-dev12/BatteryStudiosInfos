/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path GUIWarfareControls\Classes\BTTPRoomInfoHK.uc
 * Package Imports:
 *	GUIWarfareControls
 *	XInterface
 *	Core
 *
 * Stats:
 *	Properties:21
 *	Functions:4
 *
 *******************************************************************************/
class BTTPRoomInfoHK extends BTTabPanelHK
    editinlinenew
    instanced;

var string MapName;
var int Diffcult;
var int ModeNum;
var int WeaponLimit;
var string ModeName;
var bool bHardCore;
var string HardCore;
var string GameTime;
var string TargetScore;
var string UserCount;
var Image MapImage;
var Image ImageSupply[3];
var localized string strButtonRoomInfo[2];
var localized string strHardCore;
var localized string strGameTime;
var localized string strTargetScore;
var localized string strUserCount;
var localized string strDifficult[6];
var localized string strWeaponLimit;
var string strBotModeUserTeam[2];
var export editinline BTOwnerDrawCaptionButtonHK ButtonRoomInfo;

function InitComponent(GUIController MyController, GUIComponent myOwner)
{
    local FloatBox fb;

    super(GUIPanel).InitComponent(MyController, myOwner);
    fb = class'BTCustomDrawHK'.static.MakeFloatBox(799.0, 380.0, 982.0, 416.0);
    ButtonRoomInfo = NewButtonComponent(fb);
    ButtonRoomInfo.SetWaitRoomInfoBtnImage();
    ButtonRoomInfo.SetDefaultFontColor();
    ButtonRoomInfo.SetFontSizeAll(13);
    ButtonRoomInfo.Caption = strButtonRoomInfo[1];
    MapImage = class'BTCustomDrawHK'.static.MakeImage(256, 151, 28, none);
    strBotModeUserTeam[0] = class'BTWindowRoomInfoHK'.default.strLabelBot_UserTeam[0];
    SetData("DownTown", "dm-downtown", "suddendeath", false, "15:00", "1300pt", "12 vs 12", 0, 0, 0, 0);
}

function SetData(string sMapName, string sMapImageName, string sModeName, bool sbHardCore, string sGameTime, string sTargetScore, string sUserCount, int iModeNum, int iDiffcult, int WeaponLimit, int BotUserTeam)
{
    local int i;
    local wMapInfo mInfo;

    ModeNum = iModeNum;
    Diffcult = iDiffcult;
    MapName = sMapName;
    ModeName = sModeName;
    bHardCore = sbHardCore;
    // End:0x4f
    if(bHardCore)
    {
        HardCore = "on";
    }
    // End:0x5a
    else
    {
        HardCore = "off";
    }
    GameTime = sGameTime;
    TargetScore = sTargetScore;
    UserCount = sUserCount;
    mInfo = PlayerOwner().Level.GetMatchMaker().MapSettings.GetMapInfo(sMapImageName);
    MapImage.Image = Material(DynamicLoadObject(mInfo.ResourceMapImage, class'Material'));
    i = 0;
    J0xdf:
    // End:0x15b [While If]
    if(i < 3)
    {
        // End:0x10c
        if(mInfo.ResourceSupplyImages[i] == "")
        {
            // This is an implied JumpToken;
            goto J0x15b;
        }
        // End:0x151
        else
        {
            ImageSupply[i] = class'BTCustomDrawHK'.static.MakeImage(24, 24, 2, Material(DynamicLoadObject(mInfo.ResourceSupplyImages[i], class'Material')));
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0xdf;
    }
    J0x15b:
    i = 3;
    J0x163:
    // End:0x18b [While If]
    if(i < 3)
    {
        ImageSupply[i].Image = none;
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x163;
    }
    self.WeaponLimit = WeaponLimit;
    strBotModeUserTeam[1] = class'BTWindowRoomInfoHK'.default.strLabelBot_UserTeam[BotUserTeam + 1];
}

function ChageRoomInfoButton(bool bOwner)
{
    // End:0x22
    if(bOwner)
    {
        ButtonRoomInfo.Caption = strButtonRoomInfo[0];
    }
    // End:0x38
    else
    {
        ButtonRoomInfo.Caption = strButtonRoomInfo[1];
    }
}

function Internal_OnRender(Canvas C)
{
    local float W, HT, Pad;
    local FloatBox fb;
    local string wlStr;

    C.Style = 5;
    C.DrawColor = WhiteColor;
    class'BTCustomDrawHK'.static.DrawImage(C, MapImage, ClientBounds[0] - float(7), ClientBounds[1] + float(36), ClientBounds[2] + float(10), ClientBounds[1] + float(191));
    C.DrawColor.R = byte(255);
    C.DrawColor.G = 192;
    C.DrawColor.B = 0;
    class'BTCustomDrawHK'.static.DrawString(C, MapName, 3, 9.0, 774.0, 132.0, 903.0, 146.0);
    class'BTCustomDrawHK'.static.DrawImage(C, ImageSupply[0], 992.0, 127.0, 1016.0, 151.0);
    class'BTCustomDrawHK'.static.DrawImage(C, ImageSupply[1], 963.0, 127.0, 987.0, 151.0);
    class'BTCustomDrawHK'.static.DrawImage(C, ImageSupply[2], 934.0, 127.0, 958.0, 151.0);
    class'BTCustomDrawHK'.static.DrawString(C, ModeName, 0, 9.0, 774.0, 101.0, 1024.0, 115.0);
    Pad = 5.0;
    fb = class'BTCustomDrawHK'.static.MakeFloatBox(ClientBounds[0] + float(2), ClientBounds[1] + float(232), ClientBounds[2] - float(2), ClientBounds[3] - float(42));
    W = fb.X2 - fb.X1 / float(4);
    HT = fb.Y2 - fb.Y1 / float(4);
    class'BTCustomDrawHK'.static.DrawString(C, strHardCore, 3, 9.0, 774.0, 293.0, 841.0, 306.0);
    class'BTCustomDrawHK'.static.DrawString(C, HardCore, 3, 9.0, 848.0, 293.0, 1024.0, 306.0);
    class'BTCustomDrawHK'.static.DrawString(C, strGameTime, 3, 9.0, 774.0, 337.0, 841.0, 350.0);
    class'BTCustomDrawHK'.static.DrawString(C, GameTime, 3, 9.0, 848.0, 337.0, 1024.0, 350.0);
    class'BTCustomDrawHK'.static.DrawString(C, strUserCount, 3, 9.0, 774.0, 315.0, 841.0, 328.0);
    class'BTCustomDrawHK'.static.DrawString(C, UserCount, 3, 9.0, 848.0, 315.0, 1024.0, 328.0);
    class'BTCustomDrawHK'.static.DrawString(C, strTargetScore, 3, 9.0, 774.0, 357.0, 841.0, 372.0);
    C.DrawColor.R = byte(255);
    C.DrawColor.G = 192;
    C.DrawColor.B = 0;
    class'BTCustomDrawHK'.static.DrawString(C, TargetScore, 3, 9.0, 848.0, 357.0, 841.0, 372.0);
    // End:0x667
    if(class'wGameSettings'.static.IsBotModeIndex(ModeNum))
    {
        class'BTCustomDrawHK'.static.DrawImage(C, class'BTUIResourcePoolHK'.default.WaitRoom_RoomInof_SubBG, 766.0, 250.0, 1020.0, 273.0);
        class'BTCustomDrawHK'.static.DrawString(C, strDifficult[0], 3, 9.0, fb.X1 + Pad, ClientBounds[1] + float(205) - float(32) - float(15), fb.X1 + W * float(2), ClientBounds[1] + float(205) - float(15));
        class'BTCustomDrawHK'.static.DrawString(C, strDifficult[Diffcult], 3, 9.0, fb.X1 + W, ClientBounds[1] + float(205) - float(32) - float(15), fb.X1 + W * float(3), ClientBounds[1] + float(205) - float(15));
        class'BTCustomDrawHK'.static.DrawString(C, strBotModeUserTeam[0], 3, 9.0, fb.X1 + W * float(2) + Pad, ClientBounds[1] + float(205) - float(32) - float(15), fb.X1 + W * float(4), ClientBounds[1] + float(205) - float(15));
        class'BTCustomDrawHK'.static.DrawString(C, strBotModeUserTeam[1], 3, 9.0, fb.X1 + W * float(3), ClientBounds[1] + float(205) - float(32) - float(15), fb.X1 + W * float(4), ClientBounds[1] + float(205) - float(15));
    }
    // End:0x7aa
    if(WeaponLimit != 0)
    {
        wlStr = class'wGameSettings'.static.GetWeaponRestrictionByIndex(WeaponLimit);
        class'BTCustomDrawHK'.static.DrawImage(C, class'BTUIResourcePoolHK'.default.WaitRoom_RoomInof_SubBG, 766.0, 250.0, 1020.0, 273.0);
        class'BTCustomDrawHK'.static.DrawString(C, strWeaponLimit, 3, 9.0, fb.X1 + Pad, ClientBounds[1] + float(205) - float(32) - float(15), fb.X1 + W * float(2), ClientBounds[1] + float(205) - float(15));
        class'BTCustomDrawHK'.static.DrawString(C, wlStr, 3, 9.0, fb.X1 + W, ClientBounds[1] + float(205) - float(32) - float(15), fb.X1 + W * float(3), ClientBounds[1] + float(205) - float(15));
    }
}

defaultproperties
{
    strButtonRoomInfo[0]="Game Settings"
    strButtonRoomInfo[1]="View Game Settings"
    strHardCore="Balance"
    strGameTime="Time"
    strTargetScore="Score"
    strUserCount="Players"
    strDifficult[0]="Difficulty"
    strDifficult[1]="Very Low"
    strDifficult[2]="Low"
    strDifficult[3]="Normal"
    strDifficult[4]="High"
    strDifficult[5]="Very High"
    strWeaponLimit="Sub-Mode"
    OnRender=Internal_OnRender
}