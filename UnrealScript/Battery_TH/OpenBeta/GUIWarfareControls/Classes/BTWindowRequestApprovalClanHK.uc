class BTWindowRequestApprovalClanHK extends BTWindowHK
    editinlinenew
    instanced;

var localized string strLabel[12];
var() automated FloatBox fbLabel[12];
var export editinline BTOwnerDrawImageHK Label[12];
var export editinline BTLabelLevelHK LabelLevel;
var() automated FloatBox fbEdit[8];
var localized string strEdit[8];
var export editinline BTOwnerDrawTextArrayHK Edit[8];
var localized string strButtonSuspend;
var() automated FloatBox fbButtonSuspend;
var export editinline BTOwnerDrawCaptionButtonHK ButtonSuspend;
var export editinline BTMultiLineEditBoxHK EditAddMsg;
var string CharName;
var string InviteMsg;

function SetData(string CharName, string Message)
{
    self.CharName = CharName;
    self.InviteMsg = Message;
    EditAddMsg.SetText(Message);
    Label[1].Caption = Class'Engine.BTCustomDrawHK'.static.FormatString(strLabel[1], CharName);
    Label[2].Caption = strLabel[2];
    //return;    
}

function SetCharInfo(CharInfo stCharInfo)
{
    BTLabelLevelHK(Label[0]).SetData(stCharInfo.Level, stCharInfo.LevelMarkID);
    Edit[0].SetData("");
    Edit[1].SetData(Class'Engine.BTCustomDrawHK'.static.FormatString(strEdit[1], string(stCharInfo.Win), string(stCharInfo.Lose)));
    Edit[2].SetData(Class'Engine.BTCustomDrawHK'.static.FormatString(strEdit[2], string(stCharInfo.Ranking)));
    Edit[3].SetData(Class'Engine.BTCustomDrawHK'.static.FormatString(strEdit[3], string(stCharInfo.DisCon)));
    Edit[4].SetData(Class'Engine.BTCustomDrawHK'.static.FormatString(strEdit[4], "0", "0", "0"));
    Edit[5].SetData(Class'Engine.BTCustomDrawHK'.static.FormatString(strEdit[5], "0", "0", "0"));
    Edit[6].SetData(Class'Engine.BTCustomDrawHK'.static.FormatString(strEdit[6], "0"));
    Edit[7].SetData(Class'Engine.BTCustomDrawHK'.static.FormatString(strEdit[7], "0"));
    //return;    
}

function InitComponent(GUIController MyController, GUIComponent myOwner)
{
    local int i;

    super.InitComponent(MyController, myOwner);
    i = 0;
    J0x17:

    // End:0xD3 [Loop If]
    if(i < 12)
    {
        // End:0x67
        if(i == 0)
        {
            LabelLevel = BTLabelLevelHK(NewComponent(new Class'GUIWarfareControls_Decompressed.BTLabelLevelHK', fbLabel[i]));
            Label[i] = LabelLevel;            
        }
        else
        {
            Label[i] = NewLabelComponent(fbLabel[i], Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.empty);
        }
        Label[i].CaptionDrawType = 0;
        Label[i].Caption = strLabel[i];
        i++;
        // [Loop Continue]
        goto J0x17;
    }
    Label[0].BackgroundImage = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.panel_1;
    Label[3].BackgroundImage = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.img_divid_line;
    i = 0;
    J0x119:

    // End:0x17D [Loop If]
    if(i < 8)
    {
        Edit[i] = BTOwnerDrawTextArrayHK(NewComponent(new Class'GUIWarfareControls_Decompressed.BTLabelLocationHK', fbEdit[i]));
        Edit[i].BackgroundImage = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.panel_5;
        i++;
        // [Loop Continue]
        goto J0x119;
    }
    EditAddMsg = BTMultiLineEditBoxHK(NewComponent(new Class'GUIWarfareControls_Decompressed.BTMultiLineEditBoxHK', Class'Engine.BTCustomDrawHK'.static.MakeResizeBox(fbEdit[0], -4, -6)));
    EditAddMsg.bReadOnly = true;
    EditAddMsg.bActiveCursor = false;
    ButtonSuspend = NewButtonComponent(fbButtonSuspend);
    ButtonSuspend.SetDefaultButtonImage();
    ButtonSuspend.Caption = strButtonSuspend;
    //return;    
}

function Internal_OnOpen()
{
    //return;    
}

defaultproperties
{
    strLabel[1]="??? %0 ??????????????????"
    strLabel[2]="???????????????????????"
    strLabel[4]="????????????????_gc2518"
    strLabel[5]="score _gc2519"
    strLabel[6]="Ranking_gc2520"
    strLabel[7]="???????_gc2521"
    strLabel[8]="score ????????_gc2522"
    strLabel[9]="???????????????????????_gc2523"
    strLabel[10]="???????????????_gc2524"
    strLabel[11]="??????????????_gc2525"
    fbLabel[0]=(X1=302.0000000,Y1=183.0000000,X2=334.0000000,Y2=215.0000000)
    fbLabel[1]=(X1=374.0000000,Y1=184.0000000,X2=760.0000000,Y2=662.0000000)
    fbLabel[2]=(X1=374.0000000,Y1=201.0000000,X2=760.0000000,Y2=662.0000000)
    fbLabel[3]=(X1=273.0000000,Y1=224.0000000,X2=752.0000000,Y2=227.0000000)
    fbLabel[4]=(X1=275.0000000,Y1=240.0000000,X2=760.0000000,Y2=662.0000000)
    fbLabel[5]=(X1=275.0000000,Y1=342.0000000,X2=760.0000000,Y2=662.0000000)
    fbLabel[6]=(X1=275.0000000,Y1=376.0000000,X2=760.0000000,Y2=662.0000000)
    fbLabel[7]=(X1=275.0000000,Y1=408.0000000,X2=760.0000000,Y2=662.0000000)
    fbLabel[8]=(X1=275.0000000,Y1=440.0000000,X2=760.0000000,Y2=662.0000000)
    fbLabel[9]=(X1=275.0000000,Y1=472.0000000,X2=760.0000000,Y2=662.0000000)
    fbLabel[10]=(X1=275.0000000,Y1=504.0000000,X2=760.0000000,Y2=662.0000000)
    fbLabel[11]=(X1=275.0000000,Y1=536.0000000,X2=760.0000000,Y2=662.0000000)
    fbEdit[0]=(X1=372.0000000,Y1=234.0000000,X2=751.0000000,Y2=329.0000000)
    fbEdit[1]=(X1=372.0000000,Y1=336.0000000,X2=751.0000000,Y2=363.0000000)
    fbEdit[2]=(X1=372.0000000,Y1=370.0000000,X2=751.0000000,Y2=397.0000000)
    fbEdit[3]=(X1=372.0000000,Y1=404.0000000,X2=751.0000000,Y2=431.0000000)
    fbEdit[4]=(X1=372.0000000,Y1=438.0000000,X2=751.0000000,Y2=465.0000000)
    fbEdit[5]=(X1=372.0000000,Y1=472.0000000,X2=751.0000000,Y2=499.0000000)
    fbEdit[6]=(X1=372.0000000,Y1=506.0000000,X2=751.0000000,Y2=533.0000000)
    fbEdit[7]=(X1=372.0000000,Y1=540.0000000,X2=751.0000000,Y2=567.0000000)
    strEdit[1]="%0??? / %1???"
    strEdit[2]="%0?????"
    strEdit[3]="%0???"
    strEdit[4]="%0???? %1??? / %2???"
    strEdit[5]="%0??? / %1????????? / %2???"
    strEdit[6]="%0???????"
    strEdit[7]="%0???"
    strButtonSuspend="?????"
    fbButtonSuspend=(X1=576.0000000,Y1=581.0000000,X2=696.0000000,Y2=614.0000000)
    fbBackgroundImage=(X1=245.0000000,Y1=128.0000000,X2=779.0000000,Y2=638.0000000)
    fbTopLine=(X1=265.0000000,Y1=148.0000000,X2=760.0000000,Y2=175.0000000)
    fbBottomLine=(X1=265.0000000,Y1=575.0000000,X2=760.0000000,Y2=619.0000000)
    fbButtonOK=(X1=328.0000000,Y1=581.0000000,X2=448.0000000,Y2=614.0000000)
    fbButtonCancel=(X1=452.0000000,Y1=581.0000000,X2=572.0000000,Y2=614.0000000)
    strTitle="??????????????"
    strOK="??????"
    strCancel="??????"
    bResizeWidthAllowed=false
    bResizeHeightAllowed=false
    bSetControlsBoundToParent=false
    bSetControlsScaleToParent=false
    OnOpen=BTWindowRequestApprovalClanHK.Internal_OnOpen
}