/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path GUIWarfareControls\Classes\BTWindowInviteGameHK.uc
 * Package Imports:
 *	GUIWarfareControls
 *	GUI2K4
 *	XInterface
 *	Core
 *
 * Stats:
 *	Properties:17
 *	Functions:3
 *
 *******************************************************************************/
class BTWindowInviteGameHK extends BTWindowHK
    editinlinenew
    instanced;

var int ServerID;
var int ChannelID;
var string RoomUniqueID;
var int RoomNumber;
var string InviterName;
var string Password;
var float ElipsedTime;
var BTTcpLink_Channel TcpChannel;
var localized string strGameState[2];
var FloatBox fbRoomInfo;
var export editinline BTLabelRoomInfoHK RoomInfo;
var FloatBox fbLabel[3];
var array<Text> arrLabel;
var localized string strLabel[3];
var localized string strTemp;
var export editinline BTOwnerDrawTextArrayHK LabelTextArray;
var export editinline BTOwnerDrawImageHK Label[3];

function InitComponent(GUIController MyController, GUIComponent myOwner)
{
    super.InitComponent(MyController, myOwner);
    RoomInfo = BTLabelRoomInfoHK(NewComponent(new class'BTLabelRoomInfoHK', fbRoomInfo));
    LabelTextArray = BTOwnerDrawTextArrayHK(NewComponent(new class'BTOwnerDrawTextArrayHK', fbLabel[0]));
    LabelTextArray.BackgroundImage = class'BTUIResourcePoolHK'.default.empty;
    LabelTextArray.SetFontDrawType(0);
    LabelTextArray.CaptionPadding[0] = 0;
    LabelTextArray.CaptionPadding[1] = 0;
    LabelTextArray.CaptionPadding[2] = 0;
    LabelTextArray.CaptionPadding[3] = 0;
    Label[1] = NewLabelComponent(fbLabel[1], class'BTUIResourcePoolHK'.default.empty);
    Label[1].Caption = strLabel[1];
    Label[1].SetFontDrawType(0);
    Label[2] = NewLabelComponent(fbLabel[2], class'BTUIResourcePoolHK'.default.empty);
    Label[2].Caption = strLabel[2];
    Label[2].SetFontDrawType(0);
    Label[2].SetFontColorAll(class'BTUIColorPoolHK'.static.LabelWarning());
    Label[2].SetFontSizeAll(9);
}

function SetData(string where, string Who)
{
    local int i;
    local array<string> arrStr, retStr;
    local array<Text> arrTA;

    arrStr.Length = 2;
    arrStr[0] = Who;
    arrStr[1] = where;
    retStr = class'BTCustomDrawHK'.static.FormatStringDiviedArray(strLabel[0], arrStr);
    arrTA.Length = retStr.Length;
    i = 0;
    J0x58:
    // End:0x9c [While If]
    if(i < retStr.Length)
    {
        arrTA[i] = class'BTCustomDrawHK'.static.MakeText(10, 0, retStr[i]);
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x58;
    }
    arrTA[0].DrawColor = class'BTUIColorPoolHK'.static.ChatSelf();
    arrTA[2].DrawColor = class'BTUIColorPoolHK'.static.ChatSelf();
    LabelTextArray.tarray = arrTA;
}

function bool Internal_OnPreDraw(Canvas C)
{
    ElipsedTime += Controller.RenderDelta;
    // End:0x56
    if(ElipsedTime > float(10))
    {
        TcpChannel.sfAckRecvInviteGameRoom(RoomUniqueID, RoomNumber, 2, InviterName);
        FadeOut(false, true);
        ElipsedTime = -99999.0;
    }
    return InternalOnPreDraw(C);
}

defaultproperties
{
    strGameState[0]="Waiting"
    strGameState[1]="In Game"
    fbRoomInfo=(X1=275.0,Y1=262.0,X2=751.0,Y2=443.0)
    fbLabel[0]=(X1=275.0,Y1=453.0,X2=751.0,Y2=470.0)
    fbLabel[1]=(X1=275.0,Y1=470.0,X2=751.0,Y2=493.0)
    fbLabel[2]=(X1=282.0,Y1=493.0,X2=751.0,Y2=500.0)
    strLabel[0]="%0 from %1 invited you to join a game."
    strLabel[1]="Will you accept?"
    strLabel[2]="- Invitations are automatically declined if there is no reply within 10 seconds."
    strTemp="Downtown"
    fbBackgroundImage=(X1=245.0,Y1=190.0,X2=779.0,Y2=573.0)
    fbTopLine=(X1=265.0,Y1=210.0,X2=759.0,Y2=236.0)
    fbBottomLine=(X1=265.0,Y1=510.0,X2=759.0,Y2=553.0)
    fbButtonOK=(X1=391.0,Y1=516.0,X2=509.0,Y2=547.0)
    fbButtonCancel=(X1=515.0,Y1=516.0,X2=633.0,Y2=547.0)
    strTitle="Game Invitation"
    strOK="Accept"
    strCancel="Decline"
    bResizeWidthAllowed=true
    bResizeHeightAllowed=true
    bSetControlsBoundToParent=true
    bSetControlsScaleToParent=true
    OnPreDraw=Internal_OnPreDraw
}