class UT2K4SPTab_Ladder extends UT2K4SPTab_LadderBase
    editinlinenew
    instanced;

var array<export editinline UT2K4LadderButton> CTFEntries;
var array<export editinline UT2K4LadderButton> BREntries;
var array<export editinline UT2K4LadderButton> DOMEntries;
var array<export editinline UT2K4LadderButton> ASEntries;
var array<export editinline UT2K4LadderButton> CHAMPEntries;
var byte LadderInit[5];
var() automated array<export editinlinenotify GUIImage> imgChamp;
var() automated array<export editinlinenotify GUIImage> imgChampBars;
var() automated array<export editinlinenotify GUILabel> lblLadders;
var() automated GUISectionBackground sbgLadderBg;
var() automated GUISectionBackground sbgChallengeBg;
var() automated GUIComboBox cbChallenges;
var array<export editinline GUIButton> imgLadderBtns;
var array<export editinline GUIImage> imgLadderBgs;
var array<export editinline GUIImage> imgLadderImgs;
var() automated UT2K4LadderButton btnChampFinal;
var() automated GUIImage imgChampFinal;
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
    sbgMatch.WinTop = 0.4150000;
    sbgMatch.WinLeft = 0.0771170;
    sbgMatch.WinWidth = 0.3771430;
    sbgMatch.WinHeight = 0.3037500;
    imgMatchShot.WinTop = 0.4691050;
    imgMatchShot.WinLeft = 0.0911220;
    imgMatchShot.WinWidth = 0.3504080;
    imgMatchShot.WinHeight = 0.2140820;
    lblMatchPrice.WinTop = 0.6443070;
    lblMatchPrice.WinLeft = 0.1025000;
    lblMatchPrice.WinWidth = 0.3187500;
    lblMatchPrice.WinHeight = 0.0412500;
    lblMatchEntryFee.WinTop = 0.6087500;
    lblMatchEntryFee.WinLeft = 0.1025000;
    lblMatchEntryFee.WinWidth = 0.3187500;
    lblMatchEntryFee.WinHeight = 0.0412500;
    lblNoMoney.WinTop = 0.4657200;
    lblNoMoney.WinLeft = 0.0922960;
    lblNoMoney.WinWidth = 0.3493620;
    lblNoMoney.WinHeight = 0.2147960;
    sbgDetail.WinTop = 0.4150000;
    sbgDetail.WinLeft = 0.4655100;
    sbgDetail.WinWidth = 0.4512500;
    sbgDetail.WinHeight = 0.3037500;
    sbDetails.WinTop = 0.4724610;
    sbDetails.WinLeft = 0.4820150;
    sbDetails.WinWidth = 0.4195150;
    sbDetails.WinHeight = 0.1884690;
    btnChallengeMap.WinWidth = 0.3507650;
    btnChallengeMap.WinHeight = 0.0463520;
    btnChallengeMap.WinLeft = 0.5163770;
    btnChallengeMap.WinTop = 0.6644880;
    CTFEntries = CreateHButtons(GP.UT2K4GameLadder.default.LID_CTF, WinTop + 0.6550000, WinLeft + 0.0500000, WinWidth * 0.8100000, true);
    animCTFEntries = InitAnimData(CTFEntries);
    DOMEntries = CreateHButtons(GP.UT2K4GameLadder.default.LID_DOM, WinTop + 0.6550000, WinLeft + 0.0500000, WinWidth * 0.8100000, true);
    animDOMEntries = InitAnimData(DOMEntries);
    BREntries = CreateHButtons(GP.UT2K4GameLadder.default.LID_BR, WinTop + 0.6550000, WinLeft + 0.0500000, WinWidth * 0.8100000, true);
    animBREntries = InitAnimData(BREntries);
    ASEntries = CreateHButtons(GP.UT2K4GameLadder.default.LID_AS, WinTop + 0.6550000, WinLeft + 0.0500000, WinWidth * 0.8100000, true);
    animASEntries = InitAnimData(ASEntries);
    CHAMPEntries = CreateHButtons(GP.UT2K4GameLadder.default.LID_CHAMP, WinTop + 0.6550000, WinLeft + (WinWidth / float(4)), (WinWidth * 0.8100000) * 0.5000000, true);
    animCHAMPEntries = InitAnimData(CHAMPEntries);
    LadderInit[4] = 1;
    tmp = GP.GetLadderDescription(GP.UT2K4GameLadder.default.LID_CTF);
    lblLadders[0].Caption = Caps(tmp);
    LadderInit[0] = 1;
    CreateLadderButtons(0.0416660, 0.0125000, 0.1125000, 0.1312500, GP.UT2K4GameLadder.default.LID_CTF, tmp);
    // End:0x518
    if(SetCompletedLadder(0, GP.UT2K4GameLadder.default.LID_CTF))
    {
        OpenLadders[OpenLadders.Length] = 0;
    }
    tmp = GP.GetLadderDescription(GP.UT2K4GameLadder.default.LID_BR);
    lblLadders[1].Caption = Caps(tmp);
    LadderInit[1] = 1;
    CreateLadderButtons(0.1250000, 0.1312500, 0.1125000, 0.1312500, GP.UT2K4GameLadder.default.LID_BR, tmp);
    // End:0x5CB
    if(SetCompletedLadder(1, GP.UT2K4GameLadder.default.LID_BR))
    {
        OpenLadders[OpenLadders.Length] = 1;
    }
    tmp = GP.GetLadderDescription(GP.UT2K4GameLadder.default.LID_DOM);
    lblLadders[2].Caption = Caps(tmp);
    LadderInit[2] = 1;
    CreateLadderButtons(0.0416660, 0.8750010, 0.1125000, 0.1312500, GP.UT2K4GameLadder.default.LID_DOM, tmp);
    // End:0x682
    if(SetCompletedLadder(2, GP.UT2K4GameLadder.default.LID_DOM))
    {
        OpenLadders[OpenLadders.Length] = 2;
    }
    tmp = GP.GetLadderDescription(GP.UT2K4GameLadder.default.LID_AS);
    lblLadders[3].Caption = Caps(tmp);
    LadderInit[3] = 1;
    CreateLadderButtons(0.1250000, 0.7562510, 0.1125000, 0.1312500, GP.UT2K4GameLadder.default.LID_AS, tmp);
    // End:0x739
    if(SetCompletedLadder(3, GP.UT2K4GameLadder.default.LID_AS))
    {
        OpenLadders[OpenLadders.Length] = 3;
    }
    // End:0x76D
    if(OpenLadders.Length > 0)
    {
        OpenLadderIndex = OpenLadders[0];
        setLadderVisibility(imgLadderBtns[OpenLadderIndex].Tag, false);
    }
    cbChallenges.AddItem(msgSelectChal);
    i = 0;
    J0x788:

    // End:0x810 [Loop If]
    if(i < GP.UT2K4GameLadder.default.ChallengeGames.Length)
    {
        cbChallenges.AddItem(GP.UT2K4GameLadder.default.ChallengeGames[i].default.ChallengeName,, GP.UT2K4GameLadder.default.ChallengeGames[i].default.ChallengeMenu);
        i++;
        // [Loop Continue]
        goto J0x788;
    }
    //return;    
}

function ShowPanel(bool bShow)
{
    super.ShowPanel(bShow);
    // End:0x79
    if(bShow)
    {
        // End:0x47
        if((OpenLadderIndex < imgLadderBtns.Length) && OpenLadderIndex > -1)
        {
            onLadderClick(imgLadderBtns[OpenLadderIndex]);
        }
        showChampButton(GP.LadderProgress[GP.UT2K4GameLadder.default.LID_CHAMP] >= 0);        
    }
    else
    {
        setLadderVisibility(PreviousLadder, false);
        PreviousLadder = -1;
    }
    //return;    
}

function CreateLadderButtons(float Top, float Left, float Width, float Height, int LadderId, string Title)
{
    local export editinline GUIButton btn;
    local export editinline GUIImage img;
    local export editinline GUIProgressBar pB;

    btn = new Class'XInterface.GUIButton';
    btn.StyleName = "NoBackground";
    btn.bFocusOnWatch = true;
    btn.WinHeight = Width;
    btn.WinWidth = Height;
    btn.WinTop = Top;
    btn.WinLeft = Left;
    btn.__OnClick__Delegate = onLadderClick;
    btn.Tag = LadderId;
    btn.Hint = Title;
    btn.RenderWeight = 0.4000000;
    btn.TabOrder = Controls.Length + 1;
    btn.bBoundToParent = true;
    imgLadderBtns[imgLadderBtns.Length] = btn;
    AppendComponent(btn, true);
    img = new Class'XInterface.GUIImage';
    img.ImageStyle = 1;
    img.WinHeight = Height;
    img.WinWidth = Width;
    img.WinTop = Top;
    img.WinLeft = Left;
    img.RenderWeight = 0.1000000;
    img.bBoundToParent = true;
    imgLadderBgs[imgLadderBgs.Length] = img;
    AppendComponent(img, true);
    img = new Class'XInterface.GUIImage';
    img.ImageStyle = 2;
    img.WinHeight = Height * 0.6400000;
    img.WinWidth = Width - 0.0200000;
    img.WinTop = Top + 0.0100000;
    img.WinLeft = Left + 0.0100000;
    img.RenderWeight = 0.2000000;
    img.X1 = 0;
    img.Y1 = 0;
    img.X2 = 1023;
    img.Y2 = 767;
    img.bBoundToParent = true;
    imgLadderImgs[imgLadderImgs.Length] = img;
    AppendComponent(img, true);
    pB = new Class'XInterface.GUIProgressBar';
    pB.WinHeight = Height * 0.2000000;
    pB.WinWidth = Width - 0.0200000;
    pB.WinTop = (img.WinTop + img.WinHeight) + 0.0133330;
    pB.WinLeft = Left + 0.0100000;
    pB.RenderWeight = 0.2000000;
    pB.Low = 0.0000000;
    pB.High = float(GP.LengthOfLadder(LadderId));
    pB.Value = float(Min(GP.LadderProgress[LadderId], int(pB.High)));
    pB.bShowLow = false;
    pB.bShowHigh = false;
    pB.bShowValue = false;
    pB.CaptionWidth = 0.0000000;
    pB.ValueRightWidth = 0.0000000;
    pB.bBoundToParent = true;
    AppendComponent(pB);
    //return;    
}

function bool onLadderClick(GUIComponent Sender)
{
    // End:0x1A
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
    //return;    
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
            // End:0x12F
            break;
        // End:0x7B
        case GP.UT2K4GameLadder.default.LID_BR:
            btns = BREntries;
            adata = animBREntries;
            linit = 1;
            // End:0x12F
            break;
        // End:0xB6
        case GP.UT2K4GameLadder.default.LID_DOM:
            btns = DOMEntries;
            adata = animDOMEntries;
            linit = 2;
            // End:0x12F
            break;
        // End:0xF1
        case GP.UT2K4GameLadder.default.LID_AS:
            btns = ASEntries;
            adata = animASEntries;
            linit = 3;
            // End:0x12F
            break;
        // End:0x12C
        case GP.UT2K4GameLadder.default.LID_CHAMP:
            btns = CHAMPEntries;
            adata = animCHAMPEntries;
            linit = 4;
            // End:0x12F
            break;
        // End:0xFFFF
        default:
            break;
    }
    i = 0;
    J0x136:

    // End:0x1A5 [Loop If]
    if(i < btns.Length)
    {
        btns[i].SetVisibility(bVisible);
        // End:0x19B
        if(btns[i].ProgresBar != none)
        {
            btns[i].ProgresBar.bVisible = false;
        }
        i++;
        // [Loop Continue]
        goto J0x136;
    }
    // End:0x2DB
    if(bVisible)
    {
        // End:0x219
        if(int(LadderInit[linit]) != 0)
        {
            LadderInit[linit] = 0;
            i = 0;
            J0x1D6:

            // End:0x219 [Loop If]
            if(i < btns.Length)
            {
                btns[i].SetState(GP.LadderProgress[LadderId]);
                i++;
                // [Loop Continue]
                goto J0x1D6;
            }
        }
        DoAnimate(btns, adata);
        selBtn = Min(GP.LadderProgress[LadderId], btns.Length - 1);
        // End:0x26D
        if((selBtn >= btns.Length) || selBtn < 0)
        {
            return;
        }
        J0x26D:

        // End:0x2CB [Loop If]
        if(selBtn >= 0)
        {
            // End:0x2C1
            if(GP.getMinimalEntryFeeFor(btns[selBtn].MatchInfo) <= GP.Balance)
            {
                onMatchClick(btns[selBtn]);
                return;
            }
            selBtn--;
            // [Loop Continue]
            goto J0x26D;
        }
        onMatchClick(btns[0]);        
    }
    else
    {
        DoAnimate(btns, adata, true);
    }
    //return;    
}

function bool SetCompletedLadder(int offset, int LadderId)
{
    local bool isCompleted;

    isCompleted = GP.completedLadder(LadderId);
    return (GP.LadderProgress[LadderId] > -1) && !isCompleted;
    //return;    
}

function showChampButton(bool bActive)
{
    local Material Screenshot;
    local MapRecord MapRecord;

    btnChampFinal.bVisible = bActive;
    imgChampFinal.bVisible = bActive;
    btnChampFinal.bAcceptsInput = bActive;
    btnChampFinal.bNeverFocus = !bActive;
    // End:0x24F
    if(bActive)
    {
        btnChampFinal.MatchInfo = UT2K4MatchInfo(GP.GetMatchInfo(GP.UT2K4GameLadder.default.LID_CHAMP, GP.LadderProgress[GP.UT2K4GameLadder.default.LID_CHAMP]));
        btnChampFinal.MatchIndex = GP.LadderProgress[GP.UT2K4GameLadder.default.LID_CHAMP];
        btnChampFinal.LadderIndex = GP.UT2K4GameLadder.default.LID_CHAMP;
        // End:0x1B7
        if(GP.completedLadder(GP.UT2K4GameLadder.default.LID_CHAMP))
        {
            btnChampFinal.MatchIndex = GP.LengthOfLadder(GP.UT2K4GameLadder.default.LID_CHAMP) - 1;
            btnChampFinal.Graphic = Material(DynamicLoadObject("PlayerPictures.aDOM", Class'Engine.Material', true));            
        }
        else
        {
            MapRecord = Class'Engine.CacheManager'.static.GetMapRecord(btnChampFinal.MatchInfo.LevelName);
            Screenshot = Material(DynamicLoadObject(MapRecord.ScreenshotRef, Class'Engine.Material'));
            // End:0x230
            if(MaterialSequence(Screenshot) != none)
            {
                Screenshot = MaterialSequence(Screenshot).SequenceItems[0].Material;
            }
            btnChampFinal.Graphic = Screenshot;
        }
        OnChampClick(btnChampFinal);
    }
    //return;    
}

function bool OnChampClick(GUIComponent Sender)
{
    // End:0x23
    if(PreviousLadder == GP.UT2K4GameLadder.default.LID_CHAMP)
    {
        return true;
    }
    // End:0x3E
    if(PreviousLadder > -1)
    {
        setLadderVisibility(PreviousLadder, false);
    }
    setLadderVisibility(GP.UT2K4GameLadder.default.LID_CHAMP, true);
    sbgLadderBg.Caption = GP.msgChampionship;
    PreviousLadder = GP.UT2K4GameLadder.default.LID_CHAMP;
    return true;
    //return;    
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
    //return;    
}

defaultproperties
{
    // Reference: GUIImage'GUI2K4_Decompressed.UT2K4SPTab_Ladder.SPLimgChamp1'
    begin object name="SPLimgChamp1" class=XInterface.GUIImage
        ImageStyle=2
        WinTop=0.0643220
        WinLeft=0.4376950
        WinWidth=0.0628910
        WinHeight=0.0873050
        RenderWeight=0.3000000
        bBoundToParent=true
    end object
    imgChamp[0]=SPLimgChamp1
    // Reference: GUIImage'GUI2K4_Decompressed.UT2K4SPTab_Ladder.SPLimgChamp2'
    begin object name="SPLimgChamp2" class=XInterface.GUIImage
        ImageStyle=2
        WinTop=0.1502600
        WinLeft=0.4376950
        WinWidth=0.0628910
        WinHeight=0.0873050
        RenderWeight=0.3000000
        bBoundToParent=true
    end object
    imgChamp[1]=SPLimgChamp2
    // Reference: GUIImage'GUI2K4_Decompressed.UT2K4SPTab_Ladder.SPLimgChamp3'
    begin object name="SPLimgChamp3" class=XInterface.GUIImage
        ImageStyle=2
        WinTop=0.0643220
        WinLeft=0.5001950
        WinWidth=0.0628910
        WinHeight=0.0873050
        RenderWeight=0.3000000
        bBoundToParent=true
    end object
    imgChamp[2]=SPLimgChamp3
    // Reference: GUIImage'GUI2K4_Decompressed.UT2K4SPTab_Ladder.SPLimgChamp4'
    begin object name="SPLimgChamp4" class=XInterface.GUIImage
        ImageStyle=2
        WinTop=0.1502600
        WinLeft=0.5001950
        WinWidth=0.0628910
        WinHeight=0.0873050
        RenderWeight=0.3000000
        bBoundToParent=true
    end object
    imgChamp[3]=SPLimgChamp4
    // Reference: GUIImage'GUI2K4_Decompressed.UT2K4SPTab_Ladder.SPLimgChampBar1'
    begin object name="SPLimgChampBar1" class=XInterface.GUIImage
        ImageStyle=2
        WinTop=0.1057290
        WinLeft=0.1242180
        WinWidth=0.3130860
        WinHeight=0.0039060
        bBoundToParent=true
    end object
    imgChampBars[0]=SPLimgChampBar1
    // Reference: GUIImage'GUI2K4_Decompressed.UT2K4SPTab_Ladder.SPLimgChampBar2'
    begin object name="SPLimgChampBar2" class=XInterface.GUIImage
        ImageStyle=2
        WinTop=0.1942180
        WinLeft=0.2410160
        WinWidth=0.1975390
        WinHeight=0.0039060
        bBoundToParent=true
    end object
    imgChampBars[1]=SPLimgChampBar2
    // Reference: GUIImage'GUI2K4_Decompressed.UT2K4SPTab_Ladder.SPLimgChampBar3'
    begin object name="SPLimgChampBar3" class=XInterface.GUIImage
        ImageStyle=2
        WinTop=0.1057290
        WinLeft=0.5630850
        WinWidth=0.3130860
        WinHeight=0.0039060
        bBoundToParent=true
    end object
    imgChampBars[2]=SPLimgChampBar3
    // Reference: GUIImage'GUI2K4_Decompressed.UT2K4SPTab_Ladder.SPLimgChampBar4'
    begin object name="SPLimgChampBar4" class=XInterface.GUIImage
        ImageStyle=2
        WinTop=0.1942700
        WinLeft=0.5630850
        WinWidth=0.1955860
        WinHeight=0.0039060
        bBoundToParent=true
    end object
    imgChampBars[3]=SPLimgChampBar4
    // Reference: GUILabel'GUI2K4_Decompressed.UT2K4SPTab_Ladder.SPLlblLadder1'
    begin object name="SPLlblLadder1" class=XInterface.GUILabel
        TextAlign=1
        TextColor=(R=14,G=41,B=106,A=255)
        ShadowColor=(R=0,G=0,B=0,A=128)
        ShadowOffsetX=1.0000000
        ShadowOffsetY=1.0000000
        StyleName="NoBackground"
        WinTop=0.0608330
        WinLeft=0.1184370
        WinWidth=0.3475000
        WinHeight=0.0431250
        bBoundToParent=true
    end object
    lblLadders[0]=SPLlblLadder1
    // Reference: GUILabel'GUI2K4_Decompressed.UT2K4SPTab_Ladder.SPLlblLadder2'
    begin object name="SPLlblLadder2" class=XInterface.GUILabel
        TextAlign=1
        TextColor=(R=14,G=41,B=106,A=255)
        ShadowColor=(R=0,G=0,B=0,A=128)
        ShadowOffsetX=1.0000000
        ShadowOffsetY=1.0000000
        StyleName="NoBackground"
        WinTop=0.1491670
        WinLeft=0.2428130
        WinWidth=0.2231220
        WinHeight=0.0431250
        bBoundToParent=true
    end object
    lblLadders[1]=SPLlblLadder2
    // Reference: GUILabel'GUI2K4_Decompressed.UT2K4SPTab_Ladder.SPLlblLadder3'
    begin object name="SPLlblLadder3" class=XInterface.GUILabel
        TextAlign=1
        TextColor=(R=14,G=41,B=106,A=255)
        ShadowColor=(R=0,G=0,B=0,A=128)
        ShadowOffsetX=1.0000000
        ShadowOffsetY=1.0000000
        StyleName="NoBackground"
        WinTop=0.0608330
        WinLeft=0.5440640
        WinWidth=0.3462500
        WinHeight=0.0431250
        bBoundToParent=true
    end object
    lblLadders[2]=SPLlblLadder3
    // Reference: GUILabel'GUI2K4_Decompressed.UT2K4SPTab_Ladder.SPLlblLadder4'
    begin object name="SPLlblLadder4" class=XInterface.GUILabel
        TextAlign=1
        TextColor=(R=14,G=41,B=106,A=255)
        ShadowColor=(R=0,G=0,B=0,A=128)
        ShadowOffsetX=1.0000000
        ShadowOffsetY=1.0000000
        StyleName="NoBackground"
        WinTop=0.1491660
        WinLeft=0.5378180
        WinWidth=0.2218740
        WinHeight=0.0431250
        bBoundToParent=true
    end object
    lblLadders[3]=SPLlblLadder4
    // Reference: GUISectionBackground'GUI2K4_Decompressed.UT2K4SPTab_Ladder.SPLimgLadderBg'
    begin object name="SPLimgLadderBg" class=XInterface.GUISectionBackground
        Caption="??? ??? ????"
        WinTop=0.7387290
        WinLeft=0.0150000
        WinWidth=0.9700020
        WinHeight=0.2187500
        bBoundToParent=true
        OnPreDraw=SPLimgLadderBg.InternalPreDraw
    end object
    sbgLadderBg=SPLimgLadderBg
    // Reference: AltSectionBackground'GUI2K4_Decompressed.UT2K4SPTab_Ladder.SPLsbgChallengeBg'
    begin object name="SPLsbgChallengeBg" class=GUI2K4_Decompressed.AltSectionBackground
        Caption="??"
        WinTop=0.2594870
        WinLeft=0.2812500
        WinWidth=0.4437500
        WinHeight=0.1403060
        bBoundToParent=true
        OnPreDraw=SPLsbgChallengeBg.InternalPreDraw
    end object
    sbgChallengeBg=SPLsbgChallengeBg
    // Reference: GUIComboBox'GUI2K4_Decompressed.UT2K4SPTab_Ladder.SPLcbChallenges'
    begin object name="SPLcbChallenges" class=XInterface.GUIComboBox
        bReadOnly=true
        bShowListOnFocus=true
        Hint="?? ?? ??"
        WinTop=0.3150650
        WinLeft=0.2949850
        WinWidth=0.4173470
        WinHeight=0.0486480
        TabOrder=2
        bBoundToParent=true
        OnChange=UT2K4SPTab_Ladder.OnChallengeSelect
        OnKeyEvent=SPLcbChallenges.InternalOnKeyEvent
    end object
    cbChallenges=SPLcbChallenges
    // Reference: UT2K4LadderButton'GUI2K4_Decompressed.UT2K4SPTab_Ladder.SPLbtnChampFinal'
    begin object name="SPLbtnChampFinal" class=GUI2K4_Decompressed.UT2K4LadderButton
        WinTop=0.0943220
        WinLeft=0.4586330
        TabOrder=1
        bBoundToParent=true
        bAcceptsInput=false
        OnClick=UT2K4SPTab_Ladder.OnChampClick
        OnDblClick=UT2K4SPTab_Ladder.onMatchDblClick
        OnKeyEvent=SPLbtnChampFinal.InternalOnKeyEvent
    end object
    btnChampFinal=SPLbtnChampFinal
    // Reference: GUIImage'GUI2K4_Decompressed.UT2K4SPTab_Ladder.SPLimgChampFinal'
    begin object name="SPLimgChampFinal" class=XInterface.GUIImage
        ImageStyle=2
        WinTop=0.0648950
        WinLeft=0.4379300
        WinWidth=0.1257220
        WinHeight=0.1726730
        RenderWeight=0.3100000
        bBoundToParent=true
        bVisible=false
    end object
    imgChampFinal=SPLimgChampFinal
    PreviousLadder=-1
    LadderImageCompleted[0]="LadderShots.CTFMoneyShot"
    LadderImageCompleted[1]="LadderShots.BRMoneyShot"
    LadderImageCompleted[2]="LadderShots.DOMMoneyShot"
    LadderImageCompleted[3]="LadderShots.TeamDMMoneyShot"
    LadderImage[0]="LadderShots.CTFShot"
    LadderImage[1]="LadderShots.BRShot"
    LadderImage[2]="LadderShots.DOMShot"
    LadderImage[3]="LadderShots.TeamDMShot"
    msgSelectChal="??? ??? ??????"
    PanelCaption="??"
}