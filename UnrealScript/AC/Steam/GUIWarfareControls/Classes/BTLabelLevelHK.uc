/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path GUIWarfareControls\Classes\BTLabelLevelHK.uc
 * Package Imports:
 *	GUIWarfareControls
 *	XInterface
 *	Core
 *
 * Stats:
 *	Properties:1
 *	Functions:3
 *
 *******************************************************************************/
class BTLabelLevelHK extends BTOwnerDrawImageHK
    editinlinenew
    instanced;

var BTROLevelHK ro;

function InitComponent(GUIController MyController, GUIComponent myOwner)
{
    super(GUIComponent).InitComponent(MyController, myOwner);
    ro = new class'BTROLevelHK';
    ro.Init();
}

function SetData(int Level, int LevelMarkID)
{
    ro.SetData(Controller.ViewportOwner.Actor.Level.GameMgr, Level, LevelMarkID);
}

function Internal_OnRendered(Canvas C)
{
    // End:0x0e
    if(bVisible == false)
    {
        return;
    }
    C.Style = byte(CanvasStyle);
    ro.AWinPos = RWinPos;
    ro.Render(C);
}

defaultproperties
{
    OnRendered=Internal_OnRendered
}