class UT2StatsPrompt extends UT2K3GUIPage
    editinlinenew
    instanced;

//var delegate<OnStatsConfigured> __OnStatsConfigured__Delegate;

delegate OnStatsConfigured()
{
    //return;    
}

function InitComponent(GUIController MyController, GUIComponent myOwner)
{
    super(GUIPage).InitComponent(MyController, myOwner);
    PlayerOwner().ClearProgressMessages();
    //return;    
}

function bool InternalOnClick(GUIComponent Sender)
{
    Controller.CloseMenu(false);
    return true;
    //return;    
}

function ReOpen()
{
    // End:0x45
    if((Len(PlayerOwner().StatsUsername) >= 4) && Len(PlayerOwner().StatsPassword) >= 6)
    {
        Controller.CloseMenu();
        OnStatsConfigured();
    }
    //return;    
}

defaultproperties
{
    OnReOpen=UT2StatsPrompt.ReOpen
    // Reference: GUIButton'XInterface_Decompressed.UT2StatsPrompt.PromptBackground'
    begin object name="PromptBackground" class=XInterface_Decompressed.GUIButton
        StyleName="SquareBar"
        WinHeight=1.0000000
        bBoundToParent=true
        bScaleToParent=true
        bAcceptsInput=false
        bNeverFocus=true
        OnKeyEvent=PromptBackground.InternalOnKeyEvent
    end object
    Controls[0]=PromptBackground
    // Reference: GUIButton'XInterface_Decompressed.UT2StatsPrompt.YesButton'
    begin object name="YesButton" class=XInterface_Decompressed.GUIButton
        Caption="?"
        WinTop=0.8100000
        WinLeft=0.1250000
        WinWidth=0.2000000
        bBoundToParent=true
        OnClick=UT2StatsPrompt.InternalOnClick
        OnKeyEvent=YesButton.InternalOnKeyEvent
    end object
    Controls[1]=YesButton
    // Reference: GUIButton'XInterface_Decompressed.UT2StatsPrompt.NoButton'
    begin object name="NoButton" class=XInterface_Decompressed.GUIButton
        Caption="???"
        WinTop=0.8100000
        WinLeft=0.6500000
        WinWidth=0.2000000
        bBoundToParent=true
        OnClick=UT2StatsPrompt.InternalOnClick
        OnKeyEvent=NoButton.InternalOnKeyEvent
    end object
    Controls[2]=NoButton
    // Reference: GUILabel'XInterface_Decompressed.UT2StatsPrompt.PromptHeader'
    begin object name="PromptHeader" class=XInterface_Decompressed.GUILabel
        Caption="? ??? UT2004 ??? ?????!"
        TextAlign=1
        TextColor=(R=220,G=220,B=220,A=255)
        TextFont="UT2HeaderFont"
        bMultiLine=true
        WinTop=0.3541660
        WinHeight=0.0515630
    end object
    Controls[3]=PromptHeader
    // Reference: GUILabel'XInterface_Decompressed.UT2StatsPrompt.PromptDesc'
    begin object name="PromptDesc" class=XInterface_Decompressed.GUILabel
        Caption="????? ?? ?? ???? ????? ??? ? ? ??? ??? ? ???? .||??? ?? ??? ??? ? ????.||??? ????? ????? ????????"
        TextAlign=1
        TextColor=(R=220,G=180,B=0,A=255)
        bMultiLine=true
        WinTop=0.4229170
        WinHeight=0.2562510
    end object
    Controls[4]=PromptDesc
    WinTop=0.3250000
    WinHeight=0.3250000
}