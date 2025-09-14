class BTAutoColumnListDataHK extends Object;

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

var() automated bool bCustomSpliter;
var() automated bool bSpliter;
var() automated int SpliterIndex;
var() array<ACLData> DataPerColumn;
var() Image BackgroundImage;

function Init(int ColumnCount)
{
    local int i;

    bSpliter = false;
    SpliterIndex = 0;
    DataPerColumn.Length = ColumnCount;
    BackgroundImage.Image = none;
    BackgroundImage.width = 0.0000000;
    BackgroundImage.Height = 0.0000000;
    BackgroundImage.DrawType = 28;
    i = 0;
    J0x5B:

    // End:0x7F [Loop If]
    if(i < ColumnCount)
    {
        InitData(i);
        i++;
        // [Loop Continue]
        goto J0x5B;
    }
    //return;    
}

function InitData(int Index)
{
    local int i;

    DataPerColumn[Index].strValue = "";
    DataPerColumn[Index].IntValue = 0;
    DataPerColumn[Index].floatValue = 0.0000000;
    DataPerColumn[Index].Image.Image = none;
    DataPerColumn[Index].Image.width = 0.0000000;
    DataPerColumn[Index].Image.Height = 0.0000000;
    DataPerColumn[Index].Image.DrawType = 28;
    i = 0;
    J0xA7:

    // End:0xF9 [Loop If]
    if(i < 3)
    {
        DataPerColumn[Index].Text[i].FontSize = 10;
        DataPerColumn[Index].Text[i].FontDrawType = 3;
        i++;
        // [Loop Continue]
        goto J0xA7;
    }
    i = 0;
    DataPerColumn[Index].Text[i].DrawColor = Class'GUIWarfareControls_Decompressed.BTUIColorPoolHK'.static.ListItem_Normal();
    DataPerColumn[Index].Text[i].DrawShadowColor = Class'GUIWarfareControls_Decompressed.BTUIColorPoolHK'.static.DefaultShadow();
    i = 1;
    DataPerColumn[Index].Text[i].DrawColor = Class'GUIWarfareControls_Decompressed.BTUIColorPoolHK'.static.ListItem_On();
    DataPerColumn[Index].Text[i].DrawShadowColor = Class'GUIWarfareControls_Decompressed.BTUIColorPoolHK'.static.DefaultShadow();
    i = 2;
    DataPerColumn[Index].Text[i].DrawColor = Class'GUIWarfareControls_Decompressed.BTUIColorPoolHK'.static.ListItem_Select();
    DataPerColumn[Index].Text[i].DrawShadowColor = Class'GUIWarfareControls_Decompressed.BTUIColorPoolHK'.static.DefaultShadow();
    //return;    
}
