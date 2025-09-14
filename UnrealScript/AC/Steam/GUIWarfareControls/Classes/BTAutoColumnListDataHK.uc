/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path GUIWarfareControls\Classes\BTAutoColumnListDataHK.uc
 * Package Imports:
 *	GUIWarfareControls
 *	Core
 *
 * Stats:
 *	Structs:1
 *	Properties:5
 *	Functions:2
 *
 *******************************************************************************/
class BTAutoColumnListDataHK extends Object
    dependson(BTUIColorPoolHK);

struct ACLData
{
    var() string strValue;
    var() int IntValue;
    var() int tempValue;
    var() float floatValue;
    var() Image Image;
    var() Text Text[3];
    var() Image ServerGroupImg;
};

var() /*0x00000000-0x80000000*/ databinding editinlinenotify bool bCustomSpliter;
var() /*0x00000000-0x80000000*/ databinding editinlinenotify bool bSpliter;
var() /*0x00000000-0x80000000*/ databinding editinlinenotify int SpliterIndex;
var() array<ACLData> DataPerColumn;
var() Image BackgroundImage;

function Init(int ColumnCount)
{
    local int i;

    bSpliter = false;
    SpliterIndex = 0;
    DataPerColumn.Length = ColumnCount;
    BackgroundImage.Image = none;
    BackgroundImage.width = 0.0;
    BackgroundImage.Height = 0.0;
    BackgroundImage.DrawType = 28;
    i = 0;
    J0x5b:
    // End:0x7f [While If]
    if(i < ColumnCount)
    {
        InitData(i);
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x5b;
    }
}

function InitData(int Index)
{
    local int i;

    DataPerColumn[Index].strValue = "";
    DataPerColumn[Index].IntValue = 0;
    DataPerColumn[Index].floatValue = 0.0;
    DataPerColumn[Index].Image.Image = none;
    DataPerColumn[Index].Image.width = 0.0;
    DataPerColumn[Index].Image.Height = 0.0;
    DataPerColumn[Index].Image.DrawType = 28;
    i = 0;
    J0xa7:
    // End:0xf9 [While If]
    if(i < 3)
    {
        DataPerColumn[Index].Text[i].FontSize = 10;
        DataPerColumn[Index].Text[i].FontDrawType = 3;
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0xa7;
    }
    i = 0;
    DataPerColumn[Index].Text[i].DrawColor = class'BTUIColorPoolHK'.static.ListItem_Normal();
    DataPerColumn[Index].Text[i].DrawShadowColor = class'BTUIColorPoolHK'.static.DefaultShadow();
    i = 1;
    DataPerColumn[Index].Text[i].DrawColor = class'BTUIColorPoolHK'.static.ListItem_On();
    DataPerColumn[Index].Text[i].DrawShadowColor = class'BTUIColorPoolHK'.static.DefaultShadow();
    i = 2;
    DataPerColumn[Index].Text[i].DrawColor = class'BTUIColorPoolHK'.static.ListItem_Select();
    DataPerColumn[Index].Text[i].DrawShadowColor = class'BTUIColorPoolHK'.static.DefaultShadow();
}
