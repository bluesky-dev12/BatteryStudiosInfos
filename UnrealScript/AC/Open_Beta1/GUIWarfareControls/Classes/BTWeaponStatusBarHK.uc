class BTWeaponStatusBarHK extends FloatingImage
    editinlinenew
    instanced;

var Image back;
var Image Gauge;
var Image Plus;
var Image Minus;
var array<int> DataArray;
var array<Text> textArray;
var BTCustomDrawHK.DrawType DrawType;
var BTCustomDrawHK.TextArrayDrawType TADrawType;

function InitComponent(GUIController MyController, GUIComponent myOwner)
{
    super(GUIComponent).InitComponent(MyController, myOwner);
    DataArray.Length = 2;
    textArray.Length = 2;
    textArray[0] = Class'Engine.BTCustomDrawHK'.static.MakeText(12, 4, "Test");
    textArray[1] = Class'Engine.BTCustomDrawHK'.static.MakeTextColor(9, 4, "Test", Class'Engine.Canvas'.static.MakeColor(byte(255), byte(255), 0, byte(255)), Class'Engine.Canvas'.static.MakeColor(0, 0, 0, byte(255)));
    DrawType = 4;
    TADrawType = 2;
    back = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.sgau_weap_back;
    Gauge = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.sgau_weap_gauge;
    Plus = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.sgau_weap_incre;
    Minus = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.sgau_weap_decre;
    //return;    
}

function SetData(int A, int B)
{
    local string sign;

    DataArray.Length = 2;
    DataArray[0] = A;
    DataArray[1] = B;
    // End:0x3A
    if(B >= 0)
    {
        sign = "+";        
    }
    else
    {
        sign = "";
    }
    textArray.Length = 2;
    textArray[0].Text = string(A);
    textArray[1].Text = (("(" $ sign) $ string(B)) $ ")";
    //return;    
}

function OnRendered(Canvas C)
{
    local float gwidth, gmove;

    // End:0x0E
    if(bVisible == false)
    {
        return;
    }
    gwidth = (float(DataArray[0]) / 100.0000000) * (Bounds[2] - Bounds[0]);
    // End:0x70
    if(DataArray[1] > 0)
    {
        gmove = (float(DataArray[1]) / 100.0000000) * (Bounds[2] - Bounds[0]);        
    }
    else
    {
        // End:0xA8
        if(DataArray[1] < 0)
        {
            gmove = -(float(DataArray[1]) / 100.0000000) * (Bounds[2] - Bounds[0]);
        }
    }
    Class'Engine.BTCustomDrawHK'.static.DrawImage(C, back, Bounds[0], Bounds[1], Bounds[2], Bounds[3]);
    Class'Engine.BTCustomDrawHK'.static.DrawImageScaleAllAndPaddingAndClipping(C, Gauge, Bounds[0], Bounds[1], Bounds[2], Bounds[3], 0.0000000, 0.0000000, 0.0000000, 0.0000000, 0.0000000, 0.0000000, float(DataArray[0]) / 100.0000000, 1.0000000);
    // End:0x1A4
    if(DataArray[1] > 0)
    {
        Class'Engine.BTCustomDrawHK'.static.DrawImage(C, Plus, Bounds[0] + gwidth, Bounds[1], (Bounds[0] + gwidth) + gmove, Bounds[3]);        
    }
    else
    {
        // End:0x1FC
        if(DataArray[1] < 0)
        {
            Class'Engine.BTCustomDrawHK'.static.DrawImage(C, Minus, (Bounds[0] + gwidth) - gmove, Bounds[1], Bounds[0] + gwidth, Bounds[3]);
        }
    }
    Class'Engine.BTCustomDrawHK'.static.DrawTextArray(C, textArray, DrawType, TADrawType, Bounds[2], Bounds[1], Bounds[2] + float(100), Bounds[3]);
    //return;    
}

defaultproperties
{
    bUseAWinPos=true
    RenderWeight=0.2000000
    bBoundToParent=false
    bScaleToParent=false
    OnRendered=BTWeaponStatusBarHK.OnRendered
}