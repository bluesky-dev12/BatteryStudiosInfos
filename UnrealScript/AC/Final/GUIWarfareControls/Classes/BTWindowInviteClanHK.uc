class BTWindowInviteClanHK extends BTWindowHK
    editinlinenew
    instanced;

var localized string strLabel[4];
var localized string strModeTitle[2];
var localized string strModeContent[2];
var() automated FloatBox fbLabel[4];
var export editinline BTOwnerDrawImageHK Label[4];
var export editinline BTMultiLineEditBoxHK ClanInviteMsg;
var string SaveData;
var string SaveInviterName;

function SetClanInvite(string UserName)
{
    TopLine.Caption = strModeTitle[0];
    Label[0].Caption = UserName $ strModeContent[0];
    SaveData = UserName;
    //return;    
}

function SetClanJoin(string ClanName, optional string Inviter)
{
    TopLine.Caption = strModeTitle[1];
    Label[0].Caption = Class'Engine.BTCustomDrawHK'.static.FormatString(strModeContent[1], ClanName);
    SaveData = ClanName;
    SaveInviterName = Inviter;
    //return;    
}

function InitComponent(GUIController MyController, GUIComponent myOwner)
{
    local int i;

    super.InitComponent(MyController, myOwner);
    i = 0;
    J0x17:

    // End:0x8F [Loop If]
    if(i < 4)
    {
        Label[i] = NewLabelComponent(fbLabel[i], Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.empty);
        Label[i].CaptionDrawType = 0;
        Label[i].Caption = strLabel[i];
        i++;
        // [Loop Continue]
        goto J0x17;
    }
    Label[1].BackgroundImage = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.img_divid_line;
    Label[3].BackgroundImage = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.panel_4;
    ClanInviteMsg = BTMultiLineEditBoxHK(NewComponent(new Class'GUIWarfareControls_Decompressed.BTMultiLineEditBoxHK', Class'Engine.BTCustomDrawHK'.static.MakeResizeBox(fbLabel[3], -4, -6)));
    ClanInviteMsg.SetVisibleLineCount(5);
    ClanInviteMsg.MaxTextStrNum = 255;
    //return;    
}

function Internal_OnOpen()
{
    //return;    
}

defaultproperties
{
    strLabel[2]="Additional Message"
    strModeTitle[0]="Clan Invitation"
    strModeTitle[1]="Clan Application"
    strModeContent[0]=" will be invited to the clan. Proceed?"
    strModeContent[1]="%0 invited you to join the clan. Proceed?"
    fbLabel[0]=(X1=277.0000000,Y1=312.0000000,X2=760.0000000,Y2=500.0000000)
    fbLabel[1]=(X1=273.0000000,Y1=344.0000000,X2=752.0000000,Y2=347.0000000)
    fbLabel[2]=(X1=275.0000000,Y1=358.0000000,X2=760.0000000,Y2=500.0000000)
    fbLabel[3]=(X1=351.0000000,Y1=354.0000000,X2=752.0000000,Y2=449.0000000)
    fbBackgroundImage=(X1=245.0000000,Y1=248.0000000,X2=780.0000000,Y2=520.0000000)
    fbTopLine=(X1=265.0000000,Y1=268.0000000,X2=760.0000000,Y2=295.0000000)
    fbBottomLine=(X1=265.0000000,Y1=456.0000000,X2=760.0000000,Y2=500.0000000)
    fbButtonOK=(X1=391.0000000,Y1=462.0000000,X2=511.0000000,Y2=495.0000000)
    fbButtonCancel=(X1=515.0000000,Y1=462.0000000,X2=634.0000000,Y2=495.0000000)
    strTitle="Clan Invitation"
    bResizeWidthAllowed=false
    bResizeHeightAllowed=false
    bSetControlsBoundToParent=false
    bSetControlsScaleToParent=false
    OnOpen=BTWindowInviteClanHK.Internal_OnOpen
}