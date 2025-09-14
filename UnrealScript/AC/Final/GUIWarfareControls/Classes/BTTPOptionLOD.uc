class BTTPOptionLOD extends BTTabPanelHK
    editinlinenew
    instanced;

var export editinline ButtonGroups LODGroup;
var export editinline BTOwnerDrawCaptionButtonHK LODButton[4];
var localized string strLOD[4];

function InitComponent(GUIController MyController, GUIComponent myOwner)
{
    local int i;
    local FloatBox fb;

    super.InitComponent(MyController, myOwner);
    LODGroup = ButtonGroups(NewComponent(new Class'GUIWarfareControls_Decompressed.ButtonGroups', Class'Engine.BTCustomDrawHK'.static.MakeEmptyBox()));
    i = 0;
    J0x40:

    // End:0x165 [Loop If]
    if(i < 4)
    {
        fb = Class'Engine.BTCustomDrawHK'.static.MakeFloatBox(AWinPos.X1 + float(i * 70), AWinPos.Y1, (AWinPos.X1 + float(i * 70)) + float(68), AWinPos.Y1 + float(28));
        LODButton[i] = NewButtonComponent(fb);
        LODButton[i].SetGraphicUpDownBtnImage();
        LODButton[i].SetDefaultFontColor();
        LODButton[i].SetFontSizeAll(9);
        LODButton[i].ButtonID = i;
        LODButton[i].Caption = strLOD[i];
        LODGroup.AddButton(LODButton[i]);
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
        LODButton[i].AWinPos = fb;
        LODButton[i].ApplyAWinPos();
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
        LODButton[i].SetGraphicUpDownBtnImage();
        i++;
        // [Loop Continue]
        goto J0x07;
    }
    LODButton[LODGroup.GetSelectIndex()].buttonImage[0] = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.Button_Graphic_Opt_all_1_on;
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
        LODButton[i].DisableMe();
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
        LODButton[i].EnableMe();
        i++;
        // [Loop Continue]
        goto J0x07;
    }
    return true;
    //return;    
}

defaultproperties
{
    strLOD[0]="Low"
    strLOD[1]="Normal"
    strLOD[2]="High"
    strLOD[3]="Very High"
}