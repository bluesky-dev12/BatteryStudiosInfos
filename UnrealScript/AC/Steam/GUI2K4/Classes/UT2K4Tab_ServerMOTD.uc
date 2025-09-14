/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path GUI2K4\Classes\UT2K4Tab_ServerMOTD.uc
 * Package Imports:
 *	GUI2K4
 *	XInterface
 *	Core
 *
 * Stats:
 *	Properties:5
 *	Functions:2
 *
 *******************************************************************************/
class UT2K4Tab_ServerMOTD extends MidGamePanel
    editinlinenew
    instanced;

var() /*0x00000000-0x80000000*/ databinding export editinlinenotify GUISectionBackground sb_MOTD;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify GUISectionBackground sb_Admin;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify GUIScrollTextBox lb_Text;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify GUILabel l_AdminName;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify GUILabel l_Email;

function InitComponent(GUIController MyController, GUIComponent myOwner)
{
    super(GUIPanel).InitComponent(MyController, myOwner);
    sb_MOTD.ManageComponent(lb_Text);
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
}

defaultproperties
{
    begin object name=sbMOTD class=AltSectionBackground
        Caption="??? ???"
        LeftPadding=0.0
        RightPadding=0.0
        WinTop=0.0303250
        WinLeft=0.0356930
        WinWidth=0.9224270
        WinHeight=0.6446370
        bBoundToParent=true
        bScaleToParent=true
        OnPreDraw=InternalPreDraw
    object end
    // Reference: AltSectionBackground'UT2K4Tab_ServerMOTD.sbMOTD'
    sb_MOTD=sbMOTD
    begin object name=sbAdmin class=AltSectionBackground
        Caption="??? ??:"
        LeftPadding=0.0
        RightPadding=0.0
        Hint="?? ???"
        WinTop=0.6782740
        WinLeft=0.0356930
        WinWidth=0.9224270
        WinHeight=0.2582240
        bBoundToParent=true
        bScaleToParent=true
        OnPreDraw=InternalPreDraw
    object end
    // Reference: AltSectionBackground'UT2K4Tab_ServerMOTD.sbAdmin'
    sb_Admin=sbAdmin
    begin object name=MOTDText class=GUIScrollTextBox
        bNoTeletype=true
        CharDelay=0.00250
        EOLDelay=0.0
        TextAlign=1
        OnCreateComponent=InternalOnCreateComponent
        WinTop=0.4416670
        WinHeight=0.5583330
        bBoundToParent=true
        bScaleToParent=true
        bNeverFocus=true
    object end
    // Reference: GUIScrollTextBox'UT2K4Tab_ServerMOTD.MOTDText'
    lb_Text=MOTDText
    begin object name=lAdminName class=GUILabel
        TextAlign=1
        TextColor=(R=255,G=255,B=255,A=255)
        TextFont="UT2HeaderFont"
        WinTop=0.747420
        WinLeft=0.0493290
        WinWidth=0.9013410
        WinHeight=0.0691150
        bBoundToParent=true
        bScaleToParent=true
    object end
    // Reference: GUILabel'UT2K4Tab_ServerMOTD.lAdminName'
    l_AdminName=lAdminName
    begin object name=lEmail class=GUILabel
        TextAlign=1
        TextColor=(R=255,G=255,B=255,A=255)
        FontScale=0
        WinTop=0.8014160
        WinLeft=0.0493290
        WinWidth=0.893120
        WinHeight=0.0691150
        bBoundToParent=true
        bScaleToParent=true
    object end
    // Reference: GUILabel'UT2K4Tab_ServerMOTD.lEmail'
    l_Email=lEmail
    WinHeight=0.70
    OnPreDraw=InternalOnPreDraw
}