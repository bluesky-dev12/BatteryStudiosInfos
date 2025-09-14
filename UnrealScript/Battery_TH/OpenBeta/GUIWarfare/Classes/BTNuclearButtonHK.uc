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
//var delegate<OnCoreClick> __OnCoreClick__Delegate;

function InitComponent(GUIController MyController, GUIComponent myOwner)
{
    super.InitComponent(MyController, myOwner);
    NuclearButtonPhase = 0;
    MaxPhaseTransformTime = 1.0000000;
    Caption = strDonotPress;
    self.SetDefaultFontColor();
    self.SetDefaultBigButtonImage();
    //return;    
}

function OnRendered(Canvas C)
{
    local int SelectMenuState;
    local float W, H, chasew, chaseh;
    local FloatBox fb;

    // End:0x0E
    if(bVisible == false)
    {
        return;
    }
    C.Style = 2;
    Class'Engine.BTCustomDrawHK'.static.DrawImage(C, BackgroundImage, Bounds[0], Bounds[1], Bounds[2], Bounds[3]);
    SelectMenuState = int(self.MenuState);
    // End:0x90
    if((bActiveCursor == false) && int(MenuState) == int(2))
    {
        SelectMenuState = 0;        
    }
    else
    {
        // End:0xAB
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
        Class'Engine.BTCustomDrawHK'.static.DrawImage(C, buttonImage[SelectMenuState], Bounds[0] + (W / float(2)), Bounds[1], Bounds[2], Bounds[3]);
        Class'Engine.BTCustomDrawHK'.static.DrawImage(C, buttonImage[SelectMenuState], Bounds[0], Bounds[1], Bounds[2] - (W / float(2)), Bounds[3]);
        C.DrawColor = FontColor[SelectMenuState];
        Class'Engine.BTCustomDrawHK'.static.DrawStringPaddingOffset(C, Caption, CaptionDrawType, float(FontSize[SelectMenuState]), Bounds[0], Bounds[1], Bounds[2], Bounds[3], CaptionPadding[0], CaptionTopPadding[SelectMenuState] + CaptionPadding[1], CaptionPadding[2], CaptionPadding[3], FontShadowColor[SelectMenuState]);
    }
    // End:0x53F
    if(NuclearButtonPhase == 1)
    {
        PhaseTransformTime += Controller.RenderDelta;
        // End:0x256
        if(PhaseTransformTime > MaxPhaseTransformTime)
        {
            NuclearButtonPhase = 2;
            PhaseTransformTime = 0.0000000;            
        }
        else
        {
            W = Bounds[2] - Bounds[0];
            H = Bounds[3] - Bounds[1];
            CoreBox = Class'Engine.BTCustomDrawHK'.static.MakeFloatBox(Bounds[0] + (W * 0.0000000), Bounds[1] + (H * 0.0000000), Bounds[0] + (W * 1.0000000), Bounds[1] + (H * 1.0000000));
            CoreImg = buttonImage[SelectMenuState];
            CoreImg.DrawColor = Class'GUIWarfareControls.BTUIColorPoolHK'.static.LabelWarning();
            Class'Engine.BTCustomDrawHK'.static.DrawImage(C, CoreImg, CoreBox.X1, CoreBox.Y1, CoreBox.X2, CoreBox.Y2);
            Class'Engine.BTCustomDrawHK'.static.DrawImage(C, Class'GUIWarfareControls.BTUIResourcePoolHK'.default.img_cm_128_ds_sku_07, CoreBox.X1, CoreBox.Y1, CoreBox.X2, CoreBox.Y2);
            chasew = (W / float(2)) * (PhaseTransformTime / MaxPhaseTransformTime);
            chaseh = (H / float(2)) * (PhaseTransformTime / MaxPhaseTransformTime);
            Class'Engine.BTCustomDrawHK'.static.DrawImage(C, buttonImage[SelectMenuState], Bounds[0], (Bounds[1] + (H / float(2))) + chaseh, Bounds[2], Bounds[3]);
            Class'Engine.BTCustomDrawHK'.static.DrawImage(C, buttonImage[SelectMenuState], Bounds[0], Bounds[1], Bounds[2], (Bounds[3] - (H / float(2))) - chaseh);
            Class'Engine.BTCustomDrawHK'.static.DrawImage(C, buttonImage[SelectMenuState], (Bounds[0] + (W / float(2))) + chasew, Bounds[1], Bounds[2], Bounds[3]);
            Class'Engine.BTCustomDrawHK'.static.DrawImage(C, buttonImage[SelectMenuState], Bounds[0], Bounds[1], (Bounds[2] - (W / float(2))) - chasew, Bounds[3]);
            C.DrawColor = FontColor[SelectMenuState];
        }
    }
    // End:0x6B2
    if(NuclearButtonPhase == 2)
    {
        W = Bounds[2] - Bounds[0];
        H = Bounds[3] - Bounds[1];
        CoreBox = Class'Engine.BTCustomDrawHK'.static.MakeFloatBox(Bounds[0] + (W * 0.0000000), Bounds[1] + (H * 0.0000000), Bounds[0] + (W * 1.0000000), Bounds[1] + (H * 1.0000000));
        CoreImg = buttonImage[SelectMenuState];
        CoreImg.DrawColor = Class'GUIWarfareControls.BTUIColorPoolHK'.static.LabelWarning();
        Class'Engine.BTCustomDrawHK'.static.DrawImage(C, CoreImg, CoreBox.X1, CoreBox.Y1, CoreBox.X2, CoreBox.Y2);
        Class'Engine.BTCustomDrawHK'.static.DrawImage(C, Class'GUIWarfareControls.BTUIResourcePoolHK'.default.img_cm_128_ds_sku_07, CoreBox.X1, CoreBox.Y1, CoreBox.X2, CoreBox.Y2);
        C.DrawColor = FontColor[SelectMenuState];
    }
    //return;    
}

delegate bool OnCoreClick(GUIComponent Sender)
{
    //return;    
}

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
        PhaseTransformTime = 0.0000000;        
    }
    else
    {
        // End:0x148
        if(NuclearButtonPhase >= 2)
        {
            // End:0x148
            if((((Controller.MouseX > CoreBox.X1) && Controller.MouseX < CoreBox.X2) && Controller.MouseY > CoreBox.Y1) && Controller.MouseY < CoreBox.Y2)
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
    //return;    
}

defaultproperties
{
    strDonotPress="???????????"
    OnRendered=BTNuclearButtonHK.OnRendered
    OnClick=BTNuclearButtonHK.OnClick
}