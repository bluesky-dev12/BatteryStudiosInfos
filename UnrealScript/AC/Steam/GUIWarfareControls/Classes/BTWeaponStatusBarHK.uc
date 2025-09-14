/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path GUIWarfareControls\Classes\BTWeaponStatusBarHK.uc
 * Package Imports:
 *	GUIWarfareControls
 *	XInterface
 *	Core
 *
 * Stats:
 *	Properties:8
 *	Functions:3
 *
 *******************************************************************************/
class BTWeaponStatusBarHK extends FloatingImage
    editinlinenew
    instanced;

var Image back;
var Image Gauge;
var Image Plus;
var Image Minus;
var array<int> DataArray;
var array<Text> textArray;
var Engine.BTCustomDrawHK.DrawType DrawType;
var Engine.BTCustomDrawHK.TextArrayDrawType TADrawType;

function InitComponent(GUIController MyController, GUIComponent myOwner)
{
    super(GUIComponent).InitComponent(MyController, myOwner);
    DataArray.Length = 2;
    textArray.Length = 2;
    textArray[0] = class'BTCustomDrawHK'.static.MakeText(12, 4, "Test");
    textArray[1] = class'BTCustomDrawHK'.static.MakeTextColor(9, 4, "Test", class'Canvas'.static.MakeColor(byte(255), byte(255), 0, byte(255)), class'Canvas'.static.MakeColor(0, 0, 0, byte(255)));
    DrawType = 4;
    TADrawType = 2;
    back = class'BTUIResourcePoolHK'.default.sgau_weap_back;
    Gauge = class'BTUIResourcePoolHK'.default.sgau_weap_gauge;
    Plus = class'BTUIResourcePoolHK'.default.sgau_weap_incre;
    Minus = class'BTUIResourcePoolHK'.default.sgau_weap_decre;
}

function SetData(int A, int B)
{
    local string sign;

    DataArray.Length = 2;
    DataArray[0] = A;
    DataArray[1] = B;
    // End:0x3a
    if(B >= 0)
    {
        sign = "+";
    }
    // End:0x42
    else
    {
        sign = "";
    }
    textArray.Length = 2;
    textArray[0].Text = string(A);
    textArray[1].Text = "(" $ sign $ string(B) $ ")";
}

function OnRendered(Canvas C)
{
    local float gwidth, gmove;

    // End:0x0e
    if(bVisible == false)
    {
        return;
    }
    gwidth = float(DataArray[0]) / 100.0 * Bounds[2] - Bounds[0];
    // End:0x70
    if(DataArray[1] > 0)
    {
        gmove = float(DataArray[1]) / 100.0 * Bounds[2] - Bounds[0];
    }
    // End:0xa8
    else
    {
        // End:0xa8
        if(DataArray[1] < 0)
        {
            gmove = -float(DataArray[1]) / 100.0 * Bounds[2] - Bounds[0];
        }
    }
    class'BTCustomDrawHK'.static.DrawImage(C, back, Bounds[0], Bounds[1], Bounds[2], Bounds[3]);
    class'BTCustomDrawHK'.static.DrawImageScaleAllAndPaddingAndClipping(C, Gauge, Bounds[0], Bounds[1], Bounds[2], Bounds[3], 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, float(DataArray[0]) / 100.0, 1.0);
    // End:0x1a4
    if(DataArray[1] > 0)
    {
        class'BTCustomDrawHK'.static.DrawImage(C, Plus, Bounds[0] + gwidth, Bounds[1], Bounds[0] + gwidth + gmove, Bounds[3]);
    }
    // End:0x1fc
    else
    {
        // End:0x1fc
        if(DataArray[1] < 0)
        {
            class'BTCustomDrawHK'.static.DrawImage(C, Minus, Bounds[0] + gwidth - gmove, Bounds[1], Bounds[0] + gwidth, Bounds[3]);
        }
    }
    class'BTCustomDrawHK'.static.DrawTextArray(C, textArray, DrawType, TADrawType, Bounds[2], Bounds[1], Bounds[2] + float(100), Bounds[3]);
}

defaultproperties
{
    bUseAWinPos=true
    RenderWeight=0.20
    bBoundToParent=true
    bScaleToParent=true
    OnRendered=OnRendered
}