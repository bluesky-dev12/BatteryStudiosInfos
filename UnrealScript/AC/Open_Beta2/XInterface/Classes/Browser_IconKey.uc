class Browser_IconKey extends UT2K3GUIPage
    editinlinenew
    instanced;

function bool InternalOnClick(GUIComponent Sender)
{
    Controller.CloseMenu(false);
    return true;
    //return;    
}

function InitComponent(GUIController MyController, GUIComponent myOwner)
{
    local int i;

    super(GUIPage).InitComponent(MyController, myOwner);
    i = 0;
    J0x17:

    // End:0x99 [Loop If]
    if(i < 7)
    {
        GUIImage(Controls[3 + (2 * i)]).Image = Class'XInterface_Decompressed.Browser_ServersList'.default.Icons[i];
        GUILabel(Controls[4 + (2 * i)]).Caption = Class'XInterface_Decompressed.Browser_ServersList'.default.IconDescriptions[i];
        i++;
        // [Loop Continue]
        goto J0x17;
    }
    //return;    
}

defaultproperties
{
    bRequire640x480=false
    // Reference: GUIButton'XInterface_Decompressed.Browser_IconKey.DialogBackground'
    begin object name="DialogBackground" class=XInterface_Decompressed.GUIButton
        StyleName="ListBox"
        WinTop=0.2566670
        WinLeft=0.2500000
        WinWidth=0.5000000
        WinHeight=0.5562510
        bBoundToParent=true
        bScaleToParent=true
        bAcceptsInput=false
        bNeverFocus=true
        OnKeyEvent=DialogBackground.InternalOnKeyEvent
    end object
    Controls[0]=DialogBackground
    // Reference: GUIButton'XInterface_Decompressed.Browser_IconKey.OkButton'
    begin object name="OkButton" class=XInterface_Decompressed.GUIButton
        Caption="OK"
        WinTop=0.7500000
        WinLeft=0.4000000
        WinWidth=0.2000000
        OnClick=Browser_IconKey.InternalOnClick
        OnKeyEvent=OkButton.InternalOnKeyEvent
    end object
    Controls[1]=OkButton
    // Reference: GUILabel'XInterface_Decompressed.Browser_IconKey.DialogText'
    begin object name="DialogText" class=XInterface_Decompressed.GUILabel
        Caption="Server Icon Key"
        TextAlign=1
        TextColor=(R=220,G=180,B=0,A=255)
        TextFont="UT2HeaderFont"
        WinTop=0.2783340
        WinHeight=32.0000000
    end object
    Controls[2]=DialogText
    // Reference: GUIImage'XInterface_Decompressed.Browser_IconKey.Icon1'
    begin object name="Icon1" class=XInterface_Decompressed.GUIImage
        ImageStyle=2
        WinTop=0.3500000
        WinLeft=0.3000000
        WinWidth=16.0000000
        WinHeight=16.0000000
    end object
    Controls[3]=Icon1
    // Reference: GUILabel'XInterface_Decompressed.Browser_IconKey.Label1'
    begin object name="Label1" class=XInterface_Decompressed.GUILabel
        TextColor=(R=255,G=255,B=255,A=255)
        StyleName="TextLabel"
        WinTop=0.3400000
        WinLeft=0.3600000
        WinWidth=0.3500000
        WinHeight=32.0000000
    end object
    Controls[4]=Label1
    // Reference: GUIImage'XInterface_Decompressed.Browser_IconKey.Icon2'
    begin object name="Icon2" class=XInterface_Decompressed.GUIImage
        ImageStyle=2
        WinTop=0.4100000
        WinLeft=0.3000000
        WinWidth=16.0000000
        WinHeight=16.0000000
    end object
    Controls[5]=Icon2
    // Reference: GUILabel'XInterface_Decompressed.Browser_IconKey.Label2'
    begin object name="Label2" class=XInterface_Decompressed.GUILabel
        TextColor=(R=255,G=255,B=255,A=255)
        StyleName="TextLabel"
        WinTop=0.4000000
        WinLeft=0.3600000
        WinWidth=0.3500000
        WinHeight=32.0000000
    end object
    Controls[6]=Label2
    // Reference: GUIImage'XInterface_Decompressed.Browser_IconKey.Icon3'
    begin object name="Icon3" class=XInterface_Decompressed.GUIImage
        ImageStyle=2
        WinTop=0.4700000
        WinLeft=0.3000000
        WinWidth=16.0000000
        WinHeight=16.0000000
    end object
    Controls[7]=Icon3
    // Reference: GUILabel'XInterface_Decompressed.Browser_IconKey.Label3'
    begin object name="Label3" class=XInterface_Decompressed.GUILabel
        TextColor=(R=255,G=255,B=255,A=255)
        StyleName="TextLabel"
        WinTop=0.4600000
        WinLeft=0.3600000
        WinWidth=0.3500000
        WinHeight=32.0000000
    end object
    Controls[8]=Label3
    // Reference: GUIImage'XInterface_Decompressed.Browser_IconKey.Icon4'
    begin object name="Icon4" class=XInterface_Decompressed.GUIImage
        ImageStyle=2
        WinTop=0.5300000
        WinLeft=0.3000000
        WinWidth=16.0000000
        WinHeight=16.0000000
    end object
    Controls[9]=Icon4
    // Reference: GUILabel'XInterface_Decompressed.Browser_IconKey.Label4'
    begin object name="Label4" class=XInterface_Decompressed.GUILabel
        TextColor=(R=255,G=255,B=255,A=255)
        StyleName="TextLabel"
        WinTop=0.5200000
        WinLeft=0.3600000
        WinWidth=0.3500000
        WinHeight=32.0000000
    end object
    Controls[10]=Label4
    // Reference: GUIImage'XInterface_Decompressed.Browser_IconKey.Icon5'
    begin object name="Icon5" class=XInterface_Decompressed.GUIImage
        ImageStyle=2
        WinTop=0.5900000
        WinLeft=0.3000000
        WinWidth=16.0000000
        WinHeight=16.0000000
    end object
    Controls[11]=Icon5
    // Reference: GUILabel'XInterface_Decompressed.Browser_IconKey.Label5'
    begin object name="Label5" class=XInterface_Decompressed.GUILabel
        TextColor=(R=255,G=255,B=255,A=255)
        StyleName="TextLabel"
        WinTop=0.5800000
        WinLeft=0.3600000
        WinWidth=0.3500000
        WinHeight=32.0000000
    end object
    Controls[12]=Label5
    // Reference: GUIImage'XInterface_Decompressed.Browser_IconKey.Icon6'
    begin object name="Icon6" class=XInterface_Decompressed.GUIImage
        ImageStyle=2
        WinTop=0.6500000
        WinLeft=0.3000000
        WinWidth=16.0000000
        WinHeight=16.0000000
    end object
    Controls[13]=Icon6
    // Reference: GUILabel'XInterface_Decompressed.Browser_IconKey.Label6'
    begin object name="Label6" class=XInterface_Decompressed.GUILabel
        TextColor=(R=255,G=255,B=255,A=255)
        StyleName="TextLabel"
        WinTop=0.6400000
        WinLeft=0.3600000
        WinWidth=0.3500000
        WinHeight=32.0000000
    end object
    Controls[14]=Label6
    // Reference: GUIImage'XInterface_Decompressed.Browser_IconKey.Icon7'
    begin object name="Icon7" class=XInterface_Decompressed.GUIImage
        ImageStyle=2
        WinTop=0.7100000
        WinLeft=0.3000000
        WinWidth=16.0000000
        WinHeight=16.0000000
    end object
    Controls[15]=Icon7
    // Reference: GUILabel'XInterface_Decompressed.Browser_IconKey.Label7'
    begin object name="Label7" class=XInterface_Decompressed.GUILabel
        TextColor=(R=255,G=255,B=255,A=255)
        StyleName="TextLabel"
        WinTop=0.7000000
        WinLeft=0.3600000
        WinWidth=0.3500000
        WinHeight=32.0000000
    end object
    Controls[16]=Label7
}