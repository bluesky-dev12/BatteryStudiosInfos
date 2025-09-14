class Browser_OpenIP extends UT2K3GUIPage
    editinlinenew
    instanced;

var export editinline moEditBox MyIpAddress;
var export editinline Browser_ServerListPageFavorites MyFavoritesPage;

function InitComponent(GUIController pMyController, GUIComponent myOwner)
{
    super(GUIPage).InitComponent(pMyController, myOwner);
    MyIpAddress = moEditBox(Controls[1]);
    MyIpAddress.MyEditBox.AllowedCharSet = "0123456789.:";
    //return;    
}

function bool InternalOnClick(GUIComponent Sender)
{
    local ServerResponseLine S;
    local string Address, IPString, portString;
    local int colonPos, portNum;

    // End:0xF8
    if(Sender == Controls[4])
    {
        Address = MyIpAddress.GetText();
        // End:0x35
        if(Address == "")
        {
            return true;
        }
        colonPos = InStr(Address, ":");
        // End:0x69
        if(colonPos < 0)
        {
            IPString = Address;
            portNum = 7777;            
        }
        else
        {
            IPString = Left(Address, colonPos);
            portString = Mid(Address, colonPos + 1);
            portNum = int(portString);
        }
        S.IP = IPString;
        S.Port = portNum;
        S.QueryPort = portNum + 1;
        S.ServerName = "Unknown";
        MyFavoritesPage.MyAddFavorite(S);
    }
    Controller.CloseMenu(false);
    return true;
    //return;    
}

defaultproperties
{
    // Reference: GUIButton'XInterface_Decompressed.Browser_OpenIP.VidOKBackground'
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
    // Reference: moEditBox'XInterface_Decompressed.Browser_OpenIP.IpEntryBox'
    begin object name="IpEntryBox" class=XInterface_Decompressed.moEditBox
        LabelJustification=2
        CaptionWidth=0.5500000
        Caption="IP Address: "
        LabelFont="UT2SmallFont"
        LabelColor=(R=255,G=255,B=255,A=255)
        OnCreateComponent=IpEntryBox.InternalOnCreateComponent
        WinTop=0.4666670
        WinLeft=0.1600000
        WinHeight=0.0500000
    end object
    Controls[1]=IpEntryBox
    // Reference: GUIButton'XInterface_Decompressed.Browser_OpenIP.CancelButton'
    begin object name="CancelButton" class=XInterface_Decompressed.GUIButton
        Caption="Cancel"
        WinTop=0.7500000
        WinLeft=0.6500000
        WinWidth=0.2000000
        bBoundToParent=true
        OnClick=Browser_OpenIP.InternalOnClick
        OnKeyEvent=CancelButton.InternalOnKeyEvent
    end object
    Controls[2]=CancelButton
    // Reference: GUILabel'XInterface_Decompressed.Browser_OpenIP.OpenIPDesc'
    begin object name="OpenIPDesc" class=XInterface_Decompressed.GUILabel
        Caption="Enter New IP Address"
        TextAlign=1
        TextColor=(R=230,G=200,B=0,A=255)
        TextFont="UT2HeaderFont"
        WinTop=0.4000000
        WinHeight=32.0000000
    end object
    Controls[3]=OpenIPDesc
    // Reference: GUIButton'XInterface_Decompressed.Browser_OpenIP.OkButton'
    begin object name="OkButton" class=XInterface_Decompressed.GUIButton
        Caption="OK"
        WinTop=0.7500000
        WinLeft=0.1250000
        WinWidth=0.2000000
        bBoundToParent=true
        OnClick=Browser_OpenIP.InternalOnClick
        OnKeyEvent=OkButton.InternalOnKeyEvent
    end object
    Controls[4]=OkButton
    WinTop=0.3750000
    WinHeight=0.2500000
}