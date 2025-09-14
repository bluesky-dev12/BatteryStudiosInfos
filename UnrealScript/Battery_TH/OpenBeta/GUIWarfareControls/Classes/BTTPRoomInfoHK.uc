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
    fb = Class'Engine.BTCustomDrawHK'.static.MakeFloatBox(AWinPos.X1 + float(6), AWinPos.Y2 - float(37), AWinPos.X2 - float(6), AWinPos.Y2 - float(6));
    ButtonRoomInfo = NewButtonComponent(fb);
    ButtonRoomInfo.SetDefaultButtonImage();
    ButtonRoomInfo.SetDefaultFontColor();
    ButtonRoomInfo.SetFontSizeAll(13);
    ButtonRoomInfo.Caption = strButtonRoomInfo[1];
    MapImage = Class'Engine.BTCustomDrawHK'.static.MakeImage(239, 178, 28, none);
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
    Class'Engine.BTCustomDrawHK'.static.DrawImage(C, Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.panel_1, ClientBounds[0], ClientBounds[1], ClientBounds[2], ClientBounds[3]);
    Class'Engine.BTCustomDrawHK'.static.DrawImage(C, Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.img_input_s, ClientBounds[0] + float(2), ClientBounds[1] + float(2), ClientBounds[2] - float(2), ClientBounds[1] + float(25));
    Class'Engine.BTCustomDrawHK'.static.DrawString(C, MapName, 4, 11.0000000, ClientBounds[0] + float(2), ClientBounds[1] + float(2), ClientBounds[2] - float(2), ClientBounds[1] + float(25));
    Class'Engine.BTCustomDrawHK'.static.DrawImage(C, MapImage, ClientBounds[0] + float(2), ClientBounds[1] + float(25), ClientBounds[2] - float(2), ClientBounds[1] + float(205));
    Class'Engine.BTCustomDrawHK'.static.DrawImage(C, ImageSupply[0], ((ClientBounds[2] - float(2)) - float(5)) - float(24), (ClientBounds[1] + float(25)) + float(5), (ClientBounds[2] - float(2)) - float(5), ((ClientBounds[1] + float(25)) + float(5)) + float(24));
    Class'Engine.BTCustomDrawHK'.static.DrawImage(C, ImageSupply[1], (((ClientBounds[2] - float(2)) - float(5)) - float(24 * 2)) - float(5), (ClientBounds[1] + float(25)) + float(5), (((ClientBounds[2] - float(2)) - float(5)) - float(24)) - float(5), ((ClientBounds[1] + float(25)) + float(5)) + float(24));
    Class'Engine.BTCustomDrawHK'.static.DrawImage(C, ImageSupply[2], ((((ClientBounds[2] - float(2)) - float(5)) - float(24 * 3)) - float(5)) - float(5), (ClientBounds[1] + float(25)) + float(5), ((((ClientBounds[2] - float(2)) - float(5)) - float(24 * 2)) - float(5)) - float(5), ((ClientBounds[1] + float(25)) + float(5)) + float(24));
    Class'Engine.BTCustomDrawHK'.static.DrawImage(C, Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.img_input_s, ClientBounds[0] + float(2), ClientBounds[1] + float(205), ClientBounds[2] - float(2), ClientBounds[1] + float(230));
    Class'Engine.BTCustomDrawHK'.static.DrawString(C, ModeName, 4, 10.0000000, ClientBounds[0] + float(2), ClientBounds[1] + float(205), ClientBounds[2] - float(2), ClientBounds[1] + float(230));
    Class'Engine.BTCustomDrawHK'.static.DrawImage(C, Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.panel_2, ClientBounds[0] + float(2), ClientBounds[1] + float(232), ClientBounds[2] - float(2), ClientBounds[3] - float(42));
    Pad = 5.0000000;
    fb = Class'Engine.BTCustomDrawHK'.static.MakeFloatBox(ClientBounds[0] + float(2), ClientBounds[1] + float(232), ClientBounds[2] - float(2), ClientBounds[3] - float(42));
    W = (fb.X2 - fb.X1) / float(4);
    HT = (fb.Y2 - fb.Y1) / float(4);
    Class'Engine.BTCustomDrawHK'.static.DrawString(C, strHardCore, 3, 9.0000000, fb.X1 + Pad, fb.Y1, fb.X1 + (W * float(2)), fb.Y1 + (HT * float(2)));
    Class'Engine.BTCustomDrawHK'.static.DrawString(C, HardCore, 3, 9.0000000, fb.X1 + W, fb.Y1, fb.X1 + (W * float(3)), fb.Y1 + (HT * float(2)));
    Class'Engine.BTCustomDrawHK'.static.DrawString(C, strGameTime, 3, 9.0000000, fb.X1 + Pad, fb.Y1 + (HT * float(2)), fb.X1 + (W * float(2)), fb.Y1 + (HT * float(4)));
    Class'Engine.BTCustomDrawHK'.static.DrawString(C, GameTime, 3, 9.0000000, fb.X1 + W, fb.Y1 + (HT * float(2)), fb.X1 + (W * float(3)), fb.Y1 + (HT * float(4)));
    Class'Engine.BTCustomDrawHK'.static.DrawString(C, strUserCount, 3, 9.0000000, (fb.X1 + (W * float(2))) + Pad, fb.Y1, fb.X1 + (W * float(4)), fb.Y1 + (HT * float(2)));
    Class'Engine.BTCustomDrawHK'.static.DrawString(C, UserCount, 3, 9.0000000, fb.X1 + (W * float(3)), fb.Y1, fb.X1 + (W * float(4)), fb.Y1 + (HT * float(2)));
    Class'Engine.BTCustomDrawHK'.static.DrawString(C, strTargetScore, 3, 9.0000000, (fb.X1 + (W * float(2))) + Pad, fb.Y1 + (HT * float(2)), fb.X1 + (W * float(4)), fb.Y1 + (HT * float(4)));
    Class'Engine.BTCustomDrawHK'.static.DrawString(C, TargetScore, 3, 9.0000000, fb.X1 + (W * float(3)), fb.Y1 + (HT * float(2)), fb.X1 + (W * float(4)), fb.Y1 + (HT * float(4)));
    // End:0xA6E
    if(Class'Engine.wGameSettings'.static.IsBotModeIndex(ModeNum))
    {
        Class'Engine.BTCustomDrawHK'.static.DrawImage(C, Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.panel_2, ClientBounds[0] + float(2), (ClientBounds[1] + float(205)) - float(32), ClientBounds[2] - float(2), ClientBounds[1] + float(205));
        Class'Engine.BTCustomDrawHK'.static.DrawString(C, strDifficult[0], 3, 9.0000000, fb.X1 + Pad, (ClientBounds[1] + float(205)) - float(32), fb.X1 + (W * float(2)), ClientBounds[1] + float(205));
        Class'Engine.BTCustomDrawHK'.static.DrawString(C, strDifficult[Diffcult], 3, 9.0000000, fb.X1 + W, (ClientBounds[1] + float(205)) - float(32), fb.X1 + (W * float(3)), ClientBounds[1] + float(205));
        Class'Engine.BTCustomDrawHK'.static.DrawString(C, strBotModeUserTeam[0], 3, 9.0000000, (fb.X1 + (W * float(2))) + Pad, (ClientBounds[1] + float(205)) - float(32), fb.X1 + (W * float(4)), ClientBounds[1] + float(205));
        Class'Engine.BTCustomDrawHK'.static.DrawString(C, strBotModeUserTeam[1], 3, 9.0000000, fb.X1 + (W * float(3)), (ClientBounds[1] + float(205)) - float(32), fb.X1 + (W * float(4)), ClientBounds[1] + float(205));
    }
    // End:0xBC0
    if(WeaponLimit != 0)
    {
        wlStr = Class'Engine.wGameSettings'.static.GetWeaponRestrictionByIndex(WeaponLimit);
        Class'Engine.BTCustomDrawHK'.static.DrawImage(C, Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.panel_2, ClientBounds[0] + float(2), (ClientBounds[1] + float(205)) - float(32), ClientBounds[2] - float(2), ClientBounds[1] + float(205));
        Class'Engine.BTCustomDrawHK'.static.DrawString(C, strWeaponLimit, 3, 9.0000000, fb.X1 + Pad, (ClientBounds[1] + float(205)) - float(32), fb.X1 + (W * float(2)), ClientBounds[1] + float(205));
        Class'Engine.BTCustomDrawHK'.static.DrawString(C, wlStr, 3, 9.0000000, fb.X1 + W, (ClientBounds[1] + float(205)) - float(32), fb.X1 + (W * float(3)), ClientBounds[1] + float(205));
    }
    //return;    
}

defaultproperties
{
    strButtonRoomInfo[0]="?????????????????????????"
    strButtonRoomInfo[1]="????????????????"
    strHardCore="FairPlay"
    strGameTime="????"
    strTargetScore="Point"
    strUserCount="?????"
    strDifficult[0]="?????"
    strDifficult[1]="??????"
    strDifficult[2]="???"
    strDifficult[3]="????"
    strDifficult[4]="???"
    strDifficult[5]="??????"
    strWeaponLimit="sub mode"
    OnRender=BTTPRoomInfoHK.Internal_OnRender
}