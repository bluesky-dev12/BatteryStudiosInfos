/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path GUIWarfareControls\Classes\BTWindowInviteClanHK.uc
 * Package Imports:
 *	GUIWarfareControls
 *	GUI2K4
 *	XInterface
 *	Core
 *
 * Stats:
 *	Properties:8
 *	Functions:4
 *
 *******************************************************************************/
class BTWindowInviteClanHK extends BTWindowHK
    editinlinenew
    instanced;

var localized string strLabel[4];
var localized string strModeTitle[2];
var localized string strModeContent[2];
var() /*0x00000000-0x80000000*/ databinding editinlinenotify FloatBox fbLabel[4];
var export editinline BTOwnerDrawImageHK Label[4];
var export editinline BTMultiLineEditBoxHK ClanInviteMsg;
var string SaveData;
var string SaveInviterName;

function SetClanInvite(string UserName)
{
    TopLine.Caption = strModeTitle[0];
    Label[0].Caption = UserName $ strModeContent[0];
    SaveData = UserName;
}

function SetClanJoin(string ClanName, optional string Inviter)
{
    TopLine.Caption = strModeTitle[1];
    Label[0].Caption = class'BTCustomDrawHK'.static.FormatString(strModeContent[1], ClanName);
    SaveData = ClanName;
    SaveInviterName = Inviter;
}

function InitComponent(GUIController MyController, GUIComponent myOwner)
{
    local int i;

    super.InitComponent(MyController, myOwner);
    i = 0;
    J0x17:
    // End:0x8f [While If]
    if(i < 4)
    {
        Label[i] = NewLabelComponent(fbLabel[i], class'BTUIResourcePoolHK'.default.empty);
        Label[i].CaptionDrawType = 0;
        Label[i].Caption = strLabel[i];
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x17;
    }
    Label[1].BackgroundImage = class'BTUIResourcePoolHK'.default.img_divid_line;
    Label[3].BackgroundImage = class'BTUIResourcePoolHK'.default.panel_4;
    ClanInviteMsg = BTMultiLineEditBoxHK(NewComponent(new class'BTMultiLineEditBoxHK', class'BTCustomDrawHK'.static.MakeResizeBox(fbLabel[3], -4, -6)));
    ClanInviteMsg.SetVisibleLineCount(5);
    ClanInviteMsg.MaxTextStrNum = 255;
}

function Internal_OnOpen();

defaultproperties
{
    strLabel[2]="Additional Message"
    strModeTitle[0]="Clan Invitation"
    strModeTitle[1]="Clan Application"
    strModeContent[0]=" will be invited to the clan. Proceed?"
    strModeContent[1]="%0 invited you to join the clan. Proceed?"
    fbLabel[0]=(X1=277.0,Y1=312.0,X2=760.0,Y2=500.0)
    fbLabel[1]=(X1=273.0,Y1=344.0,X2=752.0,Y2=347.0)
    fbLabel[2]=(X1=275.0,Y1=358.0,X2=760.0,Y2=500.0)
    fbLabel[3]=(X1=351.0,Y1=354.0,X2=752.0,Y2=449.0)
    fbBackgroundImage=(X1=245.0,Y1=248.0,X2=780.0,Y2=520.0)
    fbTopLine=(X1=265.0,Y1=268.0,X2=760.0,Y2=295.0)
    fbBottomLine=(X1=265.0,Y1=456.0,X2=760.0,Y2=500.0)
    fbButtonOK=(X1=391.0,Y1=462.0,X2=511.0,Y2=495.0)
    fbButtonCancel=(X1=515.0,Y1=462.0,X2=634.0,Y2=495.0)
    strTitle="Clan Invitation"
    bResizeWidthAllowed=true
    bResizeHeightAllowed=true
    bSetControlsBoundToParent=true
    bSetControlsScaleToParent=true
    OnOpen=Internal_OnOpen
}