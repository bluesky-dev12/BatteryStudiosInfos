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
var() automated FloatBox fbLabelTitle;
var() automated FloatBox fbLabelReceiver;
var() automated FloatBox fbLabelEditReceiver;
var() automated FloatBox fbEditReceiver;
var() automated FloatBox fbButtonFriendList;
var() automated FloatBox fbLabelWarning[2];
var() automated FloatBox fbLabelContent;
var() automated FloatBox fbContent;
var() automated FloatBox fbButtonSendMail;
var() automated FloatBox fbButtonCancel;
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
    LabelTitle = new Class'GUIWarfareControls_Decompressed.BTOwnerDrawImageHK';
    LabelTitle.BackgroundImage = Class'Engine.BTCustomDrawHK'.static.MakeImage(512, 8, 28, Texture'Warfare_GP_UI_UI.Common.img_ptitl_back');
    LabelTitle.bUseAWinPos = true;
    LabelTitle.AWinPos = fbLabelTitle;
    LabelTitle.Caption = strLabelTitle;
    LabelTitle.SetFontSizeAll(11);
    LabelTitle.CaptionPadding[0] = 8;
    LabelTitle.SetFontDrawType(3);
    LabelTitle.InitComponent(Controller, self);
    AppendComponent(LabelTitle);
    LabelReceiver = new Class'GUIWarfareControls_Decompressed.BTOwnerDrawImageHK';
    LabelReceiver.bUseAWinPos = true;
    LabelReceiver.SetFontDrawType(3);
    LabelReceiver.Caption = strLabelReceiver;
    LabelReceiver.AWinPos = fbLabelReceiver;
    LabelReceiver.InitComponent(Controller, self);
    AppendComponent(LabelReceiver);
    LabelEditReceiver = new Class'GUIWarfareControls_Decompressed.BTOwnerDrawImageHK';
    LabelEditReceiver.bUseAWinPos = true;
    LabelEditReceiver.AWinPos = fbLabelEditReceiver;
    LabelEditReceiver.BackgroundImage = Class'Engine.BTCustomDrawHK'.static.MakeImage(16, 16, 15, Texture'Warfare_GP_UI_UI.Common.panel_4');
    LabelEditReceiver.InitComponent(Controller, self);
    AppendComponent(LabelEditReceiver);
    EditReceiver = new Class'GUIWarfareControls_Decompressed.BTEditBoxHK';
    EditReceiver.bUseAWinPos = true;
    EditReceiver.AWinPos = fbEditReceiver;
    EditReceiver.InitComponent(Controller, self);
    AppendComponent(EditReceiver);
    ButtonFriendList = new Class'GUIWarfareControls_Decompressed.BTOwnerDrawCaptionButtonHK';
    ButtonFriendList.bUseAWinPos = true;
    ButtonFriendList.AWinPos = fbButtonFriendList;
    ButtonFriendList.Caption = strButtonFriendList;
    ButtonFriendList.SetDefaultMButtonImage();
    ButtonFriendList.FontColor[0] = Class'Engine.Canvas'.static.MakeColor(180, 229, 229, byte(255));
    ButtonFriendList.FontColor[2] = ButtonFriendList.FontColor[0];
    ButtonFriendList.FontColor[3] = ButtonFriendList.FontColor[0];
    ButtonFriendList.InitComponent(Controller, self);
    AppendComponent(ButtonFriendList);
    ButtonFriendList.DisableMe();
    i = 0;
    J0x31E:

    // End:0x42C [Loop If]
    if(i < 2)
    {
        LabelWarning[i] = new Class'GUIWarfareControls_Decompressed.BTOwnerDrawImageHK';
        LabelWarning[i].bUseAWinPos = true;
        LabelWarning[i].SetFontDrawType(0);
        LabelWarning[i].SetFontSizeAll(8);
        LabelWarning[i].FontColor[0] = Class'Engine.Canvas'.static.MakeColor(byte(255), 100, 100, byte(255));
        LabelWarning[i].Caption = strLabelWarning[i];
        LabelWarning[i].AWinPos = fbLabelWarning[i];
        LabelWarning[i].InitComponent(Controller, self);
        AppendComponent(LabelWarning[i]);
        i++;
        // [Loop Continue]
        goto J0x31E;
    }
    LabelContent = new Class'GUIWarfareControls_Decompressed.BTOwnerDrawImageHK';
    LabelContent.bUseAWinPos = true;
    LabelContent.AWinPos = fbLabelContent;
    LabelContent.BackgroundImage = Class'Engine.BTCustomDrawHK'.static.MakeImage(16, 16, 15, Texture'Warfare_GP_UI_UI.Common.panel_4');
    LabelContent.InitComponent(Controller, self);
    AppendComponent(LabelContent);
    Content = new Class'GUIWarfareControls_Decompressed.BTMultiLineEditBoxHK';
    Content.bUseAWinPos = true;
    Content.AWinPos = fbContent;
    Content.InitComponent(Controller, self);
    AppendComponent(Content);
    ButtonSendMail = new Class'GUIWarfareControls_Decompressed.BTOwnerDrawCaptionButtonHK';
    ButtonSendMail.bUseAWinPos = true;
    ButtonSendMail.AWinPos = fbButtonSendMail;
    ButtonSendMail.Caption = strButtonSendMail;
    ButtonSendMail.SetDefaultButtonImage();
    ButtonSendMail.InitComponent(Controller, self);
    AppendComponent(ButtonSendMail);
    ButtonCancel = new Class'GUIWarfareControls_Decompressed.BTOwnerDrawCaptionButtonHK';
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
    //return;    
}

function SetData(string receiveUser, optional string ContentText)
{
    EditReceiver.SetText(receiveUser);
    Content.Clear();
    Content.SetText(ContentText);
    //return;    
}

defaultproperties
{
    fbLabelTitle=(X1=512.0000000,Y1=112.0000000,X2=1011.0000000,Y2=137.0000000)
    fbLabelReceiver=(X1=526.0000000,Y1=142.0000000,X2=597.0000000,Y2=167.0000000)
    fbLabelEditReceiver=(X1=597.0000000,Y1=142.0000000,X2=941.0000000,Y2=167.0000000)
    fbEditReceiver=(X1=604.0000000,Y1=145.0000000,X2=934.0000000,Y2=167.0000000)
    fbButtonFriendList=(X1=952.0000000,Y1=144.0000000,X2=1002.0000000,Y2=165.0000000)
    fbLabelWarning[0]=(X1=523.0000000,Y1=174.0000000,X2=941.0000000,Y2=191.0000000)
    fbLabelWarning[1]=(X1=523.0000000,Y1=191.0000000,X2=941.0000000,Y2=208.0000000)
    fbLabelContent=(X1=517.0000000,Y1=210.0000000,X2=1006.0000000,Y2=658.0000000)
    fbContent=(X1=525.0000000,Y1=218.0000000,X2=998.0000000,Y2=650.0000000)
    fbButtonSendMail=(X1=814.0000000,Y1=697.0000000,X2=908.0000000,Y2=729.0000000)
    fbButtonCancel=(X1=912.0000000,Y1=697.0000000,X2=1006.0000000,Y2=729.0000000)
    strLabelTitle="Write Mail"
    strLabelReceiver="Recipient"
    strButtonFriendList="Friends"
    strLabelWarning[0]="- Use \"/\" to divide multiple recipients."
    strLabelWarning[1]="- You cannot send messages for 1 minute after sending a message to multiple recipients."
    strButtonSendMail="Send"
    strButtonCancel="Cancel"
    bBoundToParent=true
    bScaleToParent=true
}