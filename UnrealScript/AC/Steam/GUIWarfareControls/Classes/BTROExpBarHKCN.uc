/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path GUIWarfareControls\Classes\BTROExpBarHKCN.uc
 * Package Imports:
 *	GUIWarfareControls
 *	Core
 *
 * Stats:
 *	Properties:10
 *	Functions:4
 *
 *******************************************************************************/
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
    PercText = class'BTCustomDrawHK'.static.MakeText(9, 4, "Test");
    back = class'BTUIResourcePoolHK'.default.newgau_exp_back;
    Gauge = class'BTUIResourcePoolHK'.default.newgau_exp_gauge;
    Arrow = class'BTUIResourcePoolHK'.default.img_gauge_arow;
    bRenderText = true;
    SetData(1000, 2500);
}

function SetData(int A, int B, optional bool bUsePercColor, optional bool bUseSlashText)
{
    // End:0x12
    if(A < 0)
    {
        A = 0;
    }
    // End:0x2c
    if(A > B)
    {
        A = B;
    }
    // End:0x3f
    if(B <= 0)
    {
        B = 100;
    }
    DataArray[0] = A;
    DataArray[1] = B;
    DataPerc = float(A) / float(B);
    // End:0x9b
    if(bUseSlashText)
    {
        PercText.Text = string(A) $ "/" $ string(B);
    }
    // End:0xba
    else
    {
        PercText.Text = string(int(DataPerc * float(100))) $ "%";
    }
    // End:0x102
    if(bUsePercColor)
    {
        PercText.DrawColor = class'Canvas'.static.MakeColor(byte(255), byte(float(255) * DataPerc), byte(float(255) * DataPerc), byte(255));
    }
    // End:0x12c
    else
    {
        PercText.DrawColor = class'Canvas'.static.MakeColor(byte(255), byte(255), byte(255), byte(255));
    }
    DataPerc = 1.0 - DataPerc;
}

function bool Render(Canvas C, optional float Delta)
{
    local int DataPixelX;

    // End:0x0e
    if(bVisible == false)
    {
        return false;
    }
    C.Style = 5;
    class'BTCustomDrawHK'.static.DrawImage(C, back, AWinPos.X1, AWinPos.Y1, AWinPos.X2, AWinPos.Y2);
    // End:0x7f
    if(DataPerc < float(0) || DataPerc > float(1))
    {
    }
    // End:0xc0
    else
    {
        class'BTCustomDrawHK'.static.DrawImagePadding(C, Gauge, 846.0, 583.0, 986.0, 597.0, 0.0, 0.0, DataPerc, 0.0);
    }
    DataPixelX = int(AWinPos.X1 + AWinPos.X2 - AWinPos.X1 - float(8) * float(1) - DataPerc);
    // End:0x1b8
    if(bDrawArrow)
    {
        class'BTCustomDrawHK'.static.DrawImage(C, Arrow, float(DataPixelX) - Arrow.width / float(2), AWinPos.Y1 - Arrow.Height - AWinPos.Y2 - AWinPos.Y1 / float(2), float(DataPixelX) + Arrow.width / float(2), AWinPos.Y2 + Arrow.Height - AWinPos.Y2 - AWinPos.Y1 / float(2));
    }
    // End:0x228
    if(bRenderText)
    {
        class'BTCustomDrawHK'.static.DrawText(C, PercText, AWinPos.X1 + PercTextPadding[0], AWinPos.Y1 + PercTextPadding[1], AWinPos.X2 - PercTextPadding[2], AWinPos.Y2 - PercTextPadding[3]);
    }
    return true;
}

function bool RenderUsingCache(Canvas C, optional float Delta, optional int Level)
{
    // End:0x0e
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
    class'BTCustomDrawHK'.static.DrawImageCache(C, back, AWinPos.X1, AWinPos.Y1, AWinPos.X2, AWinPos.Y2, Level);
    class'BTCustomDrawHK'.static.DrawImagePaddingCache(C, Gauge, AWinPos.X1 + float(LineWidth), AWinPos.Y1 + float(LineWidth), AWinPos.X2 - float(LineWidth), AWinPos.Y2 - float(LineWidth), 0.0, 0.0, DataPerc, 0.0, Level);
    // End:0x178
    if(bRenderText)
    {
        class'BTCustomDrawHK'.static.DrawTextCache(C, PercText, AWinPos.X1 + PercTextPadding[0] + float(11), AWinPos.Y1 + PercTextPadding[1], AWinPos.X2 - PercTextPadding[2], AWinPos.Y2 - PercTextPadding[3], Level);
    }
    // End:0x192
    if(Level == 0)
    {
        C.EndCache();
    }
    return true;
}

defaultproperties
{
    LineWidth=1
}