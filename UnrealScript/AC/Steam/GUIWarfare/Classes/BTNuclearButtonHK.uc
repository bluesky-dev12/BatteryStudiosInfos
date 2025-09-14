/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path GUIWarfare\Classes\BTNuclearButtonHK.uc
 * Package Imports:
 *	GUIWarfare
 *	GUIWarfareControls
 *	XInterface
 *	Core
 *
 * Stats:
 *	Properties:8
 *	Functions:4
 *
 *******************************************************************************/
class BTNuclearButtonHK extends BTOwnerDrawCaptionButtonHK
    editinlinenew
    instanced;

var localized string strDonotPress;
var bool bNuclearActive;
var FloatBox CoreBox;
var Image CoreImg;
var float MaxPhaseTransformTime;
var float PhaseTransformTime;
var int NuclearButtonPhase;
var delegate<OnCoreClick> __OnCoreClick__Delegate;

function InitComponent(GUIController MyController, GUIComponent myOwner)
{
    super.InitComponent(MyController, myOwner);
    NuclearButtonPhase = 0;
    MaxPhaseTransformTime = 1.0;
    Caption = strDonotPress;
    self.SetDefaultFontColor();
    self.SetDefaultBigButtonImage();
}

function OnRendered(Canvas C)
{
    local int SelectMenuState;
    local float W, H, chasew, chaseh;

    // End:0x0e
    if(bVisible == false)
    {
        return;
    }
    C.Style = 2;
    class'BTCustomDrawHK'.static.DrawImage(C, BackgroundImage, Bounds[0], Bounds[1], Bounds[2], Bounds[3]);
    SelectMenuState = self.MenuState;
    // End:0x90
    if(bActiveCursor == false && MenuState == 2)
    {
        SelectMenuState = 0;
    }
    // End:0xab
    else
    {
        // End:0xab
        if(bSelectHighlight && bSelect)
        {
            SelectMenuState = 1;
        }
    }
    // End:0x211
    if(NuclearButtonPhase == 0)
    {
        H = Bounds[3] - Bounds[1];
        W = Bounds[2] - Bounds[0];
        class'BTCustomDrawHK'.static.DrawImage(C, buttonImage[SelectMenuState], Bounds[0] + W / float(2), Bounds[1], Bounds[2], Bounds[3]);
        class'BTCustomDrawHK'.static.DrawImage(C, buttonImage[SelectMenuState], Bounds[0], Bounds[1], Bounds[2] - W / float(2), Bounds[3]);
        C.DrawColor = FontColor[SelectMenuState];
        class'BTCustomDrawHK'.static.DrawStringPaddingOffset(C, Caption, CaptionDrawType, float(FontSize[SelectMenuState]), Bounds[0], Bounds[1], Bounds[2], Bounds[3], CaptionPadding[0], CaptionTopPadding[SelectMenuState] + CaptionPadding[1], CaptionPadding[2], CaptionPadding[3], FontShadowColor[SelectMenuState]);
    }
    // End:0x53f
    if(NuclearButtonPhase == 1)
    {
        PhaseTransformTime += Controller.RenderDelta;
        // End:0x256
        if(PhaseTransformTime > MaxPhaseTransformTime)
        {
            NuclearButtonPhase = 2;
            PhaseTransformTime = 0.0;
        }
        // End:0x53f
        else
        {
            W = Bounds[2] - Bounds[0];
            H = Bounds[3] - Bounds[1];
            CoreBox = class'BTCustomDrawHK'.static.MakeFloatBox(Bounds[0] + W * 0.0, Bounds[1] + H * 0.0, Bounds[0] + W * 1.0, Bounds[1] + H * 1.0);
            CoreImg = buttonImage[SelectMenuState];
            CoreImg.DrawColor = class'BTUIColorPoolHK'.static.LabelWarning();
            class'BTCustomDrawHK'.static.DrawImage(C, CoreImg, CoreBox.X1, CoreBox.Y1, CoreBox.X2, CoreBox.Y2);
            class'BTCustomDrawHK'.static.DrawImage(C, class'BTUIResourcePoolHK'.default.img_cm_128_ds_sku_07, CoreBox.X1, CoreBox.Y1, CoreBox.X2, CoreBox.Y2);
            chasew = W / float(2) * PhaseTransformTime / MaxPhaseTransformTime;
            chaseh = H / float(2) * PhaseTransformTime / MaxPhaseTransformTime;
            class'BTCustomDrawHK'.static.DrawImage(C, buttonImage[SelectMenuState], Bounds[0], Bounds[1] + H / float(2) + chaseh, Bounds[2], Bounds[3]);
            class'BTCustomDrawHK'.static.DrawImage(C, buttonImage[SelectMenuState], Bounds[0], Bounds[1], Bounds[2], Bounds[3] - H / float(2) - chaseh);
            class'BTCustomDrawHK'.static.DrawImage(C, buttonImage[SelectMenuState], Bounds[0] + W / float(2) + chasew, Bounds[1], Bounds[2], Bounds[3]);
            class'BTCustomDrawHK'.static.DrawImage(C, buttonImage[SelectMenuState], Bounds[0], Bounds[1], Bounds[2] - W / float(2) - chasew, Bounds[3]);
            C.DrawColor = FontColor[SelectMenuState];
        }
    }
    // End:0x6b2
    if(NuclearButtonPhase == 2)
    {
        W = Bounds[2] - Bounds[0];
        H = Bounds[3] - Bounds[1];
        CoreBox = class'BTCustomDrawHK'.static.MakeFloatBox(Bounds[0] + W * 0.0, Bounds[1] + H * 0.0, Bounds[0] + W * 1.0, Bounds[1] + H * 1.0);
        CoreImg = buttonImage[SelectMenuState];
        CoreImg.DrawColor = class'BTUIColorPoolHK'.static.LabelWarning();
        class'BTCustomDrawHK'.static.DrawImage(C, CoreImg, CoreBox.X1, CoreBox.Y1, CoreBox.X2, CoreBox.Y2);
        class'BTCustomDrawHK'.static.DrawImage(C, class'BTUIResourcePoolHK'.default.img_cm_128_ds_sku_07, CoreBox.X1, CoreBox.Y1, CoreBox.X2, CoreBox.Y2);
        C.DrawColor = FontColor[SelectMenuState];
    }
}

delegate bool OnCoreClick(GUIComponent Sender);
function bool OnClick(GUIComponent Sender)
{
    local export editinline BTNetGUIPageHK page_curr;
    local array<string> rarray;
    local wMatchMaker MM;

    MM = Controller.ViewportOwner.Actor.Level.GetMatchMaker();
    // End:0x50
    if(NuclearButtonPhase == 0)
    {
        NuclearButtonPhase = 1;
        PhaseTransformTime = 0.0;
    }
    // End:0x148
    else
    {
        // End:0x148
        if(NuclearButtonPhase >= 2)
        {
            // End:0x148
            if(Controller.MouseX > CoreBox.X1 && Controller.MouseX < CoreBox.X2 && Controller.MouseY > CoreBox.Y1 && Controller.MouseY < CoreBox.Y2)
            {
                rarray.Length = 1;
                rarray[0] = "Test1";
                page_curr = BTNetGUIPageHK(PageOwner);
                page_curr.TcpChannel.sfReqSendMemo(rarray, "NB : " $ MM.kUserName, 0);
                NuclearButtonPhase = 0;
                OnCoreClick(Sender);
            }
        }
    }
    return true;
}

defaultproperties
{
    strDonotPress="Do not press!"
    OnRendered=OnRendered
    OnClick=OnClick
}