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
    fb = Class'Engine.BTCustomDrawHK'.static.MakeFloatBox(799.0000000, 380.0000000, 982.0000000, 416.0000000);
    ButtonRoomInfo = NewButtonComponent(fb);
    ButtonRoomInfo.SetWaitRoomInfoBtnImage();
    ButtonRoomInfo.SetDefaultFontColor();
    ButtonRoomInfo.SetFontSizeAll(13);
    ButtonRoomInfo.Caption = strButtonRoomInfo[1];
    MapImage = Class'Engine.BTCustomDrawHK'.static.MakeImage(256, 151, 28, none);
    strBotModeUserTeam[0] = Class'GUIWarfareControls_Decompressed.BTWindowRoomInfoHK'.default.strLabelBot_UserTeam[0];
    SetData("DownTown", "dm-downtown", "suddendeath", false, "15:00", "1300pt", "12 vs 12", 0, 0, 0, 0);
    //return;    
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
    // End:0x4F
    if(bHardCore)
    {
        HardCore = "on";        
    }
    else
    {
        HardCore = "off";
    }
    GameTime = sGameTime;
    TargetScore = sTargetScore;
    UserCount = sUserCount;
    mInfo = PlayerOwner().Level.GetMatchMaker().MapSettings.GetMapInfo(sMapImageName);
    MapImage.Image = Material(DynamicLoadObject(mInfo.ResourceMapImage, Class'Engine.Material'));
    i = 0;
    J0xDF:

    // End:0x15B [Loop If]
    if(i < 3)
    {
        // End:0x10C
        if(mInfo.ResourceSupplyImages[i] == "")
        {
            // [Explicit Break]
            goto J0x15B;
            // [Explicit Continue]
            goto J0x151;
        }
        ImageSupply[i] = Class'Engine.BTCustomDrawHK'.static.MakeImage(24, 24, 2, Material(DynamicLoadObject(mInfo.ResourceSupplyImages[i], Class'Engine.Material')));
        J0x151:

        i++;
        // [Loop Continue]
        goto J0xDF;
    }
    J0x15B:

    i = 3;
    J0x163:

    // End:0x18B [Loop If]
    if(i < 3)
    {
        ImageSupply[i].Image = none;
        i++;
        // [Loop Continue]
        goto J0x163;
    }
    self.WeaponLimit = WeaponLimit;
    strBotModeUserTeam[1] = Class'GUIWarfareControls_Decompressed.BTWindowRoomInfoHK'.default.strLabelBot_UserTeam[BotUserTeam + 1];
    //return;    
}

function ChageRoomInfoButton(bool bOwner)
{
    // End:0x22
    if(bOwner)
    {
        ButtonRoomInfo.Caption = strButtonRoomInfo[0];        
    }
    else
    {
        ButtonRoomInfo.Caption = strButtonRoomInfo[1];
    }
    //return;    
}

function Internal_OnRender(Canvas C)
{
    local float W, HT, Pad;
    local FloatBox fb;
    local string wlStr;

    C.Style = 5;
    C.DrawColor = WhiteColor;
    Class'Engine.BTCustomDrawHK'.static.DrawImage(C, MapImage, ClientBounds[0] - float(7), ClientBounds[1] + float(36), ClientBounds[2] + float(10), ClientBounds[1] + float(191));
    C.DrawColor.R = byte(255);
    C.DrawColor.G = 192;
    C.DrawColor.B = 0;
    Class'Engine.BTCustomDrawHK'.static.DrawString(C, MapName, 3, 9.0000000, 774.0000000, 132.0000000, 903.0000000, 146.0000000);
    Class'Engine.BTCustomDrawHK'.static.DrawImage(C, ImageSupply[0], 992.0000000, 127.0000000, 1016.0000000, 151.0000000);
    Class'Engine.BTCustomDrawHK'.static.DrawImage(C, ImageSupply[1], 963.0000000, 127.0000000, 987.0000000, 151.0000000);
    Class'Engine.BTCustomDrawHK'.static.DrawImage(C, ImageSupply[2], 934.0000000, 127.0000000, 958.0000000, 151.0000000);
    Class'Engine.BTCustomDrawHK'.static.DrawString(C, ModeName, 0, 9.0000000, 774.0000000, 101.0000000, 1024.0000000, 115.0000000);
    Pad = 5.0000000;
    fb = Class'Engine.BTCustomDrawHK'.static.MakeFloatBox(ClientBounds[0] + float(2), ClientBounds[1] + float(232), ClientBounds[2] - float(2), ClientBounds[3] - float(42));
    W = (fb.X2 - fb.X1) / float(4);
    HT = (fb.Y2 - fb.Y1) / float(4);
    Class'Engine.BTCustomDrawHK'.static.DrawString(C, strHardCore, 3, 9.0000000, 774.0000000, 293.0000000, 841.0000000, 306.0000000);
    Class'Engine.BTCustomDrawHK'.static.DrawString(C, HardCore, 3, 9.0000000, 848.0000000, 293.0000000, 1024.0000000, 306.0000000);
    Class'Engine.BTCustomDrawHK'.static.DrawString(C, strGameTime, 3, 9.0000000, 774.0000000, 337.0000000, 841.0000000, 350.0000000);
    Class'Engine.BTCustomDrawHK'.static.DrawString(C, GameTime, 3, 9.0000000, 848.0000000, 337.0000000, 1024.0000000, 350.0000000);
    Class'Engine.BTCustomDrawHK'.static.DrawString(C, strUserCount, 3, 9.0000000, 774.0000000, 315.0000000, 841.0000000, 328.0000000);
    Class'Engine.BTCustomDrawHK'.static.DrawString(C, UserCount, 3, 9.0000000, 848.0000000, 315.0000000, 1024.0000000, 328.0000000);
    Class'Engine.BTCustomDrawHK'.static.DrawString(C, strTargetScore, 3, 9.0000000, 774.0000000, 357.0000000, 841.0000000, 372.0000000);
    C.DrawColor.R = byte(255);
    C.DrawColor.G = 192;
    C.DrawColor.B = 0;
    Class'Engine.BTCustomDrawHK'.static.DrawString(C, TargetScore, 3, 9.0000000, 848.0000000, 357.0000000, 841.0000000, 372.0000000);
    // End:0x667
    if(Class'Engine.wGameSettings'.static.IsBotModeIndex(ModeNum))
    {
        Class'Engine.BTCustomDrawHK'.static.DrawImage(C, Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.WaitRoom_RoomInof_SubBG, 766.0000000, 250.0000000, 1020.0000000, 273.0000000);
        Class'Engine.BTCustomDrawHK'.static.DrawString(C, strDifficult[0], 3, 9.0000000, fb.X1 + Pad, ((ClientBounds[1] + float(205)) - float(32)) - float(15), fb.X1 + (W * float(2)), (ClientBounds[1] + float(205)) - float(15));
        Class'Engine.BTCustomDrawHK'.static.DrawString(C, strDifficult[Diffcult], 3, 9.0000000, fb.X1 + W, ((ClientBounds[1] + float(205)) - float(32)) - float(15), fb.X1 + (W * float(3)), (ClientBounds[1] + float(205)) - float(15));
        Class'Engine.BTCustomDrawHK'.static.DrawString(C, strBotModeUserTeam[0], 3, 9.0000000, (fb.X1 + (W * float(2))) + Pad, ((ClientBounds[1] + float(205)) - float(32)) - float(15), fb.X1 + (W * float(4)), (ClientBounds[1] + float(205)) - float(15));
        Class'Engine.BTCustomDrawHK'.static.DrawString(C, strBotModeUserTeam[1], 3, 9.0000000, fb.X1 + (W * float(3)), ((ClientBounds[1] + float(205)) - float(32)) - float(15), fb.X1 + (W * float(4)), (ClientBounds[1] + float(205)) - float(15));
    }
    // End:0x7AA
    if(WeaponLimit != 0)
    {
        wlStr = Class'Engine.wGameSettings'.static.GetWeaponRestrictionByIndex(WeaponLimit);
        Class'Engine.BTCustomDrawHK'.static.DrawImage(C, Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.WaitRoom_RoomInof_SubBG, 766.0000000, 250.0000000, 1020.0000000, 273.0000000);
        Class'Engine.BTCustomDrawHK'.static.DrawString(C, strWeaponLimit, 3, 9.0000000, fb.X1 + Pad, ((ClientBounds[1] + float(205)) - float(32)) - float(15), fb.X1 + (W * float(2)), (ClientBounds[1] + float(205)) - float(15));
        Class'Engine.BTCustomDrawHK'.static.DrawString(C, wlStr, 3, 9.0000000, fb.X1 + W, ((ClientBounds[1] + float(205)) - float(32)) - float(15), fb.X1 + (W * float(3)), (ClientBounds[1] + float(205)) - float(15));
    }
    //return;    
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
    OnRender=BTTPRoomInfoHK.Internal_OnRender
}