/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path GUIWarfareControls\Classes\BTTPMailWriteHK.uc
 * Package Imports:
 *	GUIWarfareControls
 *	XInterface
 *	Core
 *
 * Stats:
 *	Properties:26
 *	Functions:2
 *
 *******************************************************************************/
class BTTPMailWriteHK extends GUITabPanel
    editinlinenew
    instanced;

var export editinline BTOwnerDrawImageHK LabelTitle;
var export editinline BTOwnerDrawImageHK LabelReceiver;
var export editinline BTOwnerDrawImageHK LabelEditReceiver;
var export editinline BTEditBoxHK EditReceiver;
var export editinline BTOwnerDrawCaptionButtonHK ButtonFriendList;
var export editinline BTOwnerDrawImageHK LabelWarning[2];
var export editinline BTOwnerDrawImageHK LabelContent;
var export editinline BTMultiLineEditBoxHK Content;
var export editinline BTOwnerDrawCaptionButtonHK ButtonSendMail;
var export editinline BTOwnerDrawCaptionButtonHK ButtonCancel;
var() /*0x00000000-0x80000000*/ databinding editinlinenotify FloatBox fbLabelTitle;
var() /*0x00000000-0x80000000*/ databinding editinlinenotify FloatBox fbLabelReceiver;
var() /*0x00000000-0x80000000*/ databinding editinlinenotify FloatBox fbLabelEditReceiver;
var() /*0x00000000-0x80000000*/ databinding editinlinenotify FloatBox fbEditReceiver;
var() /*0x00000000-0x80000000*/ databinding editinlinenotify FloatBox fbButtonFriendList;
var() /*0x00000000-0x80000000*/ databinding editinlinenotify FloatBox fbLabelWarning[2];
var() /*0x00000000-0x80000000*/ databinding editinlinenotify FloatBox fbLabelContent;
var() /*0x00000000-0x80000000*/ databinding editinlinenotify FloatBox fbContent;
var() /*0x00000000-0x80000000*/ databinding editinlinenotify FloatBox fbButtonSendMail;
var() /*0x00000000-0x80000000*/ databinding editinlinenotify FloatBox fbButtonCancel;
var localized string strLabelTitle;
var localized string strLabelReceiver;
var localized string strButtonFriendList;
var localized string strLabelWarning[2];
var localized string strButtonSendMail;
var localized string strButtonCancel;

function InitComponent(GUIController MyController, GUIComponent myOwner)
{
    local int i;

    super(GUIPanel).InitComponent(MyController, myOwner);
    LabelTitle = new class'BTOwnerDrawImageHK';
    LabelTitle.BackgroundImage = class'BTCustomDrawHK'.static.MakeImage(512, 8, 28, texture'img_ptitl_back');
    LabelTitle.bUseAWinPos = true;
    LabelTitle.AWinPos = fbLabelTitle;
    LabelTitle.Caption = strLabelTitle;
    LabelTitle.SetFontSizeAll(11);
    LabelTitle.CaptionPadding[0] = 8;
    LabelTitle.SetFontDrawType(3);
    LabelTitle.InitComponent(Controller, self);
    AppendComponent(LabelTitle);
    LabelReceiver = new class'BTOwnerDrawImageHK';
    LabelReceiver.bUseAWinPos = true;
    LabelReceiver.SetFontDrawType(3);
    LabelReceiver.Caption = strLabelReceiver;
    LabelReceiver.AWinPos = fbLabelReceiver;
    LabelReceiver.InitComponent(Controller, self);
    AppendComponent(LabelReceiver);
    LabelEditReceiver = new class'BTOwnerDrawImageHK';
    LabelEditReceiver.bUseAWinPos = true;
    LabelEditReceiver.AWinPos = fbLabelEditReceiver;
    LabelEditReceiver.BackgroundImage = class'BTCustomDrawHK'.static.MakeImage(16, 16, 15, texture'panel_4');
    LabelEditReceiver.InitComponent(Controller, self);
    AppendComponent(LabelEditReceiver);
    EditReceiver = new class'BTEditBoxHK';
    EditReceiver.bUseAWinPos = true;
    EditReceiver.AWinPos = fbEditReceiver;
    EditReceiver.InitComponent(Controller, self);
    AppendComponent(EditReceiver);
    ButtonFriendList = new class'BTOwnerDrawCaptionButtonHK';
    ButtonFriendList.bUseAWinPos = true;
    ButtonFriendList.AWinPos = fbButtonFriendList;
    ButtonFriendList.Caption = strButtonFriendList;
    ButtonFriendList.SetDefaultMButtonImage();
    ButtonFriendList.FontColor[0] = class'Canvas'.static.MakeColor(180, 229, 229, byte(255));
    ButtonFriendList.FontColor[2] = ButtonFriendList.FontColor[0];
    ButtonFriendList.FontColor[3] = ButtonFriendList.FontColor[0];
    ButtonFriendList.InitComponent(Controller, self);
    AppendComponent(ButtonFriendList);
    ButtonFriendList.DisableMe();
    i = 0;
    J0x31e:
    // End:0x42c [While If]
    if(i < 2)
    {
        LabelWarning[i] = new class'BTOwnerDrawImageHK';
        LabelWarning[i].bUseAWinPos = true;
        LabelWarning[i].SetFontDrawType(0);
        LabelWarning[i].SetFontSizeAll(8);
        LabelWarning[i].FontColor[0] = class'Canvas'.static.MakeColor(byte(255), 100, 100, byte(255));
        LabelWarning[i].Caption = strLabelWarning[i];
        LabelWarning[i].AWinPos = fbLabelWarning[i];
        LabelWarning[i].InitComponent(Controller, self);
        AppendComponent(LabelWarning[i]);
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x31e;
    }
    LabelContent = new class'BTOwnerDrawImageHK';
    LabelContent.bUseAWinPos = true;
    LabelContent.AWinPos = fbLabelContent;
    LabelContent.BackgroundImage = class'BTCustomDrawHK'.static.MakeImage(16, 16, 15, texture'panel_4');
    LabelContent.InitComponent(Controller, self);
    AppendComponent(LabelContent);
    Content = new class'BTMultiLineEditBoxHK';
    Content.bUseAWinPos = true;
    Content.AWinPos = fbContent;
    Content.InitComponent(Controller, self);
    AppendComponent(Content);
    ButtonSendMail = new class'BTOwnerDrawCaptionButtonHK';
    ButtonSendMail.bUseAWinPos = true;
    ButtonSendMail.AWinPos = fbButtonSendMail;
    ButtonSendMail.Caption = strButtonSendMail;
    ButtonSendMail.SetDefaultButtonImage();
    ButtonSendMail.InitComponent(Controller, self);
    AppendComponent(ButtonSendMail);
    ButtonCancel = new class'BTOwnerDrawCaptionButtonHK';
    ButtonCancel.bUseAWinPos = true;
    ButtonCancel.AWinPos = fbButtonCancel;
    ButtonCancel.Caption = strButtonCancel;
    ButtonCancel.SetFontSizeAll(11);
    ButtonCancel.SetDefaultButtonImage();
    ButtonCancel.InitComponent(Controller, self);
    AppendComponent(ButtonCancel);
    Content.SetVisibleLineCount(24);
    Content.MaxTextStrNum = 1000;
    EditReceiver.MaxTextStrNum = 400;
}

function SetData(string receiveUser, optional string ContentText)
{
    EditReceiver.SetText(receiveUser);
    Content.Clear();
    Content.SetText(ContentText);
}

defaultproperties
{
    fbLabelTitle=(X1=512.0,Y1=112.0,X2=1011.0,Y2=137.0)
    fbLabelReceiver=(X1=526.0,Y1=142.0,X2=597.0,Y2=167.0)
    fbLabelEditReceiver=(X1=597.0,Y1=142.0,X2=941.0,Y2=167.0)
    fbEditReceiver=(X1=604.0,Y1=145.0,X2=934.0,Y2=167.0)
    fbButtonFriendList=(X1=952.0,Y1=144.0,X2=1002.0,Y2=165.0)
    fbLabelWarning[0]=(X1=523.0,Y1=174.0,X2=941.0,Y2=191.0)
    fbLabelWarning[1]=(X1=523.0,Y1=191.0,X2=941.0,Y2=208.0)
    fbLabelContent=(X1=517.0,Y1=210.0,X2=1006.0,Y2=658.0)
    fbContent=(X1=525.0,Y1=218.0,X2=998.0,Y2=650.0)
    fbButtonSendMail=(X1=814.0,Y1=697.0,X2=908.0,Y2=729.0)
    fbButtonCancel=(X1=912.0,Y1=697.0,X2=1006.0,Y2=729.0)
    strLabelTitle="Write Mail"
    strLabelReceiver="Recipient"
    strButtonFriendList="Friends"
    strLabelWarning[0]="- Use "/" to divide multiple recipients."
    strLabelWarning[1]="- You cannot send messages for 1 minute after sending a message to multiple recipients."
    strButtonSendMail="Send"
    strButtonCancel="Cancel"
    bBoundToParent=true
    bScaleToParent=true
}