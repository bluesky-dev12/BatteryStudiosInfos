class BTROExpBarHKCN extends RenderObject;

var bool bDrawArrow;
var bool bRenderText;
var Image back;
var Image Gauge;
var Image Arrow;
var array<int> DataArray;
var float DataPerc;
var Text PercText;
var float PercTextPadding[4];
var int LineWidth;

function Init()
{
    DataArray.Length = 2;
    PercText = Class'Engine.BTCustomDrawHK'.static.MakeText(9, 4, "Test");
    back = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.newgau_exp_back;
    Gauge = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.newgau_exp_gauge;
    Arrow = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.img_gauge_arow;
    bRenderText = true;
    SetData(1000, 2500);
    //return;    
}

function SetData(int A, int B, optional bool bUsePercColor, optional bool bUseSlashText)
{
    // End:0x12
    if(A < 0)
    {
        A = 0;
    }
    // End:0x2C
    if(A > B)
    {
        A = B;
    }
    // End:0x3F
    if(B <= 0)
    {
        B = 100;
    }
    DataArray[0] = A;
    DataArray[1] = B;
    DataPerc = float(A) / float(B);
    // End:0x9B
    if(bUseSlashText)
    {
        PercText.Text = (string(A) $ "/") $ string(B);        
    }
    else
    {
        PercText.Text = string(int(DataPerc * float(100))) $ "%";
    }
    // End:0x102
    if(bUsePercColor)
    {
        PercText.DrawColor = Class'Engine.Canvas'.static.MakeColor(byte(255), byte(float(255) * DataPerc), byte(float(255) * DataPerc), byte(255));        
    }
    else
    {
        PercText.DrawColor = Class'Engine.Canvas'.static.MakeColor(byte(255), byte(255), byte(255), byte(255));
    }
    DataPerc = 1.0000000 - DataPerc;
    //return;    
}

function bool Render(Canvas C, optional float Delta)
{
    local int DataPixelX;

    // End:0x0E
    if(bVisible == false)
    {
        return false;
    }
    C.Style = 5;
    Class'Engine.BTCustomDrawHK'.static.DrawImage(C, back, AWinPos.X1, AWinPos.Y1, AWinPos.X2, AWinPos.Y2);
    // End:0x7F
    if((DataPerc < float(0)) || DataPerc > float(1))
    {        
    }
    else
    {
        Class'Engine.BTCustomDrawHK'.static.DrawImagePadding(C, Gauge, 846.0000000, 583.0000000, 986.0000000, 597.0000000, 0.0000000, 0.0000000, DataPerc, 0.0000000);
    }
    DataPixelX = int(AWinPos.X1 + (((AWinPos.X2 - AWinPos.X1) - float(8)) * (float(1) - DataPerc)));
    // End:0x1B8
    if(bDrawArrow)
    {
        Class'Engine.BTCustomDrawHK'.static.DrawImage(C, Arrow, float(DataPixelX) - (Arrow.width / float(2)), AWinPos.Y1 - ((Arrow.Height - (AWinPos.Y2 - AWinPos.Y1)) / float(2)), float(DataPixelX) + (Arrow.width / float(2)), AWinPos.Y2 + ((Arrow.Height - (AWinPos.Y2 - AWinPos.Y1)) / float(2)));
    }
    // End:0x228
    if(bRenderText)
    {
        Class'Engine.BTCustomDrawHK'.static.DrawText(C, PercText, AWinPos.X1 + PercTextPadding[0], AWinPos.Y1 + PercTextPadding[1], AWinPos.X2 - PercTextPadding[2], AWinPos.Y2 - PercTextPadding[3]);
    }
    return true;
    //return;    
}

function bool RenderUsingCache(Canvas C, optional float Delta, optional int Level)
{
    // End:0x0E
    if(bVisible == false)
    {
        return false;
    }
    // End:0x28
    if(Level == 0)
    {
        C.BeginCache();
    }
    C.Style = 5;
    Class'Engine.BTCustomDrawHK'.static.DrawImageCache(C, back, AWinPos.X1, AWinPos.Y1, AWinPos.X2, AWinPos.Y2, Level);
    Class'Engine.BTCustomDrawHK'.static.DrawImagePaddingCache(C, Gauge, AWinPos.X1 + float(LineWidth), AWinPos.Y1 + float(LineWidth), AWinPos.X2 - float(LineWidth), AWinPos.Y2 - float(LineWidth), 0.0000000, 0.0000000, DataPerc, 0.0000000, Level);
    // End:0x178
    if(bRenderText)
    {
        Class'Engine.BTCustomDrawHK'.static.DrawTextCache(C, PercText, (AWinPos.X1 + PercTextPadding[0]) + float(11), AWinPos.Y1 + PercTextPadding[1], AWinPos.X2 - PercTextPadding[2], AWinPos.Y2 - PercTextPadding[3], Level);
    }
    // End:0x192
    if(Level == 0)
    {
        C.EndCache();
    }
    return true;
    //return;    
}

defaultproperties
{
    LineWidth=1
}