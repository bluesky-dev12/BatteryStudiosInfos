class BTTPMailHK extends GUITabPanel
    editinlinenew
    instanced;

var array<export editinline BTOwnerDrawCaptionButtonHK> Buttons;
var array<export editinline BTAutoColumnListHK> ACLMail;
var export editinline TabControlMocker TabControl;
var export editinline BTOwnerDrawCaptionButtonHK TopButton[5];
var export editinline BTOwnerDrawImageHK TopImage[5];
var FloatBox fbTopButton[5];
var FloatBox fbTopButton2[5];
var localized string strPoint;
var localized string strCash;
var localized string strTopButton[6];
var localized string strSendMail;
var localized string strRecvMail;
var localized string strCashItemMail;
var localized string strUndefine;
var localized string strDay;
var localized string strHour;
var localized string strEmpty;

function TabControl_OnChangedTab(int CurrentIndex, int PrevIndex)
{
    // End:0x5F
    if(CurrentIndex == 2)
    {
        UpdateTopButtons2();
        TopButton[0].SetVisibility(false);
        TopButton[4].SetVisibility(false);
        TopImage[0].SetVisibility(false);
        TopImage[3].SetVisibility(false);        
    }
    else
    {
        UpdateTopButtons();
        TopButton[0].SetVisibility(true);
        TopButton[4].SetVisibility(true);
        TopImage[0].SetVisibility(true);
        TopImage[3].SetVisibility(true);
    }
    //return;    
}

function AddMail(int Panel, int MemoType, int idx, string senddate, string Sender, string Content, int leftdate, int Status, BtrDouble ItemUID, int ItemID, int StackCount, optional int WZStoreSeq, optional int WZStoreItemSeq, optional int WZStoreItemType, optional int Value)
{
    local int i;
    local wGameManager GameMgr;
    local BTAutoColumnListDataHK Data;
    local array<string> arrStr;
    local wMatchMaker MM;

    MM = Controller.ViewportOwner.Actor.Level.GetMatchMaker();
    Data = new Class'GUIWarfareControls_Decompressed.BTAutoColumnListDataHK';
    Data.Init(8);
    i = 0;
    J0x57:

    // End:0x189 [Loop If]
    if(i < 3)
    {
        Data.DataPerColumn[0].Text[i].FontSize = 9;
        Data.DataPerColumn[1].Text[i].FontSize = 9;
        Data.DataPerColumn[2].Text[i].FontSize = 9;
        Data.DataPerColumn[3].Text[i].FontSize = 9;
        Data.DataPerColumn[4].Text[i].FontSize = 9;
        Data.DataPerColumn[0].Text[i].FontDrawType = 4;
        Data.DataPerColumn[1].Text[i].FontDrawType = 3;
        Data.DataPerColumn[2].Text[i].FontDrawType = 3;
        i++;
        // [Loop Continue]
        goto J0x57;
    }
    Data.DataPerColumn[0].strValue = senddate;
    Data.DataPerColumn[0].IntValue = idx;
    Data.DataPerColumn[1].IntValue = MemoType;
    Data.DataPerColumn[1].strValue = Sender;
    Data.DataPerColumn[2].strValue = Class'Engine.BTCustomDrawHK'.static.Get_0x0A_RemoveString(Content);
    Data.DataPerColumn[2].IntValue = ItemUID.dummy_1_DO_NOT_USE;
    Data.DataPerColumn[2].tempValue = ItemUID.dummy_2_DO_NOT_USE;
    Data.DataPerColumn[3].IntValue = ItemID;
    // End:0x2A8
    if(MemoType == 1)
    {
        Data.DataPerColumn[3].strValue = strEmpty;        
    }
    else
    {
        // End:0x31A
        if(MemoType == 2)
        {
            GameMgr = Controller.ViewportOwner.Actor.Level.GameMgr;
            Data.DataPerColumn[3].strValue = GameMgr.FindUIItem(ItemID).ItemName;            
        }
        else
        {
            // End:0x345
            if(MemoType == 4)
            {
                Data.DataPerColumn[3].strValue = strPoint;                
            }
            else
            {
                // End:0x47B
                if(MemoType == 5)
                {
                    Split(Content, "|", arrStr);
                    // End:0x3AB
                    if(Panel == 1)
                    {
                        Data.DataPerColumn[7].strValue = Class'GUIWarfareControls_Decompressed.BTWindowDefineInfoHK'.static.GetFormatString(83, MM.kUserName, arrStr[0]);                        
                    }
                    else
                    {
                        Data.DataPerColumn[7].strValue = Class'GUIWarfareControls_Decompressed.BTWindowDefineInfoHK'.static.GetFormatString(83, Sender, arrStr[0]);
                    }
                    Data.DataPerColumn[6].strValue = arrStr[0];
                    Data.DataPerColumn[2].strValue = Class'GUIWarfareControls_Decompressed.BTWindowDefineInfoHK'.static.GetFormatString(140);
                    // End:0x45F
                    if(arrStr.Length >= 2)
                    {
                        Data.DataPerColumn[5].strValue = Mid(Content, Len(arrStr[0]) + 1);                        
                    }
                    else
                    {
                        Data.DataPerColumn[5].strValue = "";
                    }                    
                }
                else
                {
                    // End:0x53F
                    if(MemoType == 6)
                    {
                        // End:0x4CB
                        if(Panel == 1)
                        {
                            Data.DataPerColumn[7].strValue = Class'GUIWarfareControls_Decompressed.BTWindowDefineInfoHK'.static.GetFormatString(85, MM.kUserName);                            
                        }
                        else
                        {
                            Data.DataPerColumn[7].strValue = Class'GUIWarfareControls_Decompressed.BTWindowDefineInfoHK'.static.GetFormatString(85, Sender);
                        }
                        Data.DataPerColumn[6].strValue = Content;
                        Data.DataPerColumn[2].strValue = Class'GUIWarfareControls_Decompressed.BTWindowDefineInfoHK'.static.GetFormatString(141);                        
                    }
                    else
                    {
                        // End:0x58C
                        if(MemoType == 7)
                        {
                            Data.DataPerColumn[3].strValue = string(Value) @ strCash;
                            Data.DataPerColumn[3].IntValue = Value;
                        }
                    }
                }
            }
        }
    }
    // End:0x5C4
    if(leftdate > 48)
    {
        Data.DataPerColumn[4].strValue = string(leftdate / 24) $ strDay;        
    }
    else
    {
        Data.DataPerColumn[4].strValue = string(leftdate) $ strHour;
    }
    // End:0x632
    if(Status == 0)
    {
        Data.DataPerColumn[4].strValue = ((strUndefine $ "(") $ Data.DataPerColumn[4].strValue) $ ")";
    }
    Data.DataPerColumn[4].IntValue = leftdate;
    Data.DataPerColumn[4].floatValue = float(Status);
    Data.DataPerColumn[6].tempValue = StackCount;
    Data.DataPerColumn[0].tempValue = WZStoreSeq;
    Data.DataPerColumn[1].tempValue = WZStoreItemSeq;
    Data.DataPerColumn[3].tempValue = WZStoreItemType;
    Data.DataPerColumn[4].tempValue = Value;
    // End:0x732
    if(WZStoreItemType != 0)
    {
        Data.DataPerColumn[0].strValue = "";
        Data.DataPerColumn[4].strValue = "";
    }
    ACLMail[Panel].AddRow(Data);
    //return;    
}

function ReverseList(int Panel)
{
    local int rowcount, i;
    local BTAutoColumnListDataHK tempBuffer;

    rowcount = ACLMail[Panel].ACLRowList.Length;
    i = 0;
    J0x22:

    // End:0xC8 [Loop If]
    if(i < (rowcount / 2))
    {
        tempBuffer = ACLMail[Panel].ACLRowList[(rowcount - 1) - i];
        ACLMail[Panel].ACLRowList[(rowcount - 1) - i] = ACLMail[Panel].ACLRowList[i];
        ACLMail[Panel].ACLRowList[i] = tempBuffer;
        i++;
        // [Loop Continue]
        goto J0x22;
    }
    //return;    
}

function ChangeReadStatus(int Index)
{
    local int i;
    local BTAutoColumnListDataHK Data;

    i = 0;
    J0x07:

    // End:0xF9 [Loop If]
    if(i < ACLMail[0].ACLRowList.Length)
    {
        Data = ACLMail[0].ACLRowList[i];
        // End:0xEF
        if(Data.DataPerColumn[0].IntValue == Index)
        {
            // End:0xB7
            if(Data.DataPerColumn[4].IntValue > 48)
            {
                Data.DataPerColumn[4].strValue = string(Data.DataPerColumn[4].IntValue / 24) $ strDay;                
            }
            else
            {
                Data.DataPerColumn[4].strValue = string(Data.DataPerColumn[4].IntValue) $ strHour;
            }
            return;
        }
        i++;
        // [Loop Continue]
        goto J0x07;
    }
    //return;    
}

function RemoveAll(int Panel)
{
    ACLMail[Panel].RemoveAll();
    //return;    
}

function UpdateTopButtons()
{
    local int i;

    i = 0;
    J0x07:

    // End:0xF2 [Loop If]
    if(i < 4)
    {
        TopImage[i].AWinPos.X1 = fbTopButton[i].X2 - float(2);
        TopImage[i].AWinPos.Y1 = fbTopButton[i].Y1 + float(5);
        TopImage[i].AWinPos.X2 = fbTopButton[i].X2 + float(2);
        TopImage[i].AWinPos.Y2 = fbTopButton[i].Y2 - float(5);
        TopImage[i].ApplyAWinPos();
        i++;
        // [Loop Continue]
        goto J0x07;
    }
    TopImage[4].AWinPos.X1 = fbTopButton[0].X1;
    TopImage[4].AWinPos.Y1 = fbTopButton[0].Y1;
    TopImage[4].AWinPos.X2 = fbTopButton[4].X2;
    TopImage[4].AWinPos.Y2 = fbTopButton[4].Y2;
    TopImage[4].ApplyAWinPos();
    i = 0;
    J0x199:

    // End:0x1E4 [Loop If]
    if(i < 5)
    {
        TopButton[i].AWinPos = fbTopButton[i];
        TopButton[i].ApplyAWinPos();
        i++;
        // [Loop Continue]
        goto J0x199;
    }
    //return;    
}

function UpdateTopButtons2()
{
    local int i;

    i = 0;
    J0x07:

    // End:0xF2 [Loop If]
    if(i < 4)
    {
        TopImage[i].AWinPos.X1 = fbTopButton2[i].X2 - float(2);
        TopImage[i].AWinPos.Y1 = fbTopButton2[i].Y1 + float(5);
        TopImage[i].AWinPos.X2 = fbTopButton2[i].X2 + float(2);
        TopImage[i].AWinPos.Y2 = fbTopButton2[i].Y2 - float(5);
        TopImage[i].ApplyAWinPos();
        i++;
        // [Loop Continue]
        goto J0x07;
    }
    TopImage[4].AWinPos.X1 = fbTopButton2[1].X1;
    TopImage[4].AWinPos.Y1 = fbTopButton2[1].Y1;
    TopImage[4].AWinPos.X2 = fbTopButton2[3].X2;
    TopImage[4].AWinPos.Y2 = fbTopButton2[3].Y2;
    TopImage[4].ApplyAWinPos();
    i = 0;
    J0x199:

    // End:0x1E4 [Loop If]
    if(i < 5)
    {
        TopButton[i].AWinPos = fbTopButton2[i];
        TopButton[i].ApplyAWinPos();
        i++;
        // [Loop Continue]
        goto J0x199;
    }
    //return;    
}

function InitTopButtons()
{
    local int i;
    local Image img, onImg, cliImg;

    img = Class'Engine.BTCustomDrawHK'.static.MakeImage(4, 16, 15, Texture'Warfare_UI_UI.Common.img_list_divid');
    i = 0;
    J0x27:

    // End:0x189 [Loop If]
    if(i < 4)
    {
        TopImage[i] = new Class'GUIWarfareControls_Decompressed.BTOwnerDrawImageHK';
        TopImage[i].bUseAWinPos = true;
        TopImage[i].AWinPos.X1 = fbTopButton[i].X2 - float(2);
        TopImage[i].AWinPos.Y1 = fbTopButton[i].Y1 + float(5);
        TopImage[i].AWinPos.X2 = fbTopButton[i].X2 + float(2);
        TopImage[i].AWinPos.Y2 = fbTopButton[i].Y2 - float(5);
        TopImage[i].BackgroundImage = img;
        TopImage[i].RenderWeight = 0.1900000;
        TopImage[i].InitComponent(Controller, self);
        AppendComponent(TopImage[i]);
        i++;
        // [Loop Continue]
        goto J0x27;
    }
    img = Class'Engine.BTCustomDrawHK'.static.MakeImage(8, 26, 15, Texture'Warfare_UI_UI.Common.butt_list_n');
    TopImage[4] = new Class'GUIWarfareControls_Decompressed.BTOwnerDrawImageHK';
    TopImage[4].bUseAWinPos = true;
    TopImage[4].AWinPos.X1 = fbTopButton[0].X1;
    TopImage[4].AWinPos.Y1 = fbTopButton[0].Y1;
    TopImage[4].AWinPos.X2 = fbTopButton[4].X2;
    TopImage[4].AWinPos.Y2 = fbTopButton[4].Y2;
    TopImage[4].BackgroundImage = img;
    TopImage[4].RenderWeight = 0.1000000;
    TopImage[4].InitComponent(Controller, self);
    AppendComponent(TopImage[4]);
    onImg = Class'Engine.BTCustomDrawHK'.static.MakeImage(8, 8, 15, Texture'Warfare_UI_UI.Common.butt_list_on');
    cliImg = Class'Engine.BTCustomDrawHK'.static.MakeImage(8, 8, 15, Texture'Warfare_UI_UI.Common.butt_list_cli');
    i = 0;
    J0x2F8:

    // End:0x43F [Loop If]
    if(i < 5)
    {
        TopButton[i] = new Class'GUIWarfareControls_Decompressed.BTOwnerDrawCaptionButtonHK';
        TopButton[i].bUseAWinPos = true;
        TopButton[i].AWinPos = fbTopButton[i];
        TopButton[i].buttonImage[1] = onImg;
        TopButton[i].buttonImage[3] = cliImg;
        TopButton[i].RenderWeight = 0.2000000;
        TopButton[i].SetDefaultListTopButtonFontColor();
        TopButton[i].Caption = strTopButton[i];
        TopButton[i].CaptionDrawType = 4;
        TopButton[i].ButtonID = i;
        TopButton[i].InitComponent(Controller, self);
        AppendComponent(TopButton[i]);
        i++;
        // [Loop Continue]
        goto J0x2F8;
    }
    //return;    
}

function InitComponent(GUIController MyController, GUIComponent myOwner)
{
    local export editinline BTAutoColumnListHK serverACL;
    local export editinline BTOwnerDrawCaptionButtonHK serverButton;
    local FloatBox fb;
    local int i, MenuLen;
    local wMatchMaker MM;

    super(GUIPanel).InitComponent(MyController, myOwner);
    InitTopButtons();
    MM = Controller.ViewportOwner.Actor.Level.GetMatchMaker();
    MenuLen = 3;
    i = 0;
    J0x55:

    // End:0x451 [Loop If]
    if(i < MenuLen)
    {
        serverButton = new Class'GUIWarfareControls_Decompressed.BTOwnerDrawCaptionButtonHK';
        serverButton.bUseAWinPos = true;
        fb.X1 = AWinPos.X1 + float(102 * i);
        fb.Y1 = AWinPos.Y1;
        fb.X2 = (AWinPos.X1 + float(102 * i)) + float(100);
        fb.Y2 = AWinPos.Y1 + float(23);
        serverButton.AWinPos = fb;
        serverButton.RenderWeight = 0.5000000;
        serverButton.CaptionDrawType = 4;
        serverButton.CaptionPadding[1] = 2;
        serverButton.CaptionAlign = 2;
        serverButton.SetDefaultTabButtonImage();
        serverButton.SetDefaultTabButtonFontColor();
        // End:0x1A3
        if(i == 2)
        {
            serverButton.SetPaidItemTabButtonImage();
            serverButton.SetPaidItemTabButtonFontColor();
        }
        serverButton.bBoundToParent = false;
        serverButton.bScaleToParent = false;
        serverButton.ButtonID = i;
        serverButton.InitComponent(Controller, self);
        AppendComponent(serverButton);
        Buttons[i] = serverButton;
        serverACL = new Class'GUIWarfareControls_Decompressed.BTACLMailHK';
        serverACL.bUseAWinPos = true;
        fb.X1 = AWinPos.X1 + float(2);
        fb.Y1 = (AWinPos.Y1 + float(2)) + float(50);
        fb.X2 = ((AWinPos.X2 - float(2)) - float(14)) + float(1);
        fb.Y2 = AWinPos.Y2 - float(2);
        serverACL.AWinPos = fb;
        serverACL.bBoundToParent = false;
        serverACL.bScaleToParent = false;
        serverACL.RenderWeight = 0.5000000;
        serverACL.InitComponent(Controller, self);
        AppendComponent(serverACL);
        // End:0x334
        if(i == 2)
        {
            BTACLMailHK(serverACL).ChangeNonFreeGiftColumnMode();            
        }
        else
        {
            BTACLMailHK(serverACL).ChangeMailColumnMode();
        }
        fb.X1 = ((AWinPos.X2 - float(2)) - float(14)) + float(1);
        fb.Y1 = (AWinPos.Y1 + float(2)) + float(50);
        fb.X2 = (AWinPos.X2 - float(2)) + float(1);
        fb.Y2 = AWinPos.Y2 - float(2);
        serverACL.MultiColumnList.MyScrollBar.AWinPos = fb;
        serverACL.MultiColumnList.MyScrollBar.ApplyAWinPos();
        ACLMail[i] = serverACL;
        TabControl.BindTabButtonAndPanel(Buttons[i], ACLMail[i]);
        i++;
        // [Loop Continue]
        goto J0x55;
    }
    Buttons[0].__OnClick__Delegate = OnReceivedMailClick;
    Buttons[1].__OnClick__Delegate = OnSendedMailClick;
    Buttons[2].__OnClick__Delegate = OnCashItemMailClick;
    Buttons[0].Caption = strRecvMail;
    Buttons[1].Caption = strSendMail;
    Buttons[2].Caption = strCashItemMail;
    TabControl.__OnChangedTab__Delegate = TabControl_OnChangedTab;
    TabControl.SetVisiblePanel(0);
    //return;    
}

function bool OnCashItemMailClick(GUIComponent Sender)
{
    TopButton[1].Caption = strTopButton[1];
    TabControl.SetVisiblePanel(2);
    return true;
    //return;    
}

function bool OnReceivedMailClick(GUIComponent Sender)
{
    TopButton[1].Caption = strTopButton[1];
    TabControl.SetVisiblePanel(0);
    return true;
    //return;    
}

function bool OnSendedMailClick(GUIComponent Sender)
{
    TopButton[1].Caption = strTopButton[5];
    TabControl.SetVisiblePanel(1);
    return true;
    //return;    
}

defaultproperties
{
    // Reference: TabControlMocker'GUIWarfareControls_Decompressed.BTTPMailHK.mTabControl'
    begin object name="mTabControl" class=GUIWarfareControls_Decompressed.TabControlMocker
    end object
    TabControl=mTabControl
    fbTopButton[0]=(X1=12.0000000,Y1=112.0000000,X2=74.0000000,Y2=138.0000000)
    fbTopButton[1]=(X1=74.0000000,Y1=112.0000000,X2=154.0000000,Y2=138.0000000)
    fbTopButton[2]=(X1=154.0000000,Y1=112.0000000,X2=309.0000000,Y2=138.0000000)
    fbTopButton[3]=(X1=309.0000000,Y1=112.0000000,X2=403.0000000,Y2=138.0000000)
    fbTopButton[4]=(X1=403.0000000,Y1=112.0000000,X2=498.0000000,Y2=138.0000000)
    fbTopButton2[0]=(X1=0.0000000,Y1=112.0000000,X2=0.0000000,Y2=138.0000000)
    fbTopButton2[1]=(X1=12.0000000,Y1=112.0000000,X2=127.0000000,Y2=138.0000000)
    fbTopButton2[2]=(X1=127.0000000,Y1=112.0000000,X2=381.0000000,Y2=138.0000000)
    fbTopButton2[3]=(X1=381.0000000,Y1=112.0000000,X2=484.0000000,Y2=138.0000000)
    fbTopButton2[4]=(X1=0.0000000,Y1=112.0000000,X2=0.0000000,Y2=138.0000000)
    strPoint="???"
    strCash="??"
    strTopButton[0]="??"
    strTopButton[1]="?? ??"
    strTopButton[2]="??"
    strTopButton[3]="???"
    strTopButton[4]="??"
    strTopButton[5]="?? ??"
    strSendMail="?? ??"
    strRecvMail="?? ??"
    strCashItemMail="?? ???"
    strUndefine="???"
    strDay="?"
    strHour="??"
    strEmpty="??"
    bBoundToParent=true
    bScaleToParent=true
}