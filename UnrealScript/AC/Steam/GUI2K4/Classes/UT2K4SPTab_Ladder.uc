/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path GUI2K4\Classes\UT2K4SPTab_Ladder.uc
 * Package Imports:
 *	GUI2K4
 *	XInterface
 *	Core
 *
 * Stats:
 *	Properties:30
 *	Functions:9
 *
 *******************************************************************************/
class UT2K4SPTab_Ladder extends UT2K4SPTab_LadderBase
    editinlinenew
    instanced;

var array<export editinline UT2K4LadderButton> CTFEntries;
var array<export editinline UT2K4LadderButton> BREntries;
var array<export editinline UT2K4LadderButton> DOMEntries;
var array<export editinline UT2K4LadderButton> ASEntries;
var array<export editinline UT2K4LadderButton> CHAMPEntries;
var byte LadderInit[5];
var() /*0x00000000-0x80000000*/ databinding editinlinenotify array<databinding export editinlinenotify GUIImage> imgChamp;
var() /*0x00000000-0x80000000*/ databinding editinlinenotify array<databinding export editinlinenotify GUIImage> imgChampBars;
var() /*0x00000000-0x80000000*/ databinding editinlinenotify array<databinding export editinlinenotify GUILabel> lblLadders;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify GUISectionBackground sbgLadderBg;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify GUISectionBackground sbgChallengeBg;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify GUIComboBox cbChallenges;
var array<export editinline GUIButton> imgLadderBtns;
var array<export editinline GUIImage> imgLadderBgs;
var array<export editinline GUIImage> imgLadderImgs;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify UT2K4LadderButton btnChampFinal;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify GUIImage imgChampFinal;
var array<AnimData> animCTFEntries;
var array<AnimData> animBREntries;
var array<AnimData> animDOMEntries;
var array<AnimData> animASEntries;
var array<AnimData> animCHAMPEntries;
var int PreviousLadder;
var Material LadderBorderNormal;
var Material LadderBorderCompleted;
var Material LadderBarCompleted;
var array<string> LadderImageCompleted;
var array<string> LadderImage;
var int OpenLadderIndex;
var localized string msgSelectChal;

function InitComponent(GUIController pMyController, GUIComponent myOwner)
{
    local string tmp;
    local array<int> OpenLadders;
    local int i;

    super(UT2K4SPTab_Base).InitComponent(pMyController, myOwner);
    sbgMatch.WinTop = 0.4150;
    sbgMatch.WinLeft = 0.0771170;
    sbgMatch.WinWidth = 0.3771430;
    sbgMatch.WinHeight = 0.303750;
    imgMatchShot.WinTop = 0.4691050;
    imgMatchShot.WinLeft = 0.0911220;
    imgMatchShot.WinWidth = 0.3504080;
    imgMatchShot.WinHeight = 0.2140820;
    lblMatchPrice.WinTop = 0.6443070;
    lblMatchPrice.WinLeft = 0.10250;
    lblMatchPrice.WinWidth = 0.318750;
    lblMatchPrice.WinHeight = 0.041250;
    lblMatchEntryFee.WinTop = 0.608750;
    lblMatchEntryFee.WinLeft = 0.10250;
    lblMatchEntryFee.WinWidth = 0.318750;
    lblMatchEntryFee.WinHeight = 0.041250;
    lblNoMoney.WinTop = 0.465720;
    lblNoMoney.WinLeft = 0.0922960;
    lblNoMoney.WinWidth = 0.3493620;
    lblNoMoney.WinHeight = 0.2147960;
    sbgDetail.WinTop = 0.4150;
    sbgDetail.WinLeft = 0.465510;
    sbgDetail.WinWidth = 0.451250;
    sbgDetail.WinHeight = 0.303750;
    sbDetails.WinTop = 0.4724610;
    sbDetails.WinLeft = 0.4820150;
    sbDetails.WinWidth = 0.4195150;
    sbDetails.WinHeight = 0.1884690;
    btnChallengeMap.WinWidth = 0.3507650;
    btnChallengeMap.WinHeight = 0.0463520;
    btnChallengeMap.WinLeft = 0.5163770;
    btnChallengeMap.WinTop = 0.6644880;
    CTFEntries = CreateHButtons(GP.UT2K4GameLadder.default.LID_CTF, WinTop + 0.6550, WinLeft + 0.050, WinWidth * 0.810, true);
    animCTFEntries = InitAnimData(CTFEntries);
    DOMEntries = CreateHButtons(GP.UT2K4GameLadder.default.LID_DOM, WinTop + 0.6550, WinLeft + 0.050, WinWidth * 0.810, true);
    animDOMEntries = InitAnimData(DOMEntries);
    BREntries = CreateHButtons(GP.UT2K4GameLadder.default.LID_BR, WinTop + 0.6550, WinLeft + 0.050, WinWidth * 0.810, true);
    animBREntries = InitAnimData(BREntries);
    ASEntries = CreateHButtons(GP.UT2K4GameLadder.default.LID_AS, WinTop + 0.6550, WinLeft + 0.050, WinWidth * 0.810, true);
    animASEntries = InitAnimData(ASEntries);
    CHAMPEntries = CreateHButtons(GP.UT2K4GameLadder.default.LID_CHAMP, WinTop + 0.6550, WinLeft + WinWidth / float(4), WinWidth * 0.810 * 0.50, true);
    animCHAMPEntries = InitAnimData(CHAMPEntries);
    LadderInit[4] = 1;
    tmp = GP.GetLadderDescription(GP.UT2K4GameLadder.default.LID_CTF);
    lblLadders[0].Caption = Caps(tmp);
    LadderInit[0] = 1;
    CreateLadderButtons(0.0416660, 0.01250, 0.11250, 0.131250, GP.UT2K4GameLadder.default.LID_CTF, tmp);
    // End:0x518
    if(SetCompletedLadder(0, GP.UT2K4GameLadder.default.LID_CTF))
    {
        OpenLadders[OpenLadders.Length] = 0;
    }
    tmp = GP.GetLadderDescription(GP.UT2K4GameLadder.default.LID_BR);
    lblLadders[1].Caption = Caps(tmp);
    LadderInit[1] = 1;
    CreateLadderButtons(0.1250, 0.131250, 0.11250, 0.131250, GP.UT2K4GameLadder.default.LID_BR, tmp);
    // End:0x5cb
    if(SetCompletedLadder(1, GP.UT2K4GameLadder.default.LID_BR))
    {
        OpenLadders[OpenLadders.Length] = 1;
    }
    tmp = GP.GetLadderDescription(GP.UT2K4GameLadder.default.LID_DOM);
    lblLadders[2].Caption = Caps(tmp);
    LadderInit[2] = 1;
    CreateLadderButtons(0.0416660, 0.8750010, 0.11250, 0.131250, GP.UT2K4GameLadder.default.LID_DOM, tmp);
    // End:0x682
    if(SetCompletedLadder(2, GP.UT2K4GameLadder.default.LID_DOM))
    {
        OpenLadders[OpenLadders.Length] = 2;
    }
    tmp = GP.GetLadderDescription(GP.UT2K4GameLadder.default.LID_AS);
    lblLadders[3].Caption = Caps(tmp);
    LadderInit[3] = 1;
    CreateLadderButtons(0.1250, 0.7562510, 0.11250, 0.131250, GP.UT2K4GameLadder.default.LID_AS, tmp);
    // End:0x739
    if(SetCompletedLadder(3, GP.UT2K4GameLadder.default.LID_AS))
    {
        OpenLadders[OpenLadders.Length] = 3;
    }
    // End:0x76d
    if(OpenLadders.Length > 0)
    {
        OpenLadderIndex = OpenLadders[0];
        setLadderVisibility(imgLadderBtns[OpenLadderIndex].Tag, false);
    }
    cbChallenges.AddItem(msgSelectChal);
    i = 0;
    J0x788:
    // End:0x810 [While If]
    if(i < GP.UT2K4GameLadder.default.ChallengeGames.Length)
    {
        cbChallenges.AddItem(GP.UT2K4GameLadder.default.ChallengeGames[i].default.ChallengeName,, GP.UT2K4GameLadder.default.ChallengeGames[i].default.ChallengeMenu);
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x788;
    }
}

function ShowPanel(bool bShow)
{
    super.ShowPanel(bShow);
    // End:0x79
    if(bShow)
    {
        // End:0x47
        if(OpenLadderIndex < imgLadderBtns.Length && OpenLadderIndex > -1)
        {
            onLadderClick(imgLadderBtns[OpenLadderIndex]);
        }
        showChampButton(GP.LadderProgress[GP.UT2K4GameLadder.default.LID_CHAMP] >= 0);
    }
    // End:0x90
    else
    {
        setLadderVisibility(PreviousLadder, false);
        PreviousLadder = -1;
    }
}

function CreateLadderButtons(float Top, float Left, float width, float Height, int LadderId, string Title)
{
    local export editinline GUIButton btn;
    local export editinline GUIImage img;
    local export editinline GUIProgressBar pB;

    btn = new class'GUIButton';
    btn.StyleName = "NoBackground";
    btn.bFocusOnWatch = true;
    btn.WinHeight = width;
    btn.WinWidth = Height;
    btn.WinTop = Top;
    btn.WinLeft = Left;
    btn.__OnClick__Delegate = onLadderClick;
    btn.Tag = LadderId;
    btn.Hint = Title;
    btn.RenderWeight = 0.40;
    btn.TabOrder = Controls.Length + 1;
    btn.bBoundToParent = true;
    imgLadderBtns[imgLadderBtns.Length] = btn;
    AppendComponent(btn, true);
    img = new class'GUIImage';
    img.ImageStyle = 1;
    img.WinHeight = Height;
    img.WinWidth = width;
    img.WinTop = Top;
    img.WinLeft = Left;
    img.RenderWeight = 0.10;
    img.bBoundToParent = true;
    imgLadderBgs[imgLadderBgs.Length] = img;
    AppendComponent(img, true);
    img = new class'GUIImage';
    img.ImageStyle = 2;
    img.WinHeight = Height * 0.640;
    img.WinWidth = width - 0.020;
    img.WinTop = Top + 0.010;
    img.WinLeft = Left + 0.010;
    img.RenderWeight = 0.20;
    img.X1 = 0;
    img.Y1 = 0;
    img.X2 = 1023;
    img.Y2 = 767;
    img.bBoundToParent = true;
    imgLadderImgs[imgLadderImgs.Length] = img;
    AppendComponent(img, true);
    pB = new class'GUIProgressBar';
    pB.WinHeight = Height * 0.20;
    pB.WinWidth = width - 0.020;
    pB.WinTop = img.WinTop + img.WinHeight + 0.0133330;
    pB.WinLeft = Left + 0.010;
    pB.RenderWeight = 0.20;
    pB.Low = 0.0;
    pB.High = float(GP.LengthOfLadder(LadderId));
    pB.Value = float(Min(GP.LadderProgress[LadderId], int(pB.High)));
    pB.bShowLow = false;
    pB.bShowHigh = false;
    pB.bShowValue = false;
    pB.CaptionWidth = 0.0;
    pB.ValueRightWidth = 0.0;
    pB.bBoundToParent = true;
    AppendComponent(pB);
}

function bool onLadderClick(GUIComponent Sender)
{
    // End:0x1a
    if(PreviousLadder == Sender.Tag)
    {
        return true;
    }
    // End:0x35
    if(PreviousLadder > -1)
    {
        setLadderVisibility(PreviousLadder, false);
    }
    setLadderVisibility(Sender.Tag, true);
    sbgLadderBg.Caption = GUIButton(Sender).Hint;
    PreviousLadder = Sender.Tag;
    return true;
}

function setLadderVisibility(int LadderId, bool bVisible)
{
    local array<export editinline UT2K4LadderButton> btns;
    local array<AnimData> adata;
    local int i, selBtn, linit;

    switch(LadderId)
    {
        // End:0x41
        case GP.UT2K4GameLadder.default.LID_CTF:
            btns = CTFEntries;
            adata = animCTFEntries;
            linit = 0;
            // End:0x12f
            break;
        // End:0x7b
        case GP.UT2K4GameLadder.default.LID_BR:
            btns = BREntries;
            adata = animBREntries;
            linit = 1;
            // End:0x12f
            break;
        // End:0xb6
        case GP.UT2K4GameLadder.default.LID_DOM:
            btns = DOMEntries;
            adata = animDOMEntries;
            linit = 2;
            // End:0x12f
            break;
        // End:0xf1
        case GP.UT2K4GameLadder.default.LID_AS:
            btns = ASEntries;
            adata = animASEntries;
            linit = 3;
            // End:0x12f
            break;
        // End:0x12c
        case GP.UT2K4GameLadder.default.LID_CHAMP:
            btns = CHAMPEntries;
            adata = animCHAMPEntries;
            linit = 4;
            // End:0x12f
            break;
        // End:0xffff
        default:
            i = 0;
            J0x136:
            // End:0x1a5 [While If]
            if(i < btns.Length)
            {
                btns[i].SetVisibility(bVisible);
                // End:0x19b
                if(btns[i].ProgresBar != none)
                {
                    btns[i].ProgresBar.bVisible = false;
                }
                ++ i;
                // This is an implied JumpToken; Continue!
                goto J0x136;
            }
            // End:0x2db
            if(bVisible)
            {
                // End:0x219
                if(LadderInit[linit] != 0)
                {
                    LadderInit[linit] = 0;
                    i = 0;
                    J0x1d6:
                    // End:0x219 [While If]
                    if(i < btns.Length)
                    {
                        btns[i].SetState(GP.LadderProgress[LadderId]);
                        ++ i;
                        // This is an implied JumpToken; Continue!
                        goto J0x1d6;
                    }
                }
                DoAnimate(btns, adata);
                selBtn = Min(GP.LadderProgress[LadderId], btns.Length - 1);
                // End:0x26d
                if(selBtn >= btns.Length || selBtn < 0)
                {
                    return;
                }
                J0x26d:
                // End:0x2cb [While If]
                if(selBtn >= 0)
                {
                    // End:0x2c1
                    if(GP.getMinimalEntryFeeFor(btns[selBtn].MatchInfo) <= GP.Balance)
                    {
                        onMatchClick(btns[selBtn]);
                        return;
                    }
                    -- selBtn;
                    // This is an implied JumpToken; Continue!
                    goto J0x26d;
                }
                onMatchClick(btns[0]);
            }
            // End:0x2ec
            else
            {
                DoAnimate(btns, adata, true);
            }
}

function bool SetCompletedLadder(int offset, int LadderId)
{
    local bool isCompleted;

    isCompleted = GP.completedLadder(LadderId);
    return GP.LadderProgress[LadderId] > -1 && !isCompleted;
}

function showChampButton(bool bActive)
{
    local Material Screenshot;
    local MapRecord MapRecord;

    btnChampFinal.bVisible = bActive;
    imgChampFinal.bVisible = bActive;
    btnChampFinal.bAcceptsInput = bActive;
    btnChampFinal.bNeverFocus = !bActive;
    // End:0x24f
    if(bActive)
    {
        btnChampFinal.MatchInfo = UT2K4MatchInfo(GP.GetMatchInfo(GP.UT2K4GameLadder.default.LID_CHAMP, GP.LadderProgress[GP.UT2K4GameLadder.default.LID_CHAMP]));
        btnChampFinal.MatchIndex = GP.LadderProgress[GP.UT2K4GameLadder.default.LID_CHAMP];
        btnChampFinal.LadderIndex = GP.UT2K4GameLadder.default.LID_CHAMP;
        // End:0x1b7
        if(GP.completedLadder(GP.UT2K4GameLadder.default.LID_CHAMP))
        {
            btnChampFinal.MatchIndex = GP.LengthOfLadder(GP.UT2K4GameLadder.default.LID_CHAMP) - 1;
            btnChampFinal.Graphic = Material(DynamicLoadObject("PlayerPictures.aDOM", class'Material', true));
        }
        // End:0x244
        else
        {
            MapRecord = class'CacheManager'.static.GetMapRecord(btnChampFinal.MatchInfo.LevelName);
            Screenshot = Material(DynamicLoadObject(MapRecord.ScreenshotRef, class'Material'));
            // End:0x230
            if(MaterialSequence(Screenshot) != none)
            {
                Screenshot = MaterialSequence(Screenshot).SequenceItems[0].Material;
            }
            btnChampFinal.Graphic = Screenshot;
        }
        OnChampClick(btnChampFinal);
    }
}

function bool OnChampClick(GUIComponent Sender)
{
    // End:0x23
    if(PreviousLadder == GP.UT2K4GameLadder.default.LID_CHAMP)
    {
        return true;
    }
    // End:0x3e
    if(PreviousLadder > -1)
    {
        setLadderVisibility(PreviousLadder, false);
    }
    setLadderVisibility(GP.UT2K4GameLadder.default.LID_CHAMP, true);
    sbgLadderBg.Caption = GP.msgChampionship;
    PreviousLadder = GP.UT2K4GameLadder.default.LID_CHAMP;
    return true;
}

function OnChallengeSelect(GUIComponent Sender)
{
    local string tmp;

    tmp = cbChallenges.GetExtra();
    // End:0x35
    if(tmp != "")
    {
        Controller.OpenMenu(tmp);
    }
    cbChallenges.SetIndex(0);
}

defaultproperties
{
    imgChamp=// Object reference not set to an instance of an object.
    
    imgChampBars=// Object reference not set to an instance of an object.
    
    lblLadders=// Object reference not set to an instance of an object.
    
    begin object name=SPLimgLadderBg class=GUISectionBackground
        Caption="??? ??? ????"
        WinTop=0.7387290
        WinLeft=0.0150
        WinWidth=0.9700020
        WinHeight=0.218750
        bBoundToParent=true
        OnPreDraw=InternalPreDraw
    object end
    // Reference: GUISectionBackground'UT2K4SPTab_Ladder.SPLimgLadderBg'
    sbgLadderBg=SPLimgLadderBg
    begin object name=SPLsbgChallengeBg class=AltSectionBackground
        Caption="??"
        WinTop=0.2594870
        WinLeft=0.281250
        WinWidth=0.443750
        WinHeight=0.1403060
        bBoundToParent=true
        OnPreDraw=InternalPreDraw
    object end
    // Reference: AltSectionBackground'UT2K4SPTab_Ladder.SPLsbgChallengeBg'
    sbgChallengeBg=SPLsbgChallengeBg
    begin object name=SPLcbChallenges class=GUIComboBox
        bReadOnly=true
        bShowListOnFocus=true
        Hint="?? ?? ??"
        WinTop=0.3150650
        WinLeft=0.2949850
        WinWidth=0.4173470
        WinHeight=0.0486480
        TabOrder=2
        bBoundToParent=true
        OnChange=OnChallengeSelect
        OnKeyEvent=InternalOnKeyEvent
    object end
    // Reference: GUIComboBox'UT2K4SPTab_Ladder.SPLcbChallenges'
    cbChallenges=SPLcbChallenges
    begin object name=SPLbtnChampFinal class=UT2K4LadderButton
        WinTop=0.0943220
        WinLeft=0.4586330
        TabOrder=1
        bBoundToParent=true
        bAcceptsInput=true
        OnClick=OnChampClick
        OnDblClick=onMatchDblClick
        OnKeyEvent=InternalOnKeyEvent
    object end
    // Reference: UT2K4LadderButton'UT2K4SPTab_Ladder.SPLbtnChampFinal'
    btnChampFinal=SPLbtnChampFinal
    begin object name=SPLimgChampFinal class=GUIImage
        ImageStyle=2
        WinTop=0.0648950
        WinLeft=0.437930
        WinWidth=0.1257220
        WinHeight=0.1726730
        RenderWeight=0.310
        bBoundToParent=true
        bVisible=true
    object end
    // Reference: GUIImage'UT2K4SPTab_Ladder.SPLimgChampFinal'
    imgChampFinal=SPLimgChampFinal
    PreviousLadder=-1
    LadderImageCompleted=// Object reference not set to an instance of an object.
    
    LadderImage=// Object reference not set to an instance of an object.
    
    msgSelectChal="??? ??? ??????"
    PanelCaption="??"
}