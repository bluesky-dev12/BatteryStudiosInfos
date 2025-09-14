class BTROWeaponStatusBarHKCN extends BTROWeaponStatusBarHK;

function Init()
{
    DataArray.Length = 2;
    textArray.Length = 2;
    textArray[0] = Class'Engine.BTCustomDrawHK'.static.MakeText(9, 4, "Test");
    textArray[1] = Class'Engine.BTCustomDrawHK'.static.MakeTextColor(8, 4, "Test", Class'Engine.Canvas'.static.MakeColor(byte(255), byte(255), 0, byte(255)), Class'Engine.Canvas'.static.MakeColor(0, 0, 0, byte(255)));
    plus_c = Class'GUIWarfareControls_Decompressed.BTUIColorPoolHK'.static.ItemUIStatus_Plus();
    minus_c = Class'GUIWarfareControls_Decompressed.BTUIColorPoolHK'.static.ItemUIStatus_Minus();
    DrawType = 0;
    TADrawType = 2;
    Gauge = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.sgau_weap_gauge_y;
    Plus = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.sgau_weap_incre_g;
    Minus = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.sgau_weap_decre_r;
    AllTextWidth = 55;
    BnTSpace = 7;
    //return;    
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
        textArray[1].Text = ("(+" $ string(B)) $ ")";
        textArray[1].DrawColor = plus_c;        
    }
    else
    {
        // End:0xC4
        if(B < 0)
        {
            textArray[1].Text = ("(" $ string(B)) $ ")";
            textArray[1].DrawColor = minus_c;            
        }
        else
        {
            textArray[1].Text = "";
        }
    }
    //return;    
}

function bool Render(Canvas C, optional float Delta)
{
    local int gwidth, gmove;

    // End:0x0E
    if(bVisible == false)
    {
        return false;
    }
    gwidth = int((float(DataArray[0]) / 100.0000000) * (AWinPos.X2 - AWinPos.X1));
    // End:0x7E
    if(DataArray[1] > 0)
    {
        gmove = int((float(DataArray[1]) / 100.0000000) * (AWinPos.X2 - AWinPos.X1));        
    }
    else
    {
        // End:0xBD
        if(DataArray[1] < 0)
        {
            gmove = int(-(float(DataArray[1]) / 100.0000000) * (AWinPos.X2 - AWinPos.X1));
        }
    }
    Class'Engine.BTCustomDrawHK'.static.DrawImage(C, Gauge, AWinPos.X1, AWinPos.Y1, AWinPos.X1 + float(gwidth), AWinPos.Y2);
    // End:0x173
    if(DataArray[1] > 0)
    {
        Class'Engine.BTCustomDrawHK'.static.DrawImage(C, Plus, AWinPos.X1 + float(gwidth), AWinPos.Y1, (AWinPos.X1 + float(gwidth)) + float(gmove), AWinPos.Y2);        
    }
    else
    {
        // End:0x1DC
        if(DataArray[1] < 0)
        {
            Class'Engine.BTCustomDrawHK'.static.DrawImage(C, Minus, (AWinPos.X1 + float(gwidth)) - float(gmove), AWinPos.Y1, AWinPos.X1 + float(gwidth), AWinPos.Y2);
        }
    }
    return true;
    //return;    
}
