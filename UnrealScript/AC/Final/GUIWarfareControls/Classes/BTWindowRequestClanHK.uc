class BTWindowRequestClanHK extends BTWindowHK
    editinlinenew
    instanced;

var localized string strLabel[14];
var() automated FloatBox fbLabel[14];
var export editinline BTOwnerDrawImageHK Label[14];
var export editinline BTLabelClanMarkHK LabelClanMark;
var() automated FloatBox fbEdit[9];
var localized string strEdit[9];
var export editinline BTOwnerDrawTextArrayHK Edit[9];
var localized string strButtonSuspend;
var() automated FloatBox fbButtonSuspend;
var export editinline BTOwnerDrawCaptionButtonHK ButtonSuspend;
var export editinline BTMultiLineEditBoxHK EditAddMsg;
var export editinline BTMultiLineEditBoxHK EditClanIntroduction;
var int InviterUserIdx;
var string InviterCharname;
var string ClanName;
var string InviteMsg;
var localized string strNoRankState;

function SetData(int InviterUserIdx, string InviterCharname, string ClanName, string InviteMsg)
{
    self.InviterUserIdx = InviterUserIdx;
    self.InviterCharname = InviterCharname;
    self.ClanName = ClanName;
    self.InviteMsg = InviteMsg;
    EditAddMsg.SetText(InviteMsg);
    Label[1].Caption = Class'Engine.BTCustomDrawHK'.static.FormatString(strLabel[1], InviterCharname);
    Label[2].Caption = Class'Engine.BTCustomDrawHK'.static.FormatString(strLabel[2], ClanName);
    //return;    
}

function SetClanInfo(ClanInfo stClanInfo)
{
    LabelClanMark.SetData(stClanInfo.CM_Pattern, stClanInfo.CM_BG, stClanInfo.CM_BL);
    Edit[0].SetData("");
    Edit[1].SetData("");
    EditClanIntroduction.SetText(stClanInfo.Intro);
    Edit[2].SetData(stClanInfo.Keyword);
    BTLabelLocationHK(Edit[3]).SetLocationID(int(stClanInfo.Region));
    Edit[4].SetData(stClanInfo.ClanMasterCharname);
    Edit[5].SetData(stClanInfo.HowOld);
    Edit[6].SetData(Class'Engine.BTCustomDrawHK'.static.FormatString(strEdit[6], string(stClanInfo.MemberCnt), string(stClanInfo.MemberTotal)));
    Edit[7].SetData(Class'Engine.BTCustomDrawHK'.static.FormatString(strEdit[7], string(stClanInfo.ClanWin), string(stClanInfo.ClanLose)));
    // End:0x18F
    if(stClanInfo.tRankCur == 0)
    {
        Edit[8].SetData(strNoRankState);        
    }
    else
    {
        Edit[8].SetData(Class'Engine.BTCustomDrawHK'.static.FormatString(strEdit[8], string(stClanInfo.tRankCur), string(stClanInfo.tRankPrev)));
    }
    //return;    
}

function InitComponent(GUIController MyController, GUIComponent myOwner)
{
    local int i;

    super.InitComponent(MyController, myOwner);
    i = 0;
    J0x17:

    // End:0xD3 [Loop If]
    if(i < 14)
    {
        // End:0x67
        if(i == 0)
        {
            LabelClanMark = BTLabelClanMarkHK(NewComponent(new Class'GUIWarfareControls_Decompressed.BTLabelClanMarkHK', fbLabel[i]));
            Label[i] = LabelClanMark;            
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
    Label[4].BackgroundImage = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.img_divid_line;
    i = 0;
    J0x119:

    // End:0x1DA [Loop If]
    if(i < 9)
    {
        // End:0x182
        if(i == 3)
        {
            Edit[i] = BTOwnerDrawTextArrayHK(NewComponent(new Class'GUIWarfareControls_Decompressed.BTLabelLocationHK', fbEdit[i]));
            Edit[i].BackgroundImage = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.panel_5;
            // [Explicit Continue]
            goto J0x1D0;
        }
        Edit[i] = BTOwnerDrawTextArrayHK(NewComponent(new Class'GUIWarfareControls_Decompressed.BTOwnerDrawTextArrayHK', fbEdit[i]));
        Edit[i].BackgroundImage = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.panel_5;
        J0x1D0:

        i++;
        // [Loop Continue]
        goto J0x119;
    }
    EditAddMsg = BTMultiLineEditBoxHK(NewComponent(new Class'GUIWarfareControls_Decompressed.BTMultiLineEditBoxHK', Class'Engine.BTCustomDrawHK'.static.MakeResizeBox(fbEdit[0], -4, -6)));
    EditAddMsg.bReadOnly = true;
    EditAddMsg.bActiveCursor = false;
    EditClanIntroduction = BTMultiLineEditBoxHK(NewComponent(new Class'GUIWarfareControls_Decompressed.BTMultiLineEditBoxHK', Class'Engine.BTCustomDrawHK'.static.MakeResizeBox(fbEdit[1], -4, -6)));
    EditClanIntroduction.bReadOnly = true;
    EditClanIntroduction.bActiveCursor = false;
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
    strLabel[1]="%0 invited you to join the "
    strLabel[2]=" %0 clan."
    strLabel[3]="Join the clan?"
    strLabel[5]="Additional Message"
    strLabel[6]="Clan Intro"
    strLabel[7]="Keywords"
    strLabel[8]="Region"
    strLabel[9]="Master"
    strLabel[10]="History"
    strLabel[11]="Players"
    strLabel[12]="Records"
    strLabel[13]="Rank"
    fbLabel[0]=(X1=302.0000000,Y1=150.0000000,X2=334.0000000,Y2=182.0000000)
    fbLabel[1]=(X1=373.0000000,Y1=142.0000000,X2=760.0000000,Y2=662.0000000)
    fbLabel[2]=(X1=373.0000000,Y1=159.0000000,X2=760.0000000,Y2=662.0000000)
    fbLabel[3]=(X1=373.0000000,Y1=176.0000000,X2=760.0000000,Y2=662.0000000)
    fbLabel[4]=(X1=273.0000000,Y1=200.0000000,X2=752.0000000,Y2=203.0000000)
    fbLabel[5]=(X1=275.0000000,Y1=216.0000000,X2=760.0000000,Y2=662.0000000)
    fbLabel[6]=(X1=275.0000000,Y1=318.0000000,X2=760.0000000,Y2=662.0000000)
    fbLabel[7]=(X1=275.0000000,Y1=386.0000000,X2=760.0000000,Y2=662.0000000)
    fbLabel[8]=(X1=275.0000000,Y1=420.0000000,X2=760.0000000,Y2=662.0000000)
    fbLabel[9]=(X1=275.0000000,Y1=454.0000000,X2=760.0000000,Y2=662.0000000)
    fbLabel[10]=(X1=275.0000000,Y1=488.0000000,X2=760.0000000,Y2=662.0000000)
    fbLabel[11]=(X1=275.0000000,Y1=522.0000000,X2=760.0000000,Y2=662.0000000)
    fbLabel[12]=(X1=275.0000000,Y1=556.0000000,X2=760.0000000,Y2=662.0000000)
    fbLabel[13]=(X1=275.0000000,Y1=590.0000000,X2=760.0000000,Y2=662.0000000)
    fbEdit[0]=(X1=372.0000000,Y1=210.0000000,X2=751.0000000,Y2=304.0000000)
    fbEdit[1]=(X1=372.0000000,Y1=312.0000000,X2=751.0000000,Y2=372.0000000)
    fbEdit[2]=(X1=372.0000000,Y1=380.0000000,X2=751.0000000,Y2=406.0000000)
    fbEdit[3]=(X1=372.0000000,Y1=414.0000000,X2=751.0000000,Y2=440.0000000)
    fbEdit[4]=(X1=372.0000000,Y1=448.0000000,X2=751.0000000,Y2=474.0000000)
    fbEdit[5]=(X1=372.0000000,Y1=482.0000000,X2=751.0000000,Y2=508.0000000)
    fbEdit[6]=(X1=372.0000000,Y1=516.0000000,X2=751.0000000,Y2=542.0000000)
    fbEdit[7]=(X1=372.0000000,Y1=550.0000000,X2=751.0000000,Y2=576.0000000)
    fbEdit[8]=(X1=372.0000000,Y1=584.0000000,X2=751.0000000,Y2=610.0000000)
    strEdit[5]="%0 y, %1 d"
    strEdit[6]="%0 / %1"
    strEdit[7]="%0 W / %1 L"
    strEdit[8]="Place: %0"
    strButtonSuspend="Defer"
    fbButtonSuspend=(X1=576.0000000,Y1=624.0000000,X2=696.0000000,Y2=657.0000000)
    strNoRankState="None"
    fbBackgroundImage=(X1=245.0000000,Y1=86.0000000,X2=780.0000000,Y2=682.0000000)
    fbTopLine=(X1=265.0000000,Y1=106.0000000,X2=760.0000000,Y2=133.0000000)
    fbBottomLine=(X1=265.0000000,Y1=618.0000000,X2=760.0000000,Y2=662.0000000)
    fbButtonOK=(X1=328.0000000,Y1=624.0000000,X2=448.0000000,Y2=657.0000000)
    fbButtonCancel=(X1=452.0000000,Y1=624.0000000,X2=572.0000000,Y2=657.0000000)
    strTitle="Clan Invitation"
    strOK="Accept"
    strCancel="Decline"
    bResizeWidthAllowed=false
    bResizeHeightAllowed=false
    bSetControlsBoundToParent=false
    bSetControlsScaleToParent=false
    OnOpen=BTWindowRequestClanHK.Internal_OnOpen
}