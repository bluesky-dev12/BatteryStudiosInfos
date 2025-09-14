class UT2K4Tab_MidGameHelp extends MidGamePanel
    editinlinenew
    instanced;

var bool bReceivedGameClass;
var() automated GUISectionBackground sb_GameDesc;
var() automated GUISectionBackground sb_Hints;
var() automated GUIScrollTextBox GameDescriptionBox;
var() automated GUIScrollTextBox HintsBox;
var() automated GUILabel HintCountLabel;
var() automated GUIButton PrevHintButton;
var() automated GUIButton NextHintButton;
var Class<GameInfo> GameClass;
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
    //return;    
}

function ShowPanel(bool bShow)
{
    super(GUITabPanel).ShowPanel(bShow);
    // End:0x31
    if(bShow && !bReceivedGameClass)
    {
        SetTimer(1.0000000, true);
        Timer();
    }
    //return;    
}

function Timer()
{
    local PlayerController PC;
    local int i;

    PC = PlayerOwner();
    // End:0x1BC
    if(((PC != none) && PC.GameReplicationInfo != none) && PC.GameReplicationInfo.GameClass != "")
    {
        GameClass = Class<GameInfo>(DynamicLoadObject(PC.GameReplicationInfo.GameClass, Class'Core.Class'));
        // End:0x1BC
        if(GameClass != none)
        {
            GameDescriptionBox.SetContent(GameClass.default.Description);
            AllGameHints = GameClass.static.GetAllLoadHints();
            // End:0x1B1
            if(AllGameHints.Length > 0)
            {
                i = 0;
                J0xC7:

                // End:0x159 [Loop If]
                if(i < AllGameHints.Length)
                {
                    AllGameHints[i] = GameClass.static.ParseLoadingHint(AllGameHints[i], PC, HintsBox.Style.FontColors[int(HintsBox.MenuState)]);
                    // End:0x14F
                    if(AllGameHints[i] == "")
                    {
                        AllGameHints.Remove(i, 1);
                        i--;
                    }
                    i++;
                    // [Loop Continue]
                    goto J0xC7;
                }
                HintsBox.SetContent(AllGameHints[CurrentHintIndex]);
                HintCountLabel.Caption = (string(CurrentHintIndex + 1) @ "/") @ string(AllGameHints.Length);
                EnableComponent(PrevHintButton);
                EnableComponent(NextHintButton);
            }
            KillTimer();
            bReceivedGameClass = true;
        }
    }
    //return;    
}

function bool ButtonClicked(GUIComponent Sender)
{
    // End:0x33
    if(Sender == PrevHintButton)
    {
        CurrentHintIndex--;
        // End:0x30
        if(CurrentHintIndex < 0)
        {
            CurrentHintIndex = AllGameHints.Length - 1;
        }        
    }
    else
    {
        // End:0x60
        if(Sender == NextHintButton)
        {
            CurrentHintIndex++;
            // End:0x60
            if(CurrentHintIndex >= AllGameHints.Length)
            {
                CurrentHintIndex = 0;
            }
        }
    }
    HintsBox.SetContent(AllGameHints[CurrentHintIndex]);
    HintCountLabel.Caption = (string(CurrentHintIndex + 1) @ "/") @ string(AllGameHints.Length);
    return true;
    //return;    
}

function bool FixUp(Canvas C)
{
    local float t, H, L, W, XL;

    H = 20.0000000;
    t = (sb_Hints.ActualTop() + sb_Hints.ActualHeight()) - float(27);
    PrevHintButton.WinLeft = sb_Hints.ActualLeft() + float(40);
    PrevHintButton.WinTop = t;
    PrevHintButton.WinHeight = H;
    NextHintButton.WinLeft = ((sb_Hints.ActualLeft() + sb_Hints.ActualWidth()) - float(40)) - NextHintButton.ActualWidth();
    NextHintButton.WinTop = t;
    NextHintButton.WinHeight = H;
    L = PrevHintButton.ActualLeft() + PrevHintButton.ActualWidth();
    W = NextHintButton.ActualLeft() - L;
    XL = HintCountLabel.ActualWidth();
    L = (L + (W / float(2))) - (XL / float(2));
    HintCountLabel.WinLeft = L;
    HintCountLabel.WinTop = t;
    HintCountLabel.WinWidth = XL;
    HintCountLabel.WinHeight = H;
    return false;
    //return;    
}

defaultproperties
{
    // Reference: AltSectionBackground'GUI2K4_Decompressed.UT2K4Tab_MidGameHelp.sbGameDesc'
    begin object name="sbGameDesc" class=GUI2K4_Decompressed.AltSectionBackground
        bFillClient=true
        Caption="?? ??"
        WinTop=0.0204380
        WinLeft=0.0236250
        WinWidth=0.9448750
        WinHeight=0.4557830
        bBoundToParent=true
        bScaleToParent=true
        OnPreDraw=sbGameDesc.InternalPreDraw
    end object
    sb_GameDesc=sbGameDesc
    // Reference: AltSectionBackground'GUI2K4_Decompressed.UT2K4Tab_MidGameHelp.sbHints'
    begin object name="sbHints" class=GUI2K4_Decompressed.AltSectionBackground
        bFillClient=true
        Caption="??"
        WinTop=0.4829210
        WinLeft=0.0551250
        WinWidth=0.8818750
        WinHeight=0.4361250
        bBoundToParent=true
        bScaleToParent=true
        OnPreDraw=sbHints.InternalPreDraw
    end object
    sb_Hints=sbHints
    // Reference: GUIScrollTextBox'GUI2K4_Decompressed.UT2K4Tab_MidGameHelp.InfoText'
    begin object name="InfoText" class=XInterface.GUIScrollTextBox
        bNoTeletype=true
        CharDelay=0.0025000
        EOLDelay=0.0000000
        TextAlign=1
        OnCreateComponent=InfoText.InternalOnCreateComponent
        WinTop=0.1437500
        WinHeight=0.3160160
        bBoundToParent=true
        bScaleToParent=true
        bNeverFocus=true
    end object
    GameDescriptionBox=InfoText
    // Reference: GUIScrollTextBox'GUI2K4_Decompressed.UT2K4Tab_MidGameHelp.HintText'
    begin object name="HintText" class=XInterface.GUIScrollTextBox
        bNoTeletype=true
        CharDelay=0.0025000
        EOLDelay=0.0000000
        TextAlign=1
        OnCreateComponent=HintText.InternalOnCreateComponent
        WinTop=0.5937500
        WinHeight=0.2660160
        bBoundToParent=true
        bScaleToParent=true
        bNeverFocus=true
    end object
    HintsBox=HintText
    // Reference: GUILabel'GUI2K4_Decompressed.UT2K4Tab_MidGameHelp.HintCount'
    begin object name="HintCount" class=XInterface.GUILabel
        TextAlign=1
        TextColor=(R=255,G=255,B=255,A=255)
        WinTop=0.9000000
        WinLeft=0.3000000
        WinWidth=0.4000000
        WinHeight=32.0000000
    end object
    HintCountLabel=HintCount
    // Reference: GUIButton'GUI2K4_Decompressed.UT2K4Tab_MidGameHelp.PrevHint'
    begin object name="PrevHint" class=XInterface.GUIButton
        Caption="?? ??"
        bAutoSize=true
        MenuState=4
        WinTop=0.9000000
        WinLeft=0.1315000
        WinWidth=0.2268010
        WinHeight=0.0421250
        TabOrder=0
        OnClick=UT2K4Tab_MidGameHelp.ButtonClicked
        OnKeyEvent=PrevHint.InternalOnKeyEvent
    end object
    PrevHintButton=PrevHint
    // Reference: GUIButton'GUI2K4_Decompressed.UT2K4Tab_MidGameHelp.NextHint'
    begin object name="NextHint" class=XInterface.GUIButton
        Caption="?? ??"
        bAutoSize=true
        MenuState=4
        WinTop=0.9000000
        WinLeft=0.6984250
        WinWidth=0.1594690
        WinHeight=0.0421250
        TabOrder=1
        OnClick=UT2K4Tab_MidGameHelp.ButtonClicked
        OnKeyEvent=NextHint.InternalOnKeyEvent
    end object
    NextHintButton=NextHint
    OnPreDraw=UT2K4Tab_MidGameHelp.FixUp
}