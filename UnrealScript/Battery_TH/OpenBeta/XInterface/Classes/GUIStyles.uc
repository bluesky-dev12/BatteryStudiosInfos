class GUIStyles extends GUI
    abstract
    native
    noteditinlinenew
    instanced;

var(Style) const string KeyName;
var(Style) const string AlternateKeyName[2];
var(Style) noexport string FontNames[15];
var(Style) /*0x00000000-0x00000008*/ noexport editinline GUIFont Fonts[15];
var(Style) noexport int FontSizes[5];
var(Style) noexport Color FontColors[5];
var(Style) noexport Color FontBKColors[5];
var(Style) noexport Color FontShadowColor[5];
var(Style) noexport int FontShadowOffset[5];
var(Style) noexport Color ImgColors[5];
var(Style) noexport GUI.EMenuRenderStyle RStyles[5];
var(Style) noexport Material Images[5];
var(Style) noexport GUI.eImgStyle ImgStyle[5];
var(Style) noexport float ImgWidths[5];
var(Style) noexport float ImgHeights[5];
var(Style) noexport int BorderOffsets[4];
var(Style) noexport bool bTemporary;
//var delegate<OnDraw> __OnDraw__Delegate;
//var delegate<OnDrawText> __OnDrawText__Delegate;

delegate bool OnDraw(Canvas Canvas, GUI.eMenuState MenuState, float Left, float Top, float Width, float Height)
{
    //return;    
}

delegate bool OnDrawText(Canvas Canvas, GUI.eMenuState MenuState, float Left, float Top, float Width, float Height, GUI.eTextAlign Align, string Text, GUI.eFontScale FontScale)
{
    //return;    
}

// Export UGUIStyles::execDraw(FFrame&, void* const)
native static final function Draw(Canvas Canvas, GUI.eMenuState MenuState, float Left, float Top, float Width, float Height)
{
    //native.Canvas;
    //native.MenuState;
    //native.Left;
    //native.Top;
    //native.Width;
    //native.Height;        
}

// Export UGUIStyles::execDrawText(FFrame&, void* const)
native static final function DrawText(Canvas Canvas, GUI.eMenuState MenuState, float Left, float Top, float Width, float Height, GUI.eTextAlign Align, string Text, GUI.eFontScale FontScale)
{
    //native.Canvas;
    //native.MenuState;
    //native.Left;
    //native.Top;
    //native.Width;
    //native.Height;
    //native.Align;
    //native.Text;
    //native.FontScale;        
}

// Export UGUIStyles::execTextSize(FFrame&, void* const)
native static final function TextSize(Canvas Canvas, GUI.eMenuState MenuState, string Text, out float XL, out float YL, GUI.eFontScale FontScale)
{
    //native.Canvas;
    //native.MenuState;
    //native.Text;
    //native.XL;
    //native.YL;
    //native.FontScale;        
}

// Export UGUIStyles::execbtrTextSizeStyles(FFrame&, void* const)
native function btrTextSizeStyles(Canvas Canvas, GUI.eMenuState MenuState, string Text, out float XL, out float YL, GUI.eFontScale FontScale, int FontSize)
{
    //native.Canvas;
    //native.MenuState;
    //native.Text;
    //native.XL;
    //native.YL;
    //native.FontScale;
    //native.FontSize;        
}

// Export UGUIStyles::execbtrDrawTextStyles(FFrame&, void* const)
native function btrDrawTextStyles(Canvas Canvas, GUI.eMenuState MenuState, float Left, float Top, float Width, float Height, GUI.eTextAlign Align, string Text, GUI.eFontScale FontScale, int FontSize, float R, float G, float B, float A)
{
    //native.Canvas;
    //native.MenuState;
    //native.Left;
    //native.Top;
    //native.Width;
    //native.Height;
    //native.Align;
    //native.Text;
    //native.FontScale;
    //native.FontSize;
    //native.R;
    //native.G;
    //native.B;
    //native.A;        
}

event Initialize()
{
    local int i;

    i = 0;
    J0x07:

    // End:0x63 [Loop If]
    if((i < 15) && i < 15)
    {
        // End:0x59
        if(FontNames[i] != "")
        {
            Fonts[i] = Controller.GetMenuFont(FontNames[i]);
        }
        i++;
        // [Loop Continue]
        goto J0x07;
    }
    //return;    
}

defaultproperties
{
    FontNames[0]="UT2SmallFont"
    FontNames[1]="UT2SmallFont"
    FontNames[2]="UT2SmallFont"
    FontNames[3]="UT2SmallFont"
    FontNames[4]="UT2SmallFont"
    FontNames[5]="UT2MenuFont"
    FontNames[6]="UT2MenuFont"
    FontNames[7]="UT2MenuFont"
    FontNames[8]="UT2MenuFont"
    FontNames[9]="UT2MenuFont"
    FontNames[10]="UT2LargeFont"
    FontNames[11]="UT2LargeFont"
    FontNames[12]="UT2LargeFont"
    FontNames[13]="UT2LargeFont"
    FontNames[14]="UT2LargeFont"
    FontSizes[0]=10
    FontSizes[1]=10
    FontSizes[2]=10
    FontSizes[3]=10
    FontSizes[4]=10
    FontColors[0]=(R=0,G=0,B=64,A=255)
    FontColors[1]=(R=0,G=0,B=64,A=255)
    FontColors[2]=(R=32,G=32,B=80,A=255)
    FontColors[3]=(R=32,G=32,B=80,A=255)
    FontColors[4]=(R=0,G=0,B=128,A=255)
    FontBKColors[0]=(R=0,G=0,B=0,A=255)
    FontBKColors[1]=(R=0,G=0,B=0,A=255)
    FontBKColors[2]=(R=0,G=0,B=0,A=255)
    FontBKColors[3]=(R=0,G=0,B=0,A=255)
    FontBKColors[4]=(R=0,G=0,B=0,A=255)
    FontShadowColor[0]=(R=0,G=0,B=0,A=255)
    FontShadowColor[1]=(R=0,G=0,B=0,A=255)
    FontShadowColor[2]=(R=0,G=0,B=0,A=255)
    FontShadowColor[3]=(R=0,G=0,B=0,A=255)
    FontShadowColor[4]=(R=0,G=0,B=0,A=255)
    ImgColors[0]=(R=255,G=255,B=255,A=255)
    ImgColors[1]=(R=255,G=255,B=255,A=255)
    ImgColors[2]=(R=255,G=255,B=255,A=255)
    ImgColors[3]=(R=255,G=255,B=255,A=255)
    ImgColors[4]=(R=128,G=128,B=128,A=255)
    RStyles[0]=1
    RStyles[1]=1
    RStyles[2]=1
    RStyles[3]=1
    RStyles[4]=1
    ImgStyle[0]=1
    ImgStyle[1]=1
    ImgStyle[2]=1
    ImgStyle[3]=1
    ImgStyle[4]=1
    ImgWidths[0]=-1.0000000
    ImgWidths[1]=-1.0000000
    ImgWidths[2]=-1.0000000
    ImgWidths[3]=-1.0000000
    ImgWidths[4]=-1.0000000
    ImgHeights[0]=-1.0000000
    ImgHeights[1]=-1.0000000
    ImgHeights[2]=-1.0000000
    ImgHeights[3]=-1.0000000
    ImgHeights[4]=-1.0000000
    BorderOffsets[0]=10
    BorderOffsets[1]=10
    BorderOffsets[2]=10
    BorderOffsets[3]=10
}