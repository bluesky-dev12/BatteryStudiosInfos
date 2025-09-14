class Browser_AddBuddy extends UT2K3GUIPage
    editinlinenew
    instanced;

var export editinline moEditBox MyNewBuddy;
var export editinline Browser_ServerListPageBuddy MyBuddyPage;

function InitComponent(GUIController pMyController, GUIComponent myOwner)
{
    super(GUIPage).InitComponent(pMyController, myOwner);
    MyNewBuddy = moEditBox(Controls[1]);
    //return;    
}

function bool InternalOnClick(GUIComponent Sender)
{
    local string buddyName;

    // End:0xB1
    if(Sender == Controls[4])
    {
        buddyName = MyNewBuddy.GetText();
        // End:0x35
        if(buddyName == "")
        {
            return true;
        }
        MyBuddyPage.Buddies.Length = MyBuddyPage.Buddies.Length + 1;
        MyBuddyPage.Buddies[MyBuddyPage.Buddies.Length - 1] = buddyName;
        MyBuddyPage.MyBuddyList.ItemCount = MyBuddyPage.Buddies.Length;
        MyBuddyPage.SaveConfig();
    }
    Controller.CloseMenu(false);
    return true;
    //return;    
}

defaultproperties
{
    // Reference: GUIButton'XInterface_Decompressed.Browser_AddBuddy.VidOKBackground'
    begin object name="VidOKBackground" class=XInterface_Decompressed.GUIButton
        StyleName="SquareBar"
        WinHeight=1.0000000
        bBoundToParent=true
        bScaleToParent=true
        bAcceptsInput=false
        bNeverFocus=true
        OnKeyEvent=VidOKBackground.InternalOnKeyEvent
    end object
    Controls[0]=VidOKBackground
    // Reference: moEditBox'XInterface_Decompressed.Browser_AddBuddy.BuddyEntryBox'
    begin object name="BuddyEntryBox" class=XInterface_Decompressed.moEditBox
        LabelJustification=2
        CaptionWidth=0.5500000
        Caption="?? ??: "
        LabelFont="UT2SmallFont"
        LabelColor=(R=255,G=255,B=255,A=255)
        OnCreateComponent=BuddyEntryBox.InternalOnCreateComponent
        WinTop=0.4666670
        WinLeft=0.1600000
        WinHeight=0.0500000
    end object
    Controls[1]=BuddyEntryBox
    // Reference: GUIButton'XInterface_Decompressed.Browser_AddBuddy.CancelButton'
    begin object name="CancelButton" class=XInterface_Decompressed.GUIButton
        Caption="????"
        WinTop=0.7500000
        WinLeft=0.6500000
        WinWidth=0.2000000
        bBoundToParent=true
        OnClick=Browser_AddBuddy.InternalOnClick
        OnKeyEvent=CancelButton.InternalOnKeyEvent
    end object
    Controls[2]=CancelButton
    // Reference: GUILabel'XInterface_Decompressed.Browser_AddBuddy.AddBuddyDesc'
    begin object name="AddBuddyDesc" class=XInterface_Decompressed.GUILabel
        Caption="?? ??"
        TextAlign=1
        TextColor=(R=230,G=200,B=0,A=255)
        TextFont="UT2HeaderFont"
        WinTop=0.4000000
        WinHeight=32.0000000
    end object
    Controls[3]=AddBuddyDesc
    // Reference: GUIButton'XInterface_Decompressed.Browser_AddBuddy.OkButton'
    begin object name="OkButton" class=XInterface_Decompressed.GUIButton
        Caption="??"
        WinTop=0.7500000
        WinLeft=0.1250000
        WinWidth=0.2000000
        bBoundToParent=true
        OnClick=Browser_AddBuddy.InternalOnClick
        OnKeyEvent=OkButton.InternalOnKeyEvent
    end object
    Controls[4]=OkButton
    WinTop=0.3750000
    WinHeight=0.2500000
}