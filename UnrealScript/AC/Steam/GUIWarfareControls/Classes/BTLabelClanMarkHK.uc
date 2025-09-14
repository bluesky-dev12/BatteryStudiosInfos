/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path GUIWarfareControls\Classes\BTLabelClanMarkHK.uc
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
class BTLabelClanMarkHK extends BTOwnerDrawImageHK
    editinlinenew
    instanced;

var BTROClanMarkHK ro;

function InitComponent(GUIController MyController, GUIComponent myOwner)
{
    super(GUIComponent).InitComponent(MyController, myOwner);
    ro = new class'BTROClanMarkHK';
    ro.Init();
}

function SetData(int ClanPattern, int ClanBG, int ClanBL, optional bool bSize128, optional int ClanLevel)
{
    ro.SetData(Controller.ViewportOwner.Actor.Level.GameMgr, ClanPattern, ClanBG, ClanBL, bSize128, ClanLevel);
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