/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path GUI2K4\Classes\UT2K4ModFooter.uc
 * Package Imports:
 *	GUI2K4
 *	XInterface
 *	Core
 *
 * Stats:
 *	Properties:8
 *	Functions:3
 *
 *******************************************************************************/
class UT2K4ModFooter extends ButtonFooter
    editinlinenew
    instanced;

var() /*0x00000000-0x80000000*/ databinding export editinlinenotify GUIButton b_Activate;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify GUIButton b_Web;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify GUIButton b_Download;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify GUIButton b_Dump;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify GUIButton b_Watch;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify GUIButton b_Back;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify GUIButton b_Movie;
var export editinline UT2K4ModsAndDemos MyPage;

function InitComponent(GUIController MyController, GUIComponent myOwner)
{
    super.InitComponent(MyController, myOwner);
    MyPage = UT2K4ModsAndDemos(myOwner);
}

function bool BackClick(GUIComponent Sender)
{
    Controller.CloseMenu(false);
    return true;
}

function TabChange(int NewTag)
{
    local int i;
    local export editinline GUIButton B;

    i = 0;
    J0x07:
    // End:0x93 [While If]
    if(i < Components.Length)
    {
        B = GUIButton(Components[i]);
        // End:0x89
        if(B != none && B.Tag > 0)
        {
            // End:0x79
            if(B.Tag == NewTag)
            {
                B.SetVisibility(true);
            }
            // End:0x89
            else
            {
                B.SetVisibility(false);
            }
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x07;
    }
    SetupButtons("true");
}

defaultproperties
{
    begin object name=BB1 class=GUIButton
        Caption="??????"
        StyleName="FooterButton"
        Hint="? ??? ??? ????."
        WinTop=0.0856780
        WinLeft=0.8853520
        WinWidth=0.120
        WinHeight=0.0364820
        RenderWeight=2.0
        TabOrder=0
        Tag=1
        bBoundToParent=true
        bVisible=true
        OnKeyEvent=InternalOnKeyEvent
    object end
    // Reference: GUIButton'UT2K4ModFooter.BB1'
    b_Activate=BB1
    begin object name=BB2 class=GUIButton
        Caption="? ??? ??"
        StyleName="FooterButton"
        Hint="??? ??? ???? ??"
        WinTop=0.0856780
        WinLeft=0.8853520
        WinWidth=0.120
        WinHeight=0.0364820
        RenderWeight=2.00010
        TabOrder=1
        Tag=1
        bBoundToParent=true
        bVisible=true
        OnKeyEvent=InternalOnKeyEvent
    object end
    // Reference: GUIButton'UT2K4ModFooter.BB2'
    b_Web=BB2
    begin object name=BB3 class=GUIButton
        Caption="????"
        StyleName="FooterButton"
        Hint="???? ? ??????"
        WinTop=0.0856780
        WinLeft=0.8853520
        WinWidth=0.120
        WinHeight=0.0364820
        RenderWeight=2.00010
        TabOrder=2
        Tag=2
        bBoundToParent=true
        bVisible=true
        OnKeyEvent=InternalOnKeyEvent
    object end
    // Reference: GUIButton'UT2K4ModFooter.BB3'
    b_Download=BB3
    begin object name=BB5 class=GUIButton
        Caption="AVI ???"
        StyleName="FooterButton"
        Hint="??? ??? DIVX AVI? ?????"
        WinTop=0.0856780
        WinWidth=0.120
        WinHeight=0.0364820
        RenderWeight=2.00010
        TabOrder=3
        Tag=3
        bBoundToParent=true
        bVisible=true
        OnKeyEvent=InternalOnKeyEvent
    object end
    // Reference: GUIButton'UT2K4ModFooter.BB5'
    b_Dump=BB5
    begin object name=BB4 class=GUIButton
        Caption="????"
        StyleName="FooterButton"
        Hint="??? ??? ?????."
        WinTop=0.0856780
        WinWidth=0.120
        WinHeight=0.0364820
        RenderWeight=2.00010
        TabOrder=4
        Tag=3
        bBoundToParent=true
        bVisible=true
        OnKeyEvent=InternalOnKeyEvent
    object end
    // Reference: GUIButton'UT2K4ModFooter.BB4'
    b_Watch=BB4
    begin object name=BackB class=GUIButton
        Caption="??"
        StyleName="FooterButton"
        Hint="????? ????"
        WinTop=0.0856780
        WinWidth=0.120
        WinHeight=0.0364820
        RenderWeight=2.00020
        TabOrder=3
        Tag=0
        bBoundToParent=true
        OnClick=BackClick
        OnKeyEvent=InternalOnKeyEvent
    object end
    // Reference: GUIButton'UT2K4ModFooter.BackB'
    b_Back=BackB
    begin object name=BB66 class=GUIButton
        Caption="?????"
        StyleName="FooterButton"
        Hint="??? ????? "
        WinTop=0.0856780
        WinWidth=0.120
        WinHeight=0.0364820
        RenderWeight=2.00010
        TabOrder=4
        Tag=4
        bBoundToParent=true
        bVisible=true
        OnKeyEvent=InternalOnKeyEvent
    object end
    // Reference: GUIButton'UT2K4ModFooter.BB66'
    b_Movie=BB66
    Padding=0.30
    Margin=0.010
    Spacer=0.010
}