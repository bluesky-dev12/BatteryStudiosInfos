/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path GUIWarfareControls\Classes\BTClanMarkHK.uc
 * Package Imports:
 *	GUIWarfareControls
 *	XInterface
 *	Core
 *
 * Stats:
 *	Properties:1
 *	Functions:2
 *
 *******************************************************************************/
class BTClanMarkHK extends BTOwnerDrawImageHK
    editinlinenew
    instanced;

var BTROCreateClanMarkHK ro;

function InitComponent(GUIController MyController, GUIComponent myOwner)
{
    super(GUIComponent).InitComponent(MyController, myOwner);
    ro = new class'BTROCreateClanMarkHK';
}

function bool Internal_OnDraw(Canvas C)
{
    // End:0x0d
    if(ro == none)
    {
        return false;
    }
    ro.AWinPos = self.RWinPos;
    ro.Render(C);
    return false;
}

defaultproperties
{
    OnDraw=Internal_OnDraw
}