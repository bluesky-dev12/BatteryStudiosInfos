/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path GUIWarfareControls\Classes\BTWindowRequestApprovalClanHK.uc
 * Package Imports:
 *	GUIWarfareControls
 *	GUI2K4
 *	XInterface
 *	Core
 *
 * Stats:
 *	Properties:14
 *	Functions:4
 *
 *******************************************************************************/
class BTWindowRequestApprovalClanHK extends BTWindowHK
    editinlinenew
    instanced;

var localized string strLabel[12];
var() /*0x00000000-0x80000000*/ databinding editinlinenotify FloatBox fbLabel[12];
var export editinline BTOwnerDrawImageHK Label[12];
var export editinline BTLabelLevelHK LabelLevel;
var() /*0x00000000-0x80000000*/ databinding editinlinenotify FloatBox fbEdit[8];
var localized string strEdit[8];
var export editinline BTOwnerDrawTextArrayHK Edit[8];
var localized string strButtonSuspend;
var() /*0x00000000-0x80000000*/ databinding editinlinenotify FloatBox fbButtonSuspend;
var export editinline BTOwnerDrawCaptionButtonHK ButtonSuspend;
var export editinline BTMultiLineEditBoxHK EditAddMsg;
var int ReqJoinUserIdx;
var string CharName;
var string InviteMsg;

function SetData(int ReqJoinUserIdx, string CharName, string Message)
{
    self.ReqJoinUserIdx = ReqJoinUserIdx;
    self.CharName = CharName;
    self.InviteMsg = Message;
    EditAddMsg.SetText(Message);
    Label[1].Caption = class'BTCustomDrawHK'.static.FormatString(strLabel[1], CharName);
    Label[2].Caption = strLabel[2];
}

function SetCharInfo(CharInfo stCharInfo)
{
    BTLabelLevelHK(Label[0]).SetData(stCharInfo.Level, stCharInfo.LevelMarkID);
    Edit[0].SetData("");
    Edit[1].SetData(class'BTCustomDrawHK'.static.FormatString(strEdit[1], string(stCharInfo.Win), string(stCharInfo.Lose)));
    Edit[2].SetData(class'BTCustomDrawHK'.static.FormatString(strEdit[2], string(stCharInfo.Ranking)));
    Edit[3].SetData(class'BTCustomDrawHK'.static.FormatString(strEdit[3], string(stCharInfo.DisCon)));
    Edit[4].SetData(class'BTCustomDrawHK'.static.FormatString(strEdit[4], "0", "0", "0"));
    Edit[5].SetData(class'BTCustomDrawHK'.static.FormatString(strEdit[5], "0", "0", "0"));
    Edit[6].SetData(class'BTCustomDrawHK'.static.FormatString(strEdit[6], "0"));
    Edit[7].SetData(class'BTCustomDrawHK'.static.FormatString(strEdit[7], "0"));
}

function InitComponent(GUIController MyController, GUIComponent myOwner)
{
    local int i;

    super.InitComponent(MyController, myOwner);
    i = 0;
    J0x17:
    // End:0xd3 [While If]
    if(i < 12)
    {
        // End:0x67
        if(i == 0)
        {
            LabelLevel = BTLabelLevelHK(NewComponent(new class'BTLabelLevelHK', fbLabel[i]));
            Label[i] = LabelLevel;
        }
        // End:0x92
        else
        {
            Label[i] = NewLabelComponent(fbLabel[i], class'BTUIResourcePoolHK'.default.empty);
        }
        Label[i].CaptionDrawType = 0;
        Label[i].Caption = strLabel[i];
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x17;
    }
    Label[0].BackgroundImage = class'BTUIResourcePoolHK'.default.panel_1;
    Label[3].BackgroundImage = class'BTUIResourcePoolHK'.default.img_divid_line;
    i = 0;
    J0x119:
    // End:0x17d [While If]
    if(i < 8)
    {
        Edit[i] = BTOwnerDrawTextArrayHK(NewComponent(new class'BTLabelLocationHK', fbEdit[i]));
        Edit[i].BackgroundImage = class'BTUIResourcePoolHK'.default.panel_5;
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x119;
    }
    EditAddMsg = BTMultiLineEditBoxHK(NewComponent(new class'BTMultiLineEditBoxHK', class'BTCustomDrawHK'.static.MakeResizeBox(fbEdit[0], -4, -6)));
    EditAddMsg.bReadOnly = true;
    EditAddMsg.bActiveCursor = false;
    ButtonSuspend = NewButtonComponent(fbButtonSuspend);
    ButtonSuspend.SetDefaultButtonImage();
    ButtonSuspend.Caption = strButtonSuspend;
}

function Internal_OnOpen();

defaultproperties
{
    strLabel[1]="%0 applied to join the clan."
    strLabel[2]="Approve the application?"
    strLabel[4]="Additional Message"
    strLabel[5]="Records"
    strLabel[6]="Rank"
    strLabel[7]="Force Quit"
    strLabel[8]="Clan Battle Records"
    strLabel[9]="Clan Battle Info"
    strLabel[10]="Clan Battle Headshots"
    strLabel[11]="Clan Battle Withdrawals"
    fbLabel[0]=(X1=302.0,Y1=183.0,X2=334.0,Y2=215.0)
    fbLabel[1]=(X1=374.0,Y1=184.0,X2=760.0,Y2=662.0)
    fbLabel[2]=(X1=374.0,Y1=201.0,X2=760.0,Y2=662.0)
    fbLabel[3]=(X1=273.0,Y1=224.0,X2=752.0,Y2=227.0)
    fbLabel[4]=(X1=275.0,Y1=240.0,X2=760.0,Y2=662.0)
    fbLabel[5]=(X1=275.0,Y1=342.0,X2=760.0,Y2=662.0)
    fbLabel[6]=(X1=275.0,Y1=376.0,X2=760.0,Y2=662.0)
    fbLabel[7]=(X1=275.0,Y1=408.0,X2=760.0,Y2=662.0)
    fbLabel[8]=(X1=275.0,Y1=440.0,X2=760.0,Y2=662.0)
    fbLabel[9]=(X1=275.0,Y1=472.0,X2=760.0,Y2=662.0)
    fbLabel[10]=(X1=275.0,Y1=504.0,X2=760.0,Y2=662.0)
    fbLabel[11]=(X1=275.0,Y1=536.0,X2=760.0,Y2=662.0)
    fbEdit[0]=(X1=372.0,Y1=234.0,X2=751.0,Y2=329.0)
    fbEdit[1]=(X1=372.0,Y1=336.0,X2=751.0,Y2=363.0)
    fbEdit[2]=(X1=372.0,Y1=370.0,X2=751.0,Y2=397.0)
    fbEdit[3]=(X1=372.0,Y1=404.0,X2=751.0,Y2=431.0)
    fbEdit[4]=(X1=372.0,Y1=438.0,X2=751.0,Y2=465.0)
    fbEdit[5]=(X1=372.0,Y1=472.0,X2=751.0,Y2=499.0)
    fbEdit[6]=(X1=372.0,Y1=506.0,X2=751.0,Y2=533.0)
    fbEdit[7]=(X1=372.0,Y1=540.0,X2=751.0,Y2=567.0)
    strEdit[1]="%0 W / %1 L"
    strEdit[2]="Place: %0"
    strEdit[3]="%0 Times"
    strEdit[4]="%0 Battles %1 W / %2 L"
    strEdit[5]="%0 Kills / %1 Assists / %2 Deaths"
    strEdit[6]="%0 Headshots"
    strEdit[7]="%0 Times"
    strButtonSuspend="Defer"
    fbButtonSuspend=(X1=576.0,Y1=581.0,X2=696.0,Y2=614.0)
    fbBackgroundImage=(X1=245.0,Y1=128.0,X2=779.0,Y2=638.0)
    fbTopLine=(X1=265.0,Y1=148.0,X2=760.0,Y2=175.0)
    fbBottomLine=(X1=265.0,Y1=575.0,X2=760.0,Y2=619.0)
    fbButtonOK=(X1=328.0,Y1=581.0,X2=448.0,Y2=614.0)
    fbButtonCancel=(X1=452.0,Y1=581.0,X2=572.0,Y2=614.0)
    strTitle="Clan Application"
    strOK="Accept"
    strCancel="Decline"
    bResizeWidthAllowed=true
    bResizeHeightAllowed=true
    bSetControlsBoundToParent=true
    bSetControlsScaleToParent=true
    OnOpen=Internal_OnOpen
}