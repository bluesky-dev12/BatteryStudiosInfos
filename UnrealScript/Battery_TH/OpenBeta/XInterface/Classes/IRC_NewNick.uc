class IRC_NewNick extends UT2K3GUIPage
    editinlinenew
    instanced;

var export editinline moEditBox MyNewNick;
var export editinline IRC_System SystemPage;
var export editinline GUILabel NewNickPrompt;

function InitComponent(GUIController MyController, GUIComponent myOwner)
{
    super(GUIPage).InitComponent(MyController, myOwner);
    MyNewNick = moEditBox(Controls[1]);
    NewNickPrompt = GUILabel(Controls[2]);
    MyNewNick.SetText("");
    //return;    
}

function bool InternalOnClick(GUIComponent Sender)
{
    local string NewNick;

    // End:0x6E
    if(Sender == Controls[3])
    {
        NewNick = MyNewNick.GetText();
        // End:0x35
        if(NewNick == "")
        {
            return true;
        }
        Log("NewNick " $ NewNick);
        SystemPage.Link.SendCommandText("NICK " $ NewNick);
    }
    Controller.CloseMenu(false);
    return true;
    //return;    
}

defaultproperties
{
    // Reference: GUIButton'XInterface_Decompressed.IRC_NewNick.VidOKBackground'
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
    // Reference: moEditBox'XInterface_Decompressed.IRC_NewNick.NewNickEntry'
    begin object name="NewNickEntry" class=XInterface_Decompressed.moEditBox
        LabelJustification=2
        CaptionWidth=0.5500000
        Caption="? ??: "
        LabelFont="UT2SmallFont"
        LabelColor=(R=255,G=255,B=255,A=255)
        OnCreateComponent=NewNickEntry.InternalOnCreateComponent
        WinTop=0.4666670
        WinLeft=0.1600000
        WinHeight=0.0500000
    end object
    Controls[1]=NewNickEntry
    // Reference: GUILabel'XInterface_Decompressed.IRC_NewNick.NickMesg'
    begin object name="NickMesg" class=XInterface_Decompressed.GUILabel
        TextAlign=1
        TextColor=(R=230,G=200,B=0,A=255)
        TextFont="UT2HeaderFont"
        WinTop=0.4000000
        WinHeight=32.0000000
    end object
    Controls[2]=NickMesg
    // Reference: GUIButton'XInterface_Decompressed.IRC_NewNick.OkButton'
    begin object name="OkButton" class=XInterface_Decompressed.GUIButton
        Caption="??"
        WinTop=0.7500000
        WinLeft=0.4000000
        WinWidth=0.2000000
        bBoundToParent=true
        OnClick=IRC_NewNick.InternalOnClick
        OnKeyEvent=OkButton.InternalOnKeyEvent
    end object
    Controls[3]=OkButton
    WinTop=0.3750000
    WinHeight=0.2500000
}