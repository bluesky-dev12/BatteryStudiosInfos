/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path GUIWarfareControls\Classes\BTWindowCWRoomInfoHK.uc
 * Package Imports:
 *	GUIWarfareControls
 *	GUI2K4
 *	XInterface
 *	Core
 *
 * Stats:
 *	Properties:47
 *	Functions:3
 *
 *******************************************************************************/
class BTWindowCWRoomInfoHK extends BTWindowHK
    editinlinenew
    instanced;

var transient wMatchMaker MatchMaker;
var array<GameModeInfo> GameModeInfos;
var() /*0x00000000-0x80000000*/ databinding editinlinenotify FloatBox fbSeparator[2];
var export editinline BTOwnerDrawImageHK Separator[2];
var FloatBox fbLabelCommonTop[4];
var localized string strLabelCommonTop[4];
var export editinline BTOwnerDrawImageHK LabelCommonTop[4];
var FloatBox fbLabelCommonBottom[6];
var localized string strLabelCommonBottom[6];
var export editinline BTOwnerDrawImageHK LabelCommonBottom[6];
var FloatBox fbLabelAdd[3];
var export editinline BTOwnerDrawImageHK LabelAdd[3];
var FloatBox fbLabelWarning[4];
var localized string strLabelWarning[4];
var export editinline BTOwnerDrawImageHK LabelWarning[4];
var int ComboAdd_Option[4];
var localized string strLabelSwitchSide;
var localized string strLabelBombPossesion;
var localized string strBombForEveryone;
var localized string strBombForOne;
var localized string strLabelChangeAD;
var localized string strLabelChangeRound;
var localized string strClanRule[7];
var FloatBox fbCombo[4];
var export editinline BTComboBoxHK Combo[4];
var FloatBox fbComboAdd[3];
var export editinline BTComboBoxHK ComboAdd[3];
var export editinline BTComboBoxMapHK ComboMap;
var export editinline BTComboBoxHK ComboGameMode;
var export editinline BTComboBoxHK ComboGameTime;
var export editinline BTComboBoxHK ComboWeaponRestriction;
var export editinline BTComboBoxHK ComboUserCount;
var export editinline BTComboBoxHK ComboTargetScore;
var export editinline BTComboBoxHK ComboIsHardCore;
var export editinline BTComboBoxHK ComboSwitchSide;
var export editinline BTComboBoxHK ComboBombPossesion;
var export editinline BTComboBoxHK ComboChangeAD;
var export editinline BTComboBoxHK ComboChangeRound;
var FloatBox fbRadio[6];
var export editinline BTRadioOnOffButtonHK Radio[6];
var export editinline BTRadioOnOffButtonHK RadioTeamDamage;
var export editinline BTRadioOnOffButtonHK RadioFreeCamera;
var export editinline BTRadioOnOffButtonHK RadioTeamBalance;
var export editinline BTRadioOnOffButtonHK RadioKillCam;
var export editinline BTRadioOnOffButtonHK RadioJoinInPlaying;
var export editinline BTRadioOnOffButtonHK RadioVoiceChatting;
var export editinline BTRadioOnOffButtonHK RadioVote;

function InitComponent(GUIController MyController, GUIComponent myOwner)
{
    local int i;

    super.InitComponent(MyController, myOwner);
    MatchMaker = Controller.ViewportOwner.Actor.Level.GetMatchMaker();
    // End:0x85
    if(Controller.ViewportOwner.Actor.Level.GetIsServiceBuild())
    {
        GameModeInfos = class'wGameSettings'.static.GetAllGameModesAtServiceBuild();
    }
    // End:0x9a
    else
    {
        GameModeInfos = class'wGameSettings'.static.GetAllGameModes();
    }
    Separator[0] = NewLabelComponent(fbSeparator[0], class'BTUIResourcePoolHK'.default.img_divid_line);
    Separator[1] = NewLabelComponent(fbSeparator[1], class'BTUIResourcePoolHK'.default.img_divid_line);
    i = 0;
    J0xe7:
    // End:0x174 [While If]
    if(i < 4)
    {
        LabelCommonTop[i] = NewLabelComponent(fbLabelCommonTop[i], class'BTUIResourcePoolHK'.default.empty);
        LabelCommonTop[i].Caption = strLabelCommonTop[i];
        LabelCommonTop[i].SetDefaultFontColor();
        LabelCommonTop[i].CaptionDrawType = 0;
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0xe7;
    }
    i = 0;
    J0x17b:
    // End:0x208 [While If]
    if(i < 6)
    {
        LabelCommonBottom[i] = NewLabelComponent(fbLabelCommonBottom[i], class'BTUIResourcePoolHK'.default.empty);
        LabelCommonBottom[i].SetDefaultFontColor();
        LabelCommonBottom[i].Caption = strLabelCommonBottom[i];
        LabelCommonBottom[i].CaptionDrawType = 0;
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x17b;
    }
    i = 0;
    J0x20f:
    // End:0x27c [While If]
    if(i < 3)
    {
        LabelAdd[i] = NewLabelComponent(fbLabelAdd[i], class'BTUIResourcePoolHK'.default.empty);
        LabelAdd[i].SetDefaultFontColor();
        LabelAdd[i].CaptionDrawType = 0;
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x20f;
    }
    i = 0;
    J0x283:
    // End:0x336 [While If]
    if(i < 4)
    {
        LabelWarning[i] = NewLabelComponent(fbLabelWarning[i], class'BTUIResourcePoolHK'.default.empty);
        LabelWarning[i].SetFontSizeAll(10);
        LabelWarning[i].SetFontColorAll(class'BTUIColorPoolHK'.static.LabelWarning());
        LabelWarning[i].Caption = strLabelWarning[i];
        LabelWarning[i].CaptionDrawType = 0;
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x283;
    }
    InitializeComboBox();
    InitializeRadioButton();
    LabelAdd[0].Caption = strLabelBombPossesion;
    LabelAdd[1].Caption = strLabelSwitchSide;
    LabelAdd[2].Caption = strLabelChangeRound;
    Combo[0].ComboBox.AddItem(strClanRule[0]);
    Combo[1].ComboBox.AddItem(strClanRule[1]);
    Combo[2].ComboBox.AddItem(strClanRule[2]);
    Combo[3].ComboBox.AddItem(strClanRule[3]);
    ComboAdd[0].ComboBox.AddItem(strClanRule[4]);
    ComboAdd[1].ComboBox.AddItem(strClanRule[5]);
    ComboAdd[2].ComboBox.AddItem(strClanRule[6]);
    Combo[0].ComboBox.bAcceptsInput = false;
    Combo[1].ComboBox.bAcceptsInput = false;
    Combo[2].ComboBox.bAcceptsInput = false;
    Combo[3].ComboBox.bAcceptsInput = false;
    ComboAdd[0].ComboBox.bAcceptsInput = false;
    ComboAdd[1].ComboBox.bAcceptsInput = false;
    ComboAdd[2].ComboBox.bAcceptsInput = false;
    TopLine.CaptionDrawType = 3;
    TopLine.CaptionPadding[0] = 4;
    UpdateDefaultWindow();
}

function InitializeComboBox()
{
    local int i;

    i = 0;
    J0x07:
    // End:0x86 [While If]
    if(i < 4)
    {
        Combo[i] = BTComboBoxHK(NewComponent(new class'BTComboBoxHK', fbCombo[i], 0.50 - float(i) * 0.010));
        Combo[i].ComboBox.Edit.bReadOnly = true;
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x07;
    }
    i = 0;
    J0x8d:
    // End:0x10c [While If]
    if(i < 3)
    {
        ComboAdd[i] = BTComboBoxHK(NewComponent(new class'BTComboBoxHK', fbComboAdd[i], 0.40 - float(i) * 0.010));
        ComboAdd[i].ComboBox.Edit.bReadOnly = true;
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x8d;
    }
    ComboGameMode = Combo[0];
    ComboGameTime = Combo[1];
    ComboWeaponRestriction = Combo[2];
    ComboTargetScore = Combo[4];
    // End:0x275
    if(MatchMaker.bIsOwner == false)
    {
        i = 0;
        J0x15e:
        // End:0x1e6 [While If]
        if(i < 4)
        {
            Combo[i].ComboBox.MyShowListBtn.bAcceptsInput = false;
            Combo[i].ComboBox.bAcceptsInput = false;
            Combo[i].ComboBox.Edit.bAcceptsInput = false;
            ++ i;
            // This is an implied JumpToken; Continue!
            goto J0x15e;
        }
        i = 0;
        J0x1ed:
        // End:0x275 [While If]
        if(i < 3)
        {
            ComboAdd[i].ComboBox.MyShowListBtn.bAcceptsInput = false;
            ComboAdd[i].ComboBox.bAcceptsInput = false;
            ComboAdd[i].ComboBox.Edit.bAcceptsInput = false;
            ++ i;
            // This is an implied JumpToken; Continue!
            goto J0x1ed;
        }
    }
}

function InitializeRadioButton()
{
    local int i;

    i = 0;
    J0x07:
    // End:0x89 [While If]
    if(i < 6)
    {
        Radio[i] = BTRadioOnOffButtonHK(NewComponent(new class'BTRadioOnOffButtonHK', fbRadio[i], 0.30));
        Radio[i].ButtonOn.DisableMe();
        Radio[i].ButtonOff.DisableMe();
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x07;
    }
    RadioTeamDamage = Radio[0];
    RadioFreeCamera = Radio[1];
    RadioTeamBalance = Radio[2];
    RadioJoinInPlaying = Radio[3];
    RadioVoiceChatting = Radio[4];
    RadioVote = Radio[5];
    // End:0x14d
    if(MatchMaker.bIsOwner == false)
    {
        i = 0;
        J0xf7:
        // End:0x14d [While If]
        if(i < 6)
        {
            Radio[i].ButtonOn.bAcceptsInput = false;
            Radio[i].ButtonOff.bAcceptsInput = false;
            ++ i;
            // This is an implied JumpToken; Continue!
            goto J0xf7;
        }
    }
}

defaultproperties
{
    fbSeparator[0]=(X1=273.0,Y1=306.0,X2=751.0,Y2=308.0)
    fbSeparator[1]=(X1=273.0,Y1=421.0,X2=751.0,Y2=423.0)
    fbLabelCommonTop[0]=(X1=276.0,Y1=176.0,X2=779.0,Y2=650.0)
    fbLabelCommonTop[1]=(X1=276.0,Y1=210.0,X2=779.0,Y2=650.0)
    fbLabelCommonTop[2]=(X1=525.0,Y1=176.0,X2=779.0,Y2=650.0)
    fbLabelCommonTop[3]=(X1=525.0,Y1=210.0,X2=779.0,Y2=650.0)
    strLabelCommonTop[0]="Mode"
    strLabelCommonTop[1]="Game Time"
    strLabelCommonTop[2]="Sub-Mode"
    strLabelCommonTop[3]="Goal Score"
    fbLabelCommonBottom[0]=(X1=276.0,Y1=322.0,X2=750.0,Y2=612.0)
    fbLabelCommonBottom[1]=(X1=276.0,Y1=356.0,X2=750.0,Y2=612.0)
    fbLabelCommonBottom[2]=(X1=276.0,Y1=390.0,X2=750.0,Y2=612.0)
    fbLabelCommonBottom[3]=(X1=525.0,Y1=322.0,X2=750.0,Y2=612.0)
    fbLabelCommonBottom[4]=(X1=525.0,Y1=356.0,X2=750.0,Y2=612.0)
    fbLabelCommonBottom[5]=(X1=525.0,Y1=390.0,X2=750.0,Y2=612.0)
    strLabelCommonBottom[0]="Ally Casualties"
    strLabelCommonBottom[1]="Free Perspective"
    strLabelCommonBottom[2]="Team Balance"
    strLabelCommonBottom[3]="Intervene"
    strLabelCommonBottom[4]="Voice Chat"
    strLabelCommonBottom[5]="Vote"
    fbLabelAdd[0]=(X1=276.0,Y1=244.0,X2=779.0,Y2=650.0)
    fbLabelAdd[1]=(X1=276.0,Y1=278.0,X2=779.0,Y2=650.0)
    fbLabelAdd[2]=(X1=525.0,Y1=244.0,X2=779.0,Y2=650.0)
    fbLabelWarning[0]=(X1=276.0,Y1=434.0,X2=748.0,Y2=446.0)
    fbLabelWarning[1]=(X1=276.0,Y1=458.0,X2=748.0,Y2=470.0)
    fbLabelWarning[2]=(X1=276.0,Y1=482.0,X2=748.0,Y2=494.0)
    fbLabelWarning[3]=(X1=276.0,Y1=499.0,X2=748.0,Y2=511.0)
    strLabelWarning[0]="1. A clan battle may only be started when at least 50% of the users are from the same clan as the leader."
    strLabelWarning[1]="2. Battle records are recorded for the leader's clan."
    strLabelWarning[2]="3. Leaving the Lobby after the auto-matching at the start of the clan battle"
    strLabelWarning[3]="will go on record as a clan battle withdrawal."
    strLabelSwitchSide="Switch Locations"
    strLabelBombPossesion="C4 Possession"
    strBombForEveryone="All"
    strBombForOne="Single"
    strLabelChangeAD="Change Missions"
    strLabelChangeRound="Change Rounds"
    strClanRule[0]="Search & Destroy"
    strClanRule[1]="3"
    strClanRule[2]="All Weapons"
    strClanRule[3]="6"
    strClanRule[4]="Single"
    strClanRule[5]="On"
    strClanRule[6]="3"
    fbCombo[0]=(X1=351.0,Y1=170.0,X2=501.0,Y2=196.0)
    fbCombo[1]=(X1=351.0,Y1=204.0,X2=501.0,Y2=230.0)
    fbCombo[2]=(X1=601.0,Y1=170.0,X2=751.0,Y2=196.0)
    fbCombo[3]=(X1=601.0,Y1=204.0,X2=751.0,Y2=230.0)
    fbComboAdd[0]=(X1=351.0,Y1=238.0,X2=501.0,Y2=264.0)
    fbComboAdd[1]=(X1=351.0,Y1=272.0,X2=501.0,Y2=298.0)
    fbComboAdd[2]=(X1=601.0,Y1=238.0,X2=751.0,Y2=264.0)
    fbRadio[0]=(X1=356.0,Y1=321.0,X2=480.0,Y2=339.0)
    fbRadio[1]=(X1=356.0,Y1=355.0,X2=480.0,Y2=373.0)
    fbRadio[2]=(X1=356.0,Y1=389.0,X2=480.0,Y2=407.0)
    fbRadio[3]=(X1=606.0,Y1=321.0,X2=730.0,Y2=339.0)
    fbRadio[4]=(X1=606.0,Y1=355.0,X2=730.0,Y2=373.0)
    fbRadio[5]=(X1=606.0,Y1=389.0,X2=730.0,Y2=407.0)
    fbBackgroundImage=(X1=245.0,Y1=116.0,X2=779.0,Y2=651.0)
    fbTopLine=(X1=265.0,Y1=136.0,X2=759.0,Y2=163.0)
    fbBottomLine=(X1=265.0,Y1=588.0,X2=759.0,Y2=630.0)
    fbButtonOK=(X1=390.0,Y1=594.0,X2=509.0,Y2=626.0)
    fbButtonCancel=(X1=514.0,Y1=594.0,X2=633.0,Y2=626.0)
    strTitle="Clan Battle Rules"
    bResizeWidthAllowed=true
    bResizeHeightAllowed=true
    bSetControlsBoundToParent=true
    bSetControlsScaleToParent=true
}