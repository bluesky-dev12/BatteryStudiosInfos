class BTWindowCWRoomInfoHK extends BTWindowHK
    editinlinenew
    instanced;

var transient wMatchMaker MatchMaker;
var array<GameModeInfo> GameModeInfos;
var() automated FloatBox fbSeparator[2];
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
        GameModeInfos = Class'Engine.wGameSettings'.static.GetAllGameModesAtServiceBuild();        
    }
    else
    {
        GameModeInfos = Class'Engine.wGameSettings'.static.GetAllGameModes();
    }
    Separator[0] = NewLabelComponent(fbSeparator[0], Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.img_divid_line);
    Separator[1] = NewLabelComponent(fbSeparator[1], Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.img_divid_line);
    i = 0;
    J0xE7:

    // End:0x174 [Loop If]
    if(i < 4)
    {
        LabelCommonTop[i] = NewLabelComponent(fbLabelCommonTop[i], Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.empty);
        LabelCommonTop[i].Caption = strLabelCommonTop[i];
        LabelCommonTop[i].SetDefaultFontColor();
        LabelCommonTop[i].CaptionDrawType = 0;
        i++;
        // [Loop Continue]
        goto J0xE7;
    }
    i = 0;
    J0x17B:

    // End:0x208 [Loop If]
    if(i < 6)
    {
        LabelCommonBottom[i] = NewLabelComponent(fbLabelCommonBottom[i], Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.empty);
        LabelCommonBottom[i].SetDefaultFontColor();
        LabelCommonBottom[i].Caption = strLabelCommonBottom[i];
        LabelCommonBottom[i].CaptionDrawType = 0;
        i++;
        // [Loop Continue]
        goto J0x17B;
    }
    i = 0;
    J0x20F:

    // End:0x27C [Loop If]
    if(i < 3)
    {
        LabelAdd[i] = NewLabelComponent(fbLabelAdd[i], Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.empty);
        LabelAdd[i].SetDefaultFontColor();
        LabelAdd[i].CaptionDrawType = 0;
        i++;
        // [Loop Continue]
        goto J0x20F;
    }
    i = 0;
    J0x283:

    // End:0x336 [Loop If]
    if(i < 4)
    {
        LabelWarning[i] = NewLabelComponent(fbLabelWarning[i], Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.empty);
        LabelWarning[i].SetFontSizeAll(10);
        LabelWarning[i].SetFontColorAll(Class'GUIWarfareControls_Decompressed.BTUIColorPoolHK'.static.LabelWarning());
        LabelWarning[i].Caption = strLabelWarning[i];
        LabelWarning[i].CaptionDrawType = 0;
        i++;
        // [Loop Continue]
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
    //return;    
}

function InitializeComboBox()
{
    local int i;

    i = 0;
    J0x07:

    // End:0x86 [Loop If]
    if(i < 4)
    {
        Combo[i] = BTComboBoxHK(NewComponent(new Class'GUIWarfareControls_Decompressed.BTComboBoxHK', fbCombo[i], 0.5000000 - (float(i) * 0.0100000)));
        Combo[i].ComboBox.Edit.bReadOnly = true;
        i++;
        // [Loop Continue]
        goto J0x07;
    }
    i = 0;
    J0x8D:

    // End:0x10C [Loop If]
    if(i < 3)
    {
        ComboAdd[i] = BTComboBoxHK(NewComponent(new Class'GUIWarfareControls_Decompressed.BTComboBoxHK', fbComboAdd[i], 0.4000000 - (float(i) * 0.0100000)));
        ComboAdd[i].ComboBox.Edit.bReadOnly = true;
        i++;
        // [Loop Continue]
        goto J0x8D;
    }
    ComboGameMode = Combo[0];
    ComboGameTime = Combo[1];
    ComboWeaponRestriction = Combo[2];
    ComboTargetScore = Combo[4];
    // End:0x275
    if(MatchMaker.bIsOwner == false)
    {
        i = 0;
        J0x15E:

        // End:0x1E6 [Loop If]
        if(i < 4)
        {
            Combo[i].ComboBox.MyShowListBtn.bAcceptsInput = false;
            Combo[i].ComboBox.bAcceptsInput = false;
            Combo[i].ComboBox.Edit.bAcceptsInput = false;
            i++;
            // [Loop Continue]
            goto J0x15E;
        }
        i = 0;
        J0x1ED:

        // End:0x275 [Loop If]
        if(i < 3)
        {
            ComboAdd[i].ComboBox.MyShowListBtn.bAcceptsInput = false;
            ComboAdd[i].ComboBox.bAcceptsInput = false;
            ComboAdd[i].ComboBox.Edit.bAcceptsInput = false;
            i++;
            // [Loop Continue]
            goto J0x1ED;
        }
    }
    //return;    
}

function InitializeRadioButton()
{
    local int i;

    i = 0;
    J0x07:

    // End:0x89 [Loop If]
    if(i < 6)
    {
        Radio[i] = BTRadioOnOffButtonHK(NewComponent(new Class'GUIWarfareControls_Decompressed.BTRadioOnOffButtonHK', fbRadio[i], 0.3000000));
        Radio[i].ButtonOn.DisableMe();
        Radio[i].ButtonOff.DisableMe();
        i++;
        // [Loop Continue]
        goto J0x07;
    }
    RadioTeamDamage = Radio[0];
    RadioFreeCamera = Radio[1];
    RadioTeamBalance = Radio[2];
    RadioJoinInPlaying = Radio[3];
    RadioVoiceChatting = Radio[4];
    RadioVote = Radio[5];
    // End:0x14D
    if(MatchMaker.bIsOwner == false)
    {
        i = 0;
        J0xF7:

        // End:0x14D [Loop If]
        if(i < 6)
        {
            Radio[i].ButtonOn.bAcceptsInput = false;
            Radio[i].ButtonOff.bAcceptsInput = false;
            i++;
            // [Loop Continue]
            goto J0xF7;
        }
    }
    //return;    
}

defaultproperties
{
    fbSeparator[0]=(X1=273.0000000,Y1=306.0000000,X2=751.0000000,Y2=308.0000000)
    fbSeparator[1]=(X1=273.0000000,Y1=421.0000000,X2=751.0000000,Y2=423.0000000)
    fbLabelCommonTop[0]=(X1=276.0000000,Y1=176.0000000,X2=779.0000000,Y2=650.0000000)
    fbLabelCommonTop[1]=(X1=276.0000000,Y1=210.0000000,X2=779.0000000,Y2=650.0000000)
    fbLabelCommonTop[2]=(X1=525.0000000,Y1=176.0000000,X2=779.0000000,Y2=650.0000000)
    fbLabelCommonTop[3]=(X1=525.0000000,Y1=210.0000000,X2=779.0000000,Y2=650.0000000)
    strLabelCommonTop[0]="Mode"
    strLabelCommonTop[1]="Game Time"
    strLabelCommonTop[2]="Sub-Mode"
    strLabelCommonTop[3]="Goal Score"
    fbLabelCommonBottom[0]=(X1=276.0000000,Y1=322.0000000,X2=750.0000000,Y2=612.0000000)
    fbLabelCommonBottom[1]=(X1=276.0000000,Y1=356.0000000,X2=750.0000000,Y2=612.0000000)
    fbLabelCommonBottom[2]=(X1=276.0000000,Y1=390.0000000,X2=750.0000000,Y2=612.0000000)
    fbLabelCommonBottom[3]=(X1=525.0000000,Y1=322.0000000,X2=750.0000000,Y2=612.0000000)
    fbLabelCommonBottom[4]=(X1=525.0000000,Y1=356.0000000,X2=750.0000000,Y2=612.0000000)
    fbLabelCommonBottom[5]=(X1=525.0000000,Y1=390.0000000,X2=750.0000000,Y2=612.0000000)
    strLabelCommonBottom[0]="Ally Casualties"
    strLabelCommonBottom[1]="Free Perspective"
    strLabelCommonBottom[2]="Team Balance"
    strLabelCommonBottom[3]="Intervene"
    strLabelCommonBottom[4]="Voice Chat"
    strLabelCommonBottom[5]="Vote"
    fbLabelAdd[0]=(X1=276.0000000,Y1=244.0000000,X2=779.0000000,Y2=650.0000000)
    fbLabelAdd[1]=(X1=276.0000000,Y1=278.0000000,X2=779.0000000,Y2=650.0000000)
    fbLabelAdd[2]=(X1=525.0000000,Y1=244.0000000,X2=779.0000000,Y2=650.0000000)
    fbLabelWarning[0]=(X1=276.0000000,Y1=434.0000000,X2=748.0000000,Y2=446.0000000)
    fbLabelWarning[1]=(X1=276.0000000,Y1=458.0000000,X2=748.0000000,Y2=470.0000000)
    fbLabelWarning[2]=(X1=276.0000000,Y1=482.0000000,X2=748.0000000,Y2=494.0000000)
    fbLabelWarning[3]=(X1=276.0000000,Y1=499.0000000,X2=748.0000000,Y2=511.0000000)
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
    fbCombo[0]=(X1=351.0000000,Y1=170.0000000,X2=501.0000000,Y2=196.0000000)
    fbCombo[1]=(X1=351.0000000,Y1=204.0000000,X2=501.0000000,Y2=230.0000000)
    fbCombo[2]=(X1=601.0000000,Y1=170.0000000,X2=751.0000000,Y2=196.0000000)
    fbCombo[3]=(X1=601.0000000,Y1=204.0000000,X2=751.0000000,Y2=230.0000000)
    fbComboAdd[0]=(X1=351.0000000,Y1=238.0000000,X2=501.0000000,Y2=264.0000000)
    fbComboAdd[1]=(X1=351.0000000,Y1=272.0000000,X2=501.0000000,Y2=298.0000000)
    fbComboAdd[2]=(X1=601.0000000,Y1=238.0000000,X2=751.0000000,Y2=264.0000000)
    fbRadio[0]=(X1=356.0000000,Y1=321.0000000,X2=480.0000000,Y2=339.0000000)
    fbRadio[1]=(X1=356.0000000,Y1=355.0000000,X2=480.0000000,Y2=373.0000000)
    fbRadio[2]=(X1=356.0000000,Y1=389.0000000,X2=480.0000000,Y2=407.0000000)
    fbRadio[3]=(X1=606.0000000,Y1=321.0000000,X2=730.0000000,Y2=339.0000000)
    fbRadio[4]=(X1=606.0000000,Y1=355.0000000,X2=730.0000000,Y2=373.0000000)
    fbRadio[5]=(X1=606.0000000,Y1=389.0000000,X2=730.0000000,Y2=407.0000000)
    fbBackgroundImage=(X1=245.0000000,Y1=116.0000000,X2=779.0000000,Y2=651.0000000)
    fbTopLine=(X1=265.0000000,Y1=136.0000000,X2=759.0000000,Y2=163.0000000)
    fbBottomLine=(X1=265.0000000,Y1=588.0000000,X2=759.0000000,Y2=630.0000000)
    fbButtonOK=(X1=390.0000000,Y1=594.0000000,X2=509.0000000,Y2=626.0000000)
    fbButtonCancel=(X1=514.0000000,Y1=594.0000000,X2=633.0000000,Y2=626.0000000)
    strTitle="Clan Battle Rules"
    bResizeWidthAllowed=false
    bResizeHeightAllowed=false
    bSetControlsBoundToParent=false
    bSetControlsScaleToParent=false
}