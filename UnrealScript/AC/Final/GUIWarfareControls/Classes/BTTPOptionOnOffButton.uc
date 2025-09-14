class BTTPOptionOnOffButton extends BTTabPanelHK
    editinlinenew
    instanced;

var export editinline ButtonGroups BTGroup;
var export editinline BTOwnerDrawCaptionButtonHK CaptionButton[2];
var localized string strOnOff[2];

function InitComponent(GUIController MyController, GUIComponent myOwner)
{
    local int i;
    local FloatBox fb;

    super.InitComponent(MyController, myOwner);
    BTGroup = ButtonGroups(NewComponent(new Class'GUIWarfareControls_Decompressed.ButtonGroups', Class'Engine.BTCustomDrawHK'.static.MakeEmptyBox()));
    i = 0;
    J0x40:

    // End:0x165 [Loop If]
    if(i < 2)
    {
        fb = Class'Engine.BTCustomDrawHK'.static.MakeFloatBox(AWinPos.X1 + float(i * 70), AWinPos.Y1, (AWinPos.X1 + float(i * 70)) + float(68), AWinPos.Y1 + float(28));
        CaptionButton[i] = NewButtonComponent(fb);
        CaptionButton[i].SetGraphicUpDownBtnImage();
        CaptionButton[i].SetDefaultFontColor();
        CaptionButton[i].SetFontSizeAll(9);
        CaptionButton[i].ButtonID = i;
        CaptionButton[i].Caption = strOnOff[i];
        BTGroup.AddButton(CaptionButton[i]);
        i++;
        // [Loop Continue]
        goto J0x40;
    }
    //return;    
}

function ApplyAWinPos()
{
    local int i;
    local FloatBox fb;

    super(GUIComponent).ApplyAWinPos();
    i = 0;
    J0x0D:

    // End:0xB5 [Loop If]
    if(i < 2)
    {
        fb = Class'Engine.BTCustomDrawHK'.static.MakeFloatBox(AWinPos.X1 + float(i * 70), AWinPos.Y1, (AWinPos.X1 + float(i * 70)) + float(68), AWinPos.Y1 + float(28));
        CaptionButton[i].AWinPos = fb;
        CaptionButton[i].ApplyAWinPos();
        i++;
        // [Loop Continue]
        goto J0x0D;
    }
    //return;    
}

function ChangeButtonImage()
{
    local int i;

    i = 0;
    J0x07:

    // End:0x32 [Loop If]
    if(i < 2)
    {
        CaptionButton[i].SetGraphicUpDownBtnImage();
        i++;
        // [Loop Continue]
        goto J0x07;
    }
    CaptionButton[BTGroup.GetSelectIndex()].buttonImage[0] = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.Button_Graphic_Opt_all_1_on;
    //return;    
}

function bool DisableAllButton()
{
    local int i;

    i = 0;
    J0x07:

    // End:0x32 [Loop If]
    if(i < 2)
    {
        CaptionButton[i].DisableMe();
        i++;
        // [Loop Continue]
        goto J0x07;
    }
    return true;
    //return;    
}

function bool EnableAllButton()
{
    local int i;

    i = 0;
    J0x07:

    // End:0x32 [Loop If]
    if(i < 2)
    {
        CaptionButton[i].EnableMe();
        i++;
        // [Loop Continue]
        goto J0x07;
    }
    return true;
    //return;    
}

defaultproperties
{
    strOnOff[0]="Off"
    strOnOff[1]="On"
}