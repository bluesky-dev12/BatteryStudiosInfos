/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path GUIWarfareControls\Classes\BTROWeaponStatusBarHKCN.uc
 * Package Imports:
 *	GUIWarfareControls
 *	Core
 *
 * Stats:
 *	Functions:3
 *
 *******************************************************************************/
class BTROWeaponStatusBarHKCN extends BTROWeaponStatusBarHK;

function Init()
{
    DataArray.Length = 2;
    textArray.Length = 2;
    textArray[0] = class'BTCustomDrawHK'.static.MakeText(9, 4, "Test");
    textArray[1] = class'BTCustomDrawHK'.static.MakeTextColor(8, 4, "Test", class'Canvas'.static.MakeColor(byte(255), byte(255), 0, byte(255)), class'Canvas'.static.MakeColor(0, 0, 0, byte(255)));
    plus_c = class'BTUIColorPoolHK'.static.ItemUIStatus_Plus();
    minus_c = class'BTUIColorPoolHK'.static.ItemUIStatus_Minus();
    DrawType = 0;
    TADrawType = 2;
    Gauge = class'BTUIResourcePoolHK'.default.sgau_weap_gauge_y;
    Plus = class'BTUIResourcePoolHK'.default.sgau_weap_incre_g;
    Minus = class'BTUIResourcePoolHK'.default.sgau_weap_decre_r;
    AllTextWidth = 55;
    BnTSpace = 7;
}

function SetData(int A, int B)
{
    DataArray.Length = 2;
    DataArray[0] = A;
    DataArray[1] = B;
    textArray.Length = 2;
    textArray[0].Text = string(A + B);
    // End:0x86
    if(B > 0)
    {
        textArray[1].Text = "(+" $ string(B) $ ")";
        textArray[1].DrawColor = plus_c;
    }
    // End:0xd3
    else
    {
        // End:0xc4
        if(B < 0)
        {
            textArray[1].Text = "(" $ string(B) $ ")";
            textArray[1].DrawColor = minus_c;
        }
        // End:0xd3
        else
        {
            textArray[1].Text = "";
        }
    }
}

function bool Render(Canvas C, optional float Delta)
{
    local int gwidth, gmove;

    // End:0x0e
    if(bVisible == false)
    {
        return false;
    }
    gwidth = int(float(DataArray[0]) / 100.0 * AWinPos.X2 - AWinPos.X1);
    // End:0x7e
    if(DataArray[1] > 0)
    {
        gmove = int(float(DataArray[1]) / 100.0 * AWinPos.X2 - AWinPos.X1);
    }
    // End:0xbd
    else
    {
        // End:0xbd
        if(DataArray[1] < 0)
        {
            gmove = int(-float(DataArray[1]) / 100.0 * AWinPos.X2 - AWinPos.X1);
        }
    }
    class'BTCustomDrawHK'.static.DrawImage(C, Gauge, AWinPos.X1, AWinPos.Y1, AWinPos.X1 + float(gwidth), AWinPos.Y2);
    // End:0x173
    if(DataArray[1] > 0)
    {
        class'BTCustomDrawHK'.static.DrawImage(C, Plus, AWinPos.X1 + float(gwidth), AWinPos.Y1, AWinPos.X1 + float(gwidth) + float(gmove), AWinPos.Y2);
    }
    // End:0x1dc
    else
    {
        // End:0x1dc
        if(DataArray[1] < 0)
        {
            class'BTCustomDrawHK'.static.DrawImage(C, Minus, AWinPos.X1 + float(gwidth) - float(gmove), AWinPos.Y1, AWinPos.X1 + float(gwidth), AWinPos.Y2);
        }
    }
    return true;
}
