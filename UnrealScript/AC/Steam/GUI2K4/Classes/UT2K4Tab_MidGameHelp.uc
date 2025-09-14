/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path GUI2K4\Classes\UT2K4Tab_MidGameHelp.uc
 * Package Imports:
 *	GUI2K4
 *	XInterface
 *	Core
 *
 * Stats:
 *	Properties:11
 *	Functions:5
 *
 *******************************************************************************/
class UT2K4Tab_MidGameHelp extends MidGamePanel
    editinlinenew
    instanced;

var bool bReceivedGameClass;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify GUISectionBackground sb_GameDesc;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify GUISectionBackground sb_Hints;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify GUIScrollTextBox GameDescriptionBox;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify GUIScrollTextBox HintsBox;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify GUILabel HintCountLabel;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify GUIButton PrevHintButton;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify GUIButton NextHintButton;
var class<GameInfo> GameClass;
var array<string> AllGameHints;
var int CurrentHintIndex;

function InitComponent(GUIController MyController, GUIComponent myOwner)
{
    super(GUIPanel).InitComponent(MyController, myOwner);
    sb_GameDesc.ManageComponent(GameDescriptionBox);
    sb_Hints.ManageComponent(HintsBox);
    PrevHintButton.bBoundToParent = false;
    PrevHintButton.bScaleToParent = false;
    NextHintButton.bBoundToParent = false;
    NextHintButton.bScaleToParent = false;
    HintCountLabel.bBoundToParent = false;
    HintCountLabel.bScaleToParent = false;
}

function ShowPanel(bool bShow)
{
    super(GUITabPanel).ShowPanel(bShow);
    // End:0x31
    if(bShow && !bReceivedGameClass)
    {
        SetTimer(1.0, true);
        Timer();
    }
}

function Timer()
{
    local PlayerController PC;
    local int i;

    PC = PlayerOwner();
    // End:0x1bc
    if(PC != none && PC.GameReplicationInfo != none && PC.GameReplicationInfo.GameClass != "")
    {
        GameClass = class<GameInfo>(DynamicLoadObject(PC.GameReplicationInfo.GameClass, class'Class'));
        // End:0x1bc
        if(GameClass != none)
        {
            GameDescriptionBox.SetContent(GameClass.default.Description);
            AllGameHints = GameClass.static.GetAllLoadHints();
            // End:0x1b1
            if(AllGameHints.Length > 0)
            {
                i = 0;
                J0xc7:
                // End:0x159 [While If]
                if(i < AllGameHints.Length)
                {
                    AllGameHints[i] = GameClass.static.ParseLoadingHint(AllGameHints[i], PC, HintsBox.Style.FontColors[HintsBox.MenuState]);
                    // End:0x14f
                    if(AllGameHints[i] == "")
                    {
                        AllGameHints.Remove(i, 1);
                        -- i;
                    }
                    ++ i;
                    // This is an implied JumpToken; Continue!
                    goto J0xc7;
                }
                HintsBox.SetContent(AllGameHints[CurrentHintIndex]);
                HintCountLabel.Caption = string(CurrentHintIndex + 1) @ "/" @ string(AllGameHints.Length);
                EnableComponent(PrevHintButton);
                EnableComponent(NextHintButton);
            }
            KillTimer();
            bReceivedGameClass = true;
        }
    }
}

function bool ButtonClicked(GUIComponent Sender)
{
    // End:0x33
    if(Sender == PrevHintButton)
    {
        -- CurrentHintIndex;
        // End:0x30
        if(CurrentHintIndex < 0)
        {
            CurrentHintIndex = AllGameHints.Length - 1;
        }
    }
    // End:0x60
    else
    {
        // End:0x60
        if(Sender == NextHintButton)
        {
            ++ CurrentHintIndex;
            // End:0x60
            if(CurrentHintIndex >= AllGameHints.Length)
            {
                CurrentHintIndex = 0;
            }
        }
    }
    HintsBox.SetContent(AllGameHints[CurrentHintIndex]);
    HintCountLabel.Caption = string(CurrentHintIndex + 1) @ "/" @ string(AllGameHints.Length);
    return true;
}

function bool FixUp(Canvas C)
{
    local float t, H, L, W, XL;

    H = 20.0;
    t = sb_Hints.ActualTop() + sb_Hints.ActualHeight() - float(27);
    PrevHintButton.WinLeft = sb_Hints.ActualLeft() + float(40);
    PrevHintButton.WinTop = t;
    PrevHintButton.WinHeight = H;
    NextHintButton.WinLeft = sb_Hints.ActualLeft() + sb_Hints.ActualWidth() - float(40) - NextHintButton.ActualWidth();
    NextHintButton.WinTop = t;
    NextHintButton.WinHeight = H;
    L = PrevHintButton.ActualLeft() + PrevHintButton.ActualWidth();
    W = NextHintButton.ActualLeft() - L;
    XL = HintCountLabel.ActualWidth();
    L = L + W / float(2) - XL / float(2);
    HintCountLabel.WinLeft = L;
    HintCountLabel.WinTop = t;
    HintCountLabel.WinWidth = XL;
    HintCountLabel.WinHeight = H;
    return false;
}

defaultproperties
{
    begin object name=sbGameDesc class=AltSectionBackground
        bFillClient=true
        Caption="?? ??"
        WinTop=0.0204380
        WinLeft=0.0236250
        WinWidth=0.9448750
        WinHeight=0.4557830
        bBoundToParent=true
        bScaleToParent=true
        OnPreDraw=InternalPreDraw
    object end
    // Reference: AltSectionBackground'UT2K4Tab_MidGameHelp.sbGameDesc'
    sb_GameDesc=sbGameDesc
    begin object name=sbHints class=AltSectionBackground
        bFillClient=true
        Caption="??"
        WinTop=0.4829210
        WinLeft=0.0551250
        WinWidth=0.8818750
        WinHeight=0.4361250
        bBoundToParent=true
        bScaleToParent=true
        OnPreDraw=InternalPreDraw
    object end
    // Reference: AltSectionBackground'UT2K4Tab_MidGameHelp.sbHints'
    sb_Hints=sbHints
    begin object name=InfoText class=GUIScrollTextBox
        bNoTeletype=true
        CharDelay=0.00250
        EOLDelay=0.0
        TextAlign=1
        OnCreateComponent=InternalOnCreateComponent
        WinTop=0.143750
        WinHeight=0.3160160
        bBoundToParent=true
        bScaleToParent=true
        bNeverFocus=true
    object end
    // Reference: GUIScrollTextBox'UT2K4Tab_MidGameHelp.InfoText'
    GameDescriptionBox=InfoText
    begin object name=HintText class=GUIScrollTextBox
        bNoTeletype=true
        CharDelay=0.00250
        EOLDelay=0.0
        TextAlign=1
        OnCreateComponent=InternalOnCreateComponent
        WinTop=0.593750
        WinHeight=0.2660160
        bBoundToParent=true
        bScaleToParent=true
        bNeverFocus=true
    object end
    // Reference: GUIScrollTextBox'UT2K4Tab_MidGameHelp.HintText'
    HintsBox=HintText
    begin object name=HintCount class=GUILabel
        TextAlign=1
        TextColor=(R=255,G=255,B=255,A=255)
        WinTop=0.90
        WinLeft=0.30
        WinWidth=0.40
        WinHeight=32.0
    object end
    // Reference: GUILabel'UT2K4Tab_MidGameHelp.HintCount'
    HintCountLabel=HintCount
    begin object name=PrevHint class=GUIButton
        Caption="?? ??"
        bAutoSize=true
        MenuState=4
        WinTop=0.90
        WinLeft=0.13150
        WinWidth=0.2268010
        WinHeight=0.0421250
        TabOrder=0
        OnClick=ButtonClicked
        OnKeyEvent=InternalOnKeyEvent
    object end
    // Reference: GUIButton'UT2K4Tab_MidGameHelp.PrevHint'
    PrevHintButton=PrevHint
    begin object name=NextHint class=GUIButton
        Caption="?? ??"
        bAutoSize=true
        MenuState=4
        WinTop=0.90
        WinLeft=0.6984250
        WinWidth=0.1594690
        WinHeight=0.0421250
        TabOrder=1
        OnClick=ButtonClicked
        OnKeyEvent=InternalOnKeyEvent
    object end
    // Reference: GUIButton'UT2K4Tab_MidGameHelp.NextHint'
    NextHintButton=NextHint
    OnPreDraw=FixUp
}