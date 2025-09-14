class BTROWeaponUIGaugeHK extends RenderObject;

var bool bHideAllExceptName;
var bool bHideGaugeBack;
var bool bHideValue;
var int TextX;
var int GaugeStartX;
var int GaugeEndX;
var int ValueX;
var string GaugeName;
var array<int> DataArray;
var array<Text> textArray;
var int gwidth;
var int gmove;

function Init()
{
    textArray.Length = 2;
    textArray[0] = Class'Engine.BTCustomDrawHK'.static.MakeText(9, 3, "Test");
    textArray[1] = Class'Engine.BTCustomDrawHK'.static.MakeTextColor(8, 3, "Test", Class'GUIWarfareControls_Decompressed.BTUIColorPoolHK'.static.ItemUIStatus_Normal(), Class'GUIWarfareControls_Decompressed.BTUIColorPoolHK'.static.DefaultShadow());
    SetData("HK", 50, Rand(100));
    SetPos(2, 40, 146, 156);
    //return;    
}

function SetData(string GaugeName, int A, int B)
{
    self.GaugeName = GaugeName;
    DataArray.Length = 2;
    DataArray[0] = A;
    DataArray[1] = B;
    textArray.Length = 2;
    textArray[0].Text = string(A + B);
    // End:0xA0
    if(B > 0)
    {
        textArray[1].Text = ("(+" $ string(B)) $ ")";
        textArray[1].DrawColor = Class'GUIWarfareControls_Decompressed.BTUIColorPoolHK'.static.ItemUIStatus_Plus();        
    }
    else
    {
        // End:0xE8
        if(B < 0)
        {
            textArray[1].Text = ("(" $ string(B)) $ ")";
            textArray[1].DrawColor = Class'GUIWarfareControls_Decompressed.BTUIColorPoolHK'.static.ItemUIStatus_Minus();            
        }
        else
        {
            textArray[1].Text = "";
        }
    }
    bNeedUpdate = true;
    //return;    
}

function SetPos(int TextX, int GaugeStartX, int GaugeEndX, int ValueX)
{
    self.TextX = TextX;
    self.GaugeStartX = GaugeStartX;
    self.GaugeEndX = GaugeEndX;
    self.ValueX = ValueX;
    bNeedUpdate = true;
    //return;    
}

function Update(optional Canvas C, optional float Delta)
{
    gwidth = int((float(DataArray[0]) / 100.0000000) * float(GaugeEndX - GaugeStartX));
    // End:0x60
    if(DataArray[1] > 0)
    {
        gmove = int((float(DataArray[1]) / 100.0000000) * float(GaugeEndX - GaugeStartX));        
    }
    else
    {
        // End:0x97
        if(DataArray[1] < 0)
        {
            gmove = int(-(float(DataArray[1]) / 100.0000000) * float(GaugeEndX - GaugeStartX));
        }
    }
    //return;    
}

function bool Render(Canvas C, optional float Delta)
{
    // End:0x18
    if(super.Render(C, Delta) == false)
    {
        return false;
    }
    C.DrawColor = Class'GUIWarfareControls_Decompressed.BTUIColorPoolHK'.static.DefaultWhite();
    Class'Engine.BTCustomDrawHK'.static.DrawString(C, GaugeName, textArray[0].FontDrawType, float(textArray[0].FontSize), AWinPos.X1 + float(TextX), AWinPos.Y1, AWinPos.X1 + float(GaugeStartX), AWinPos.Y2);
    // End:0xAE
    if(bHideAllExceptName)
    {
        return true;
    }
    // End:0x116
    if(bHideGaugeBack == false)
    {
        Class'Engine.BTCustomDrawHK'.static.DrawImage(C, Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.sgau_weap_back, AWinPos.X1 + float(GaugeStartX), AWinPos.Y1, AWinPos.X1 + float(GaugeEndX), AWinPos.Y2);
    }
    Class'Engine.BTCustomDrawHK'.static.DrawImage(C, Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.sgau_weap_gauge, AWinPos.X1 + float(GaugeStartX), AWinPos.Y1, (AWinPos.X1 + float(GaugeStartX)) + float(gwidth), AWinPos.Y2);
    // End:0x202
    if(DataArray[1] > 0)
    {
        Class'Engine.BTCustomDrawHK'.static.DrawImage(C, Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.sgau_weap_incre, (AWinPos.X1 + float(GaugeStartX)) + float(gwidth), AWinPos.Y1, ((AWinPos.X1 + float(GaugeStartX)) + float(gwidth)) + float(gmove), AWinPos.Y2);        
    }
    else
    {
        // End:0x286
        if(DataArray[1] < 0)
        {
            Class'Engine.BTCustomDrawHK'.static.DrawImage(C, Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.sgau_weap_decre, ((AWinPos.X1 + float(GaugeStartX)) + float(gwidth)) - float(gmove), AWinPos.Y1, (AWinPos.X1 + float(GaugeStartX)) + float(gwidth), AWinPos.Y2);
        }
    }
    // End:0x2E0
    if(bHideValue == false)
    {
        Class'Engine.BTCustomDrawHK'.static.DrawTextArray(C, textArray, 3, 2, AWinPos.X1 + float(ValueX), AWinPos.Y1, AWinPos.X2, AWinPos.Y2);
    }
    return true;
    //return;    
}
