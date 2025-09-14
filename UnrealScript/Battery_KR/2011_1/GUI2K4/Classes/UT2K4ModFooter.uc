class UT2K4ModFooter extends ButtonFooter
    editinlinenew
    instanced;

var() automated GUIButton b_Activate;
var() automated GUIButton b_Web;
var() automated GUIButton b_Download;
var() automated GUIButton b_Dump;
var() automated GUIButton b_Watch;
var() automated GUIButton b_Back;
var() automated GUIButton b_Movie;
var export editinline UT2K4ModsAndDemos MyPage;

function InitComponent(GUIController MyController, GUIComponent myOwner)
{
    super.InitComponent(MyController, myOwner);
    MyPage = UT2K4ModsAndDemos(myOwner);
    //return;    
}

function bool BackClick(GUIComponent Sender)
{
    Controller.CloseMenu(false);
    return true;
    //return;    
}

function TabChange(int NewTag)
{
    local int i;
    local export editinline GUIButton B;

    i = 0;
    J0x07:

    // End:0x93 [Loop If]
    if(i < Components.Length)
    {
        B = GUIButton(Components[i]);
        // End:0x89
        if((B != none) && B.Tag > 0)
        {
            // End:0x79
            if(B.Tag == NewTag)
            {
                B.SetVisibility(true);
                // [Explicit Continue]
                goto J0x89;
            }
            B.SetVisibility(false);
        }
        J0x89:

        i++;
        // [Loop Continue]
        goto J0x07;
    }
    SetupButtons("true");
    //return;    
}

defaultproperties
{
    // Reference: GUIButton'GUI2K4_Decompressed.UT2K4ModFooter.BB1'
    begin object name="BB1" class=XInterface.GUIButton
        Caption="??????"
        StyleName="FooterButton"
        Hint="? ??? ??? ????."
        WinTop=0.0856780
        WinLeft=0.8853520
        WinWidth=0.1200000
        WinHeight=0.0364820
        RenderWeight=2.0000000
        TabOrder=0
        Tag=1
        bBoundToParent=true
        bVisible=false
        OnKeyEvent=BB1.InternalOnKeyEvent
    end object
    b_Activate=BB1
    // Reference: GUIButton'GUI2K4_Decompressed.UT2K4ModFooter.BB2'
    begin object name="BB2" class=XInterface.GUIButton
        Caption="? ??? ??"
        StyleName="FooterButton"
        Hint="??? ??? ???? ??"
        WinTop=0.0856780
        WinLeft=0.8853520
        WinWidth=0.1200000
        WinHeight=0.0364820
        RenderWeight=2.0000999
        TabOrder=1
        Tag=1
        bBoundToParent=true
        bVisible=false
        OnKeyEvent=BB2.InternalOnKeyEvent
    end object
    b_Web=BB2
    // Reference: GUIButton'GUI2K4_Decompressed.UT2K4ModFooter.BB3'
    begin object name="BB3" class=XInterface.GUIButton
        Caption="????"
        StyleName="FooterButton"
        Hint="???? ? ??????"
        WinTop=0.0856780
        WinLeft=0.8853520
        WinWidth=0.1200000
        WinHeight=0.0364820
        RenderWeight=2.0000999
        TabOrder=2
        Tag=2
        bBoundToParent=true
        bVisible=false
        OnKeyEvent=BB3.InternalOnKeyEvent
    end object
    b_Download=BB3
    // Reference: GUIButton'GUI2K4_Decompressed.UT2K4ModFooter.BB5'
    begin object name="BB5" class=XInterface.GUIButton
        Caption="AVI ???"
        StyleName="FooterButton"
        Hint="??? ??? DIVX AVI? ?????"
        WinTop=0.0856780
        WinWidth=0.1200000
        WinHeight=0.0364820
        RenderWeight=2.0000999
        TabOrder=3
        Tag=3
        bBoundToParent=true
        bVisible=false
        OnKeyEvent=BB5.InternalOnKeyEvent
    end object
    b_Dump=BB5
    // Reference: GUIButton'GUI2K4_Decompressed.UT2K4ModFooter.BB4'
    begin object name="BB4" class=XInterface.GUIButton
        Caption="????"
        StyleName="FooterButton"
        Hint="??? ??? ?????."
        WinTop=0.0856780
        WinWidth=0.1200000
        WinHeight=0.0364820
        RenderWeight=2.0000999
        TabOrder=4
        Tag=3
        bBoundToParent=true
        bVisible=false
        OnKeyEvent=BB4.InternalOnKeyEvent
    end object
    b_Watch=BB4
    // Reference: GUIButton'GUI2K4_Decompressed.UT2K4ModFooter.BackB'
    begin object name="BackB" class=XInterface.GUIButton
        Caption="??"
        StyleName="FooterButton"
        Hint="????? ????"
        WinTop=0.0856780
        WinWidth=0.1200000
        WinHeight=0.0364820
        RenderWeight=2.0002000
        TabOrder=3
        Tag=0
        bBoundToParent=true
        OnClick=UT2K4ModFooter.BackClick
        OnKeyEvent=BackB.InternalOnKeyEvent
    end object
    b_Back=BackB
    // Reference: GUIButton'GUI2K4_Decompressed.UT2K4ModFooter.BB66'
    begin object name="BB66" class=XInterface.GUIButton
        Caption="?????"
        StyleName="FooterButton"
        Hint="??? ????? "
        WinTop=0.0856780
        WinWidth=0.1200000
        WinHeight=0.0364820
        RenderWeight=2.0000999
        TabOrder=4
        Tag=4
        bBoundToParent=true
        bVisible=false
        OnKeyEvent=BB66.InternalOnKeyEvent
    end object
    b_Movie=BB66
    Padding=0.3000000
    Margin=0.0100000
    Spacer=0.0100000
}