/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path GUIWarfareControls\Classes\BTOwnerDrawImageHK.uc
 * Package Imports:
 *	GUIWarfareControls
 *	XInterface
 *	Core
 *
 * Stats:
 *	Properties:17
 *	Functions:8
 *
 *******************************************************************************/
class BTOwnerDrawImageHK extends FloatingImage
    dependson(BTRODecorateStringHK)
    editinlinenew
    instanced;

var int CanvasStyle;
var int LabelID;
var float CurrentTimeSecond;
var float LastTimeSecond;
var bool bUseFontScaleValue;
var float FontScaleValue;
var() /*0x00000000-0x80000000*/ databinding editinlinenotify int FontStyle[5];
var() /*0x00000000-0x80000000*/ databinding editinlinenotify int FontSize[5];
var() /*0x00000000-0x80000000*/ databinding editinlinenotify Color FontColor[5];
var() /*0x00000000-0x80000000*/ databinding editinlinenotify Color FontShadowColor[5];
var() /*0x00000000-0x80000000*/ databinding editinlinenotify int CaptionPadding[4];
var() /*0x00000000-0x80000000*/ databinding editinlinenotify Engine.BTCustomDrawHK.DrawType CaptionDrawType;
var string Caption;
var Image BackgroundImage;
var() bool bDrawToolTips;
var() BTRODecorateStringHK decoToolTips;
var BtrDouble UniqueID;

function SetToolTipsText(string t)
{
    // End:0x3f
    if(decoToolTips == none)
    {
        decoToolTips = new class'BTRODecorateStringHK';
        decoToolTips.Init();
        decoToolTips.OriginalString.FontDrawType = 3;
    }
    decoToolTips.OriginalString.Text = t;
    decoToolTips.bNeedUpdate = true;
}

function SetDefaultFontColor()
{
    local int i;

    i = 0;
    FontColor[i].R = 229;
    FontColor[i].G = 229;
    FontColor[i].B = 229;
    FontColor[i].A = byte(255);
    FontShadowColor[i].R = 0;
    FontShadowColor[i].G = 0;
    FontShadowColor[i].B = 0;
    FontShadowColor[i].A = 100;
    i = 1;
    FontColor[i].R = 0;
    FontColor[i].G = 0;
    FontColor[i].B = 0;
    FontColor[i].A = byte(255);
    FontShadowColor[i].R = 229;
    FontShadowColor[i].G = 229;
    FontShadowColor[i].B = 229;
    FontShadowColor[i].A = 100;
    i = 2;
    FontColor[i].R = byte(255);
    FontColor[i].G = 153;
    FontColor[i].B = 0;
    FontColor[i].A = byte(255);
    FontShadowColor[i].R = 0;
    FontShadowColor[i].G = 0;
    FontShadowColor[i].B = 0;
    FontShadowColor[i].A = 100;
    i = 3;
    FontColor[i].R = 88;
    FontColor[i].G = 88;
    FontColor[i].B = 88;
    FontColor[i].A = byte(255);
    FontShadowColor[i].R = 0;
    FontShadowColor[i].G = 0;
    FontShadowColor[i].B = 0;
    FontShadowColor[i].A = 100;
    i = 4;
    FontColor[i].R = 90;
    FontColor[i].G = 90;
    FontColor[i].B = 90;
    FontColor[i].A = byte(255);
    FontShadowColor[i].R = 0;
    FontShadowColor[i].G = 0;
    FontShadowColor[i].B = 0;
    FontShadowColor[i].A = 100;
}

function SetFontSizeAll(int Size)
{
    local int i;

    i = 0;
    J0x07:
    // End:0x2e [While If]
    if(i < 5)
    {
        FontSize[i] = Size;
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x07;
    }
}

function SetFontColorAll(Color Col)
{
    local int i;

    i = 0;
    J0x07:
    // End:0x2e [While If]
    if(i < 5)
    {
        FontColor[i] = Col;
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x07;
    }
}

function SetFontAndImageColorAll(Color Col)
{
    local int i;

    i = 0;
    J0x07:
    // End:0x2e [While If]
    if(i < 5)
    {
        FontColor[i] = Col;
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x07;
    }
}

function SetFontShadowColorAll(Color Col)
{
    local int i;

    i = 0;
    J0x07:
    // End:0x2e [While If]
    if(i < 5)
    {
        FontShadowColor[i] = Col;
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x07;
    }
}

function SetFontDrawType(Engine.BTCustomDrawHK.DrawType dt)
{
    CaptionDrawType = dt;
}

function Internal_OnRendered(Canvas C)
{
    local float OldValueX, OldValueY;

    // End:0x0e
    if(bVisible == false)
    {
        return;
    }
    C.Style = byte(CanvasStyle);
    // End:0x6b
    if(BackgroundImage.Image != none)
    {
        class'BTCustomDrawHK'.static.DrawImage(C, BackgroundImage, Bounds[0], Bounds[1], Bounds[2], Bounds[3]);
    }
    // End:0x1da
    if(Caption != "")
    {
        C.DrawColor = FontColor[self.MenuState];
        // End:0x111
        if(bUseFontScaleValue)
        {
            OldValueX = C.ClipX;
            OldValueY = C.ClipY;
            C.ClipX = FontScaleValue * C.ClipX;
            C.ClipY = FontScaleValue * C.ClipY;
        }
        class'BTCustomDrawHK'.static.DrawStringPaddingOffset(C, Caption, CaptionDrawType, float(FontSize[self.MenuState]), Bounds[0], Bounds[1], Bounds[2], Bounds[3], CaptionPadding[0], CaptionPadding[1], CaptionPadding[2], CaptionPadding[3], FontShadowColor[self.MenuState], FontStyle[self.MenuState], bUseFontScaleValue);
        // End:0x1da
        if(bUseFontScaleValue)
        {
            C.ClipX = OldValueX;
            C.ClipY = OldValueY;
        }
    }
    // End:0x314
    if(bDrawToolTips == true && decoToolTips != none && decoToolTips.OriginalString.Text != "")
    {
        decoToolTips.AWinPos = AWinPos;
        // End:0x314
        if(decoToolTips.CheckIn(float(int(Controller.MouseX)), float(int(Controller.MouseY))))
        {
            decoToolTips.AWinPos = class'BTCustomDrawHK'.static.MakeFloatBox(float(int(Controller.MouseX)), float(int(Controller.MouseY)), float(int(Controller.MouseX)) + AWinPos.X2 - AWinPos.X1, float(int(Controller.MouseY)) + AWinPos.Y2 - AWinPos.Y1);
            decoToolTips.bNeedUpdate = true;
            decoToolTips.Render(C);
        }
    }
}

defaultproperties
{
    CanvasStyle=5
    FontSize[0]=10
    FontSize[1]=10
    FontSize[2]=10
    FontSize[3]=10
    FontSize[4]=10
    FontColor[0]=(R=229,G=229,B=229,A=255)
    FontColor[1]=(R=229,G=229,B=229,A=255)
    FontColor[2]=(R=229,G=229,B=229,A=255)
    FontColor[3]=(R=229,G=229,B=229,A=255)
    FontColor[4]=(R=229,G=229,B=229,A=255)
    FontShadowColor[0]=(R=0,G=0,B=0,A=100)
    FontShadowColor[1]=(R=0,G=0,B=0,A=100)
    FontShadowColor[2]=(R=0,G=0,B=0,A=100)
    FontShadowColor[3]=(R=0,G=0,B=0,A=100)
    FontShadowColor[4]=(R=0,G=0,B=0,A=100)
    CaptionDrawType=4
    bUseAWinPos=true
    RenderWeight=0.10
    bBoundToParent=true
    bScaleToParent=true
    bNeverFocus=true
    OnRendered=Internal_OnRendered
}