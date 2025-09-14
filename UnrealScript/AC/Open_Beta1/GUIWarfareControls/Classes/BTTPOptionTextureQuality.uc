class BTTPOptionTextureQuality extends BTTabPanelHK
    editinlinenew
    instanced;

var export editinline ButtonGroups TextureQualityGroup;
var export editinline BTOwnerDrawCaptionButtonHK TextureQualityButton[4];
var localized string strTexQuality[4];

function InitComponent(GUIController MyController, GUIComponent myOwner)
{
    local int i;
    local FloatBox fb;

    super(GUIPanel).InitComponent(MyController, myOwner);
    TextureQualityGroup = ButtonGroups(NewComponent(new Class'GUIWarfareControls_Decompressed.ButtonGroups', Class'Engine.BTCustomDrawHK'.static.MakeEmptyBox()));
    i = 0;
    J0x40:

    // End:0x165 [Loop If]
    if(i < 4)
    {
        fb = Class'Engine.BTCustomDrawHK'.static.MakeFloatBox(AWinPos.X1 + float(i * 70), AWinPos.Y1, (AWinPos.X1 + float(i * 70)) + float(68), AWinPos.Y1 + float(28));
        TextureQualityButton[i] = NewButtonComponent(fb);
        TextureQualityButton[i].SetGraphicUpDownBtnImage();
        TextureQualityButton[i].SetDefaultFontColor();
        TextureQualityButton[i].SetFontSizeAll(9);
        TextureQualityButton[i].ButtonID = i;
        TextureQualityButton[i].Caption = strTexQuality[i];
        TextureQualityGroup.AddButton(TextureQualityButton[i]);
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
    if(i < 4)
    {
        fb = Class'Engine.BTCustomDrawHK'.static.MakeFloatBox(AWinPos.X1 + float(i * 70), AWinPos.Y1, (AWinPos.X1 + float(i * 70)) + float(68), AWinPos.Y1 + float(28));
        TextureQualityButton[i].AWinPos = fb;
        TextureQualityButton[i].ApplyAWinPos();
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
    if(i < 4)
    {
        TextureQualityButton[i].SetGraphicUpDownBtnImage();
        i++;
        // [Loop Continue]
        goto J0x07;
    }
    TextureQualityButton[TextureQualityGroup.GetSelectIndex()].buttonImage[0] = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.Button_Graphic_Opt_all_1_on;
    //return;    
}

function bool DisableAllButton()
{
    local int i;

    i = 0;
    J0x07:

    // End:0x32 [Loop If]
    if(i < 4)
    {
        TextureQualityButton[i].DisableMe();
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
    if(i < 4)
    {
        TextureQualityButton[i].EnableMe();
        i++;
        // [Loop Continue]
        goto J0x07;
    }
    return true;
    //return;    
}

defaultproperties
{
    strTexQuality[0]="Low"
    strTexQuality[1]="Normal"
    strTexQuality[2]="High"
    strTexQuality[3]="Very High"
}