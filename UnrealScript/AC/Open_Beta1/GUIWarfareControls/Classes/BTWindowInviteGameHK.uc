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
    RoomInfo = BTLabelRoomInfoHK(NewComponent(new Class'GUIWarfareControls_Decompressed.BTLabelRoomInfoHK', fbRoomInfo));
    LabelTextArray = BTOwnerDrawTextArrayHK(NewComponent(new Class'GUIWarfareControls_Decompressed.BTOwnerDrawTextArrayHK', fbLabel[0]));
    LabelTextArray.BackgroundImage = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.empty;
    LabelTextArray.SetFontDrawType(0);
    LabelTextArray.CaptionPadding[0] = 0;
    LabelTextArray.CaptionPadding[1] = 0;
    LabelTextArray.CaptionPadding[2] = 0;
    LabelTextArray.CaptionPadding[3] = 0;
    Label[1] = NewLabelComponent(fbLabel[1], Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.empty);
    Label[1].Caption = strLabel[1];
    Label[1].SetFontDrawType(0);
    Label[2] = NewLabelComponent(fbLabel[2], Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.empty);
    Label[2].Caption = strLabel[2];
    Label[2].SetFontDrawType(0);
    Label[2].SetFontColorAll(Class'GUIWarfareControls_Decompressed.BTUIColorPoolHK'.static.LabelWarning());
    Label[2].SetFontSizeAll(9);
    //return;    
}

function SetData(string where, string Who)
{
    local int i;
    local array<string> arrStr, retStr;
    local array<Text> arrTA;

    arrStr.Length = 2;
    arrStr[0] = Who;
    arrStr[1] = where;
    retStr = Class'Engine.BTCustomDrawHK'.static.FormatStringDiviedArray(strLabel[0], arrStr);
    arrTA.Length = retStr.Length;
    i = 0;
    J0x58:

    // End:0x9C [Loop If]
    if(i < retStr.Length)
    {
        arrTA[i] = Class'Engine.BTCustomDrawHK'.static.MakeText(10, 0, retStr[i]);
        i++;
        // [Loop Continue]
        goto J0x58;
    }
    arrTA[0].DrawColor = Class'GUIWarfareControls_Decompressed.BTUIColorPoolHK'.static.ChatSelf();
    arrTA[2].DrawColor = Class'GUIWarfareControls_Decompressed.BTUIColorPoolHK'.static.ChatSelf();
    LabelTextArray.tarray = arrTA;
    //return;    
}

function bool Internal_OnPreDraw(Canvas C)
{
    ElipsedTime += Controller.RenderDelta;
    // End:0x56
    if(ElipsedTime > float(10))
    {
        TcpChannel.sfAckRecvInviteGameRoom(RoomUniqueID, RoomNumber, 2, InviterName);
        FadeOut(false, true);
        ElipsedTime = -99999.0000000;
    }
    return InternalOnPreDraw(C);
    //return;    
}

defaultproperties
{
    strGameState[0]="Waiting"
    strGameState[1]="In Game"
    fbRoomInfo=(X1=275.0000000,Y1=262.0000000,X2=751.0000000,Y2=443.0000000)
    fbLabel[0]=(X1=275.0000000,Y1=453.0000000,X2=751.0000000,Y2=470.0000000)
    fbLabel[1]=(X1=275.0000000,Y1=470.0000000,X2=751.0000000,Y2=493.0000000)
    fbLabel[2]=(X1=282.0000000,Y1=493.0000000,X2=751.0000000,Y2=500.0000000)
    strLabel[0]="%0 from %1 invited you to join a game."
    strLabel[1]="Will you accept?"
    strLabel[2]="- Invitations are automatically declined if there is no reply within 10 seconds."
    strTemp="Downtown"
    fbBackgroundImage=(X1=245.0000000,Y1=190.0000000,X2=779.0000000,Y2=573.0000000)
    fbTopLine=(X1=265.0000000,Y1=210.0000000,X2=759.0000000,Y2=236.0000000)
    fbBottomLine=(X1=265.0000000,Y1=510.0000000,X2=759.0000000,Y2=553.0000000)
    fbButtonOK=(X1=391.0000000,Y1=516.0000000,X2=509.0000000,Y2=547.0000000)
    fbButtonCancel=(X1=515.0000000,Y1=516.0000000,X2=633.0000000,Y2=547.0000000)
    strTitle="Game Invitation"
    strOK="Accept"
    strCancel="Decline"
    bResizeWidthAllowed=false
    bResizeHeightAllowed=false
    bSetControlsBoundToParent=false
    bSetControlsScaleToParent=false
    OnPreDraw=BTWindowInviteGameHK.Internal_OnPreDraw
}