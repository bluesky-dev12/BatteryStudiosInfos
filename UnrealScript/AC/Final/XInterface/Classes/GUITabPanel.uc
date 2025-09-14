class GUITabPanel extends GUIPanel
    abstract
    native
    editinlinenew
    instanced;

var(Panel) localized string PanelCaption;
var(Panel) bool bFillHeight;
var(Panel) float FadeInTime;
var /*0x00000000-0x00000008*/ noexport editinline GUITabButton MyButton;
var float CursorUSize;
var float CursorVSize;

function Refresh()
{
    //return;    
}

function InitPanel()
{
    //return;    
}

function OnDestroyPanel(optional bool bCancelled)
{
    MyButton = none;
    //return;    
}

event free()
{
    OnDestroyPanel(true);
    super(GUIMultiComponent).free();
    //return;    
}

function ShowPanel(bool bShow)
{
    // End:0x59
    if((Controller != none) && Controller.bModAuthor)
    {
        Log((("# # # #" @ MyButton.Caption) @ "ShowPanel() ") @ string(bShow), 'ModAuthor');
    }
    SetVisibility(bShow);
    //return;    
}

function bool CanShowPanel()
{
    return true;
    //return;    
}

function FloatBox GetTooltipPos(int tooltipWidth, int tooltipHeight, optional int nOffsetX, optional int nOffsetY)
{
    local FloatBox TooltipPos;

    TooltipPos = GetTooltipPosFinal(tooltipWidth, tooltipHeight, CursorUSize, CursorVSize, nOffsetX, nOffsetY);
    return TooltipPos;
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

defaultproperties
{
    CursorUSize=12.0000000
    CursorVSize=19.0000000
}