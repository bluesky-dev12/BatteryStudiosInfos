class BTTabPanelHK extends GUITabPanel
    editinlinenew
    instanced;

var int TabID;
var bool bSelect;
var wGameManager GameMgr;
var wMatchMaker MM;

function InitComponent(GUIController MyController, GUIComponent myOwner)
{
    super(GUIPanel).InitComponent(MyController, myOwner);
    GameMgr = Controller.ViewportOwner.Actor.Level.GameMgr;
    MM = Controller.ViewportOwner.Actor.Level.GetMatchMaker();
    //return;    
}

function TabGroups_OnSelect()
{
    //return;    
}

function BTOwnerDrawImageHK NewLabelComponent(FloatBox fbNewCompo, Image bgImg, optional float RenderWeight)
{
    local export editinline BTOwnerDrawImageHK Label;

    Label = BTOwnerDrawImageHK(NewComponent(new Class'GUIWarfareControls_Decompressed.BTOwnerDrawImageHK', fbNewCompo, RenderWeight));
    Label.BackgroundImage = bgImg;
    return Label;
    //return;    
}

function BTOwnerDrawCaptionButtonHK NewButtonComponent(FloatBox fbNewCompo, optional float RenderWeight)
{
    local export editinline BTOwnerDrawCaptionButtonHK btn;

    btn = BTOwnerDrawCaptionButtonHK(NewComponent(new Class'GUIWarfareControls_Decompressed.BTOwnerDrawCaptionButtonHK', fbNewCompo, RenderWeight));
    return btn;
    //return;    
}

function BTOwnerDrawImageScroll NewScrollLabelComponent(FloatBox fbNewCompo, Image bgImg, optional float RenderWeight)
{
    local export editinline BTOwnerDrawImageScroll Label;

    Label = BTOwnerDrawImageScroll(NewComponent(new Class'GUIWarfareControls_Decompressed.BTOwnerDrawImageScroll', fbNewCompo, RenderWeight));
    Label.BackgroundImage = bgImg;
    return Label;
    //return;    
}

function bool CheckIn(FloatBox fb, int X, int Y)
{
    // End:0x60
    if(((fb.X1 < float(X)) && fb.X2 > float(X)) && (fb.Y1 < float(Y)) && fb.Y2 > float(Y))
    {
        return true;
    }
    return false;
    //return;    
}
