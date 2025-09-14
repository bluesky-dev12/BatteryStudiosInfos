/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path XInterface\Classes\GUITabPanel.uc
 * Package Imports:
 *	XInterface
 *	Core
 *
 * Stats:
 *	Properties:6
 *	Functions:7
 *
 *******************************************************************************/
class GUITabPanel extends GUIPanel
    native
    editinlinenew
    abstract
    instanced;

var(Panel) localized string PanelCaption;
var(Panel) bool bFillHeight;
var(Panel) float FadeInTime;
var noexport editinline GUITabButton MyButton;
var float CursorUSize;
var float CursorVSize;

function Refresh();
function InitPanel();
function OnDestroyPanel(optional bool bCancelled)
{
    MyButton = none;
}

event free()
{
    OnDestroyPanel(true);
    super(GUIMultiComponent).free();
}

function ShowPanel(bool bShow)
{
    // End:0x59
    if(Controller != none && Controller.bModAuthor)
    {
        Log("# # # #" @ MyButton.Caption @ "ShowPanel() " @ string(bShow), 'ModAuthor');
    }
    SetVisibility(bShow);
}

function bool CanShowPanel()
{
    return true;
}

function FloatBox GetTooltipPos(int tooltipWidth, int tooltipHeight, optional int nOffsetX, optional int nOffsetY)
{
    local FloatBox TooltipPos;

    TooltipPos.X1 = Controller.MouseX + CursorUSize + float(nOffsetX);
    TooltipPos.Y1 = Controller.MouseY + CursorVSize + float(nOffsetY);
    TooltipPos.X2 = TooltipPos.X1 + float(tooltipWidth);
    TooltipPos.Y2 = TooltipPos.Y1 + float(tooltipHeight);
    return TooltipPos;
}

defaultproperties
{
    CursorUSize=12.0
    CursorVSize=19.0
}