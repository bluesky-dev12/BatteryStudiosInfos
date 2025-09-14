class UT2K4Tab_ServerMOTD extends MidGamePanel
    editinlinenew
    instanced;

var() automated GUISectionBackground sb_MOTD;
var() automated GUISectionBackground sb_Admin;
var() automated GUIScrollTextBox lb_Text;
var() automated GUILabel l_AdminName;
var() automated GUILabel l_Email;

function InitComponent(GUIController MyController, GUIComponent myOwner)
{
    super(GUIPanel).InitComponent(MyController, myOwner);
    sb_MOTD.ManageComponent(lb_Text);
    //return;    
}

function bool InternalOnPreDraw(Canvas C)
{
    // End:0x89
    if(PlayerOwner().GameReplicationInfo != none)
    {
        lb_Text.AddText(PlayerOwner().GameReplicationInfo.MessageOfTheDay);
        l_AdminName.Caption = PlayerOwner().GameReplicationInfo.AdminName;
        l_Email.Caption = PlayerOwner().GameReplicationInfo.AdminEmail;
        __OnPreDraw__Delegate = None;
    }
    return false;
    //return;    
}

defaultproperties
{
    // Reference: AltSectionBackground'GUI2K4_Decompressed.UT2K4Tab_ServerMOTD.sbMOTD'
    begin object name="sbMOTD" class=GUI2K4_Decompressed.AltSectionBackground
        Caption="??? ???"
        LeftPadding=0.0000000
        RightPadding=0.0000000
        WinTop=0.0303250
        WinLeft=0.0356930
        WinWidth=0.9224270
        WinHeight=0.6446370
        bBoundToParent=true
        bScaleToParent=true
        OnPreDraw=sbMOTD.InternalPreDraw
    end object
    sb_MOTD=sbMOTD
    // Reference: AltSectionBackground'GUI2K4_Decompressed.UT2K4Tab_ServerMOTD.sbAdmin'
    begin object name="sbAdmin" class=GUI2K4_Decompressed.AltSectionBackground
        Caption="??? ??:"
        LeftPadding=0.0000000
        RightPadding=0.0000000
        Hint="?? ???"
        WinTop=0.6782740
        WinLeft=0.0356930
        WinWidth=0.9224270
        WinHeight=0.2582240
        bBoundToParent=true
        bScaleToParent=true
        OnPreDraw=sbAdmin.InternalPreDraw
    end object
    sb_Admin=sbAdmin
    // Reference: GUIScrollTextBox'GUI2K4_Decompressed.UT2K4Tab_ServerMOTD.MOTDText'
    begin object name="MOTDText" class=XInterface.GUIScrollTextBox
        bNoTeletype=true
        CharDelay=0.0025000
        EOLDelay=0.0000000
        TextAlign=1
        OnCreateComponent=MOTDText.InternalOnCreateComponent
        WinTop=0.4416670
        WinHeight=0.5583330
        bBoundToParent=true
        bScaleToParent=true
        bNeverFocus=true
    end object
    lb_Text=MOTDText
    // Reference: GUILabel'GUI2K4_Decompressed.UT2K4Tab_ServerMOTD.lAdminName'
    begin object name="lAdminName" class=XInterface.GUILabel
        TextAlign=1
        TextColor=(R=255,G=255,B=255,A=255)
        TextFont="UT2HeaderFont"
        WinTop=0.7474200
        WinLeft=0.0493290
        WinWidth=0.9013410
        WinHeight=0.0691150
        bBoundToParent=true
        bScaleToParent=true
    end object
    l_AdminName=lAdminName
    // Reference: GUILabel'GUI2K4_Decompressed.UT2K4Tab_ServerMOTD.lEmail'
    begin object name="lEmail" class=XInterface.GUILabel
        TextAlign=1
        TextColor=(R=255,G=255,B=255,A=255)
        FontScale=0
        WinTop=0.8014160
        WinLeft=0.0493290
        WinWidth=0.8931200
        WinHeight=0.0691150
        bBoundToParent=true
        bScaleToParent=true
    end object
    l_Email=lEmail
    WinHeight=0.7000000
    OnPreDraw=UT2K4Tab_ServerMOTD.InternalOnPreDraw
}