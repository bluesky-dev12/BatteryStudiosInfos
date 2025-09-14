/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path GUIWarfareControls\Classes\BTExpBarHK.uc
 * Package Imports:
 *	GUIWarfareControls
 *	XInterface
 *	Core
 *
 * Stats:
 *	Properties:2
 *	Functions:3
 *
 *******************************************************************************/
class BTExpBarHK extends FloatingImage
    editinlinenew
    instanced;

var BTROExpBarHK ro;
var array<Text> taExpbar;

function InitComponent(GUIController MyController, GUIComponent myOwner)
{
    super(GUIComponent).InitComponent(MyController, myOwner);
    ro = new class'BTROExpBarHK';
    ro.Init();
    ro.bRenderText = false;
    taExpbar[0] = class'BTCustomDrawHK'.static.MakeText(10, 3, "");
    taExpbar[1] = class'BTCustomDrawHK'.static.MakeText(8, 3, "");
    taExpbar[1].DrawColor = class'Canvas'.static.MakeColor(byte(255), byte(255), 0, byte(255));
}

function SetData(int A, int B, string aText, string bText)
{
    taExpbar[0].Text = aText;
    taExpbar[1].Text = bText;
    ro.SetData(A, B);
}

function OnRendered(Canvas C)
{
    // End:0x0e
    if(bVisible == false)
    {
        return;
    }
    ro.AWinPos = RWinPos;
    ro.Render(C);
    class'BTCustomDrawHK'.static.DrawTextArray(C, taExpbar, 4, 0, RWinPos.X1, RWinPos.Y1, RWinPos.X2, RWinPos.Y2);
}

defaultproperties
{
    bUseAWinPos=true
    RenderWeight=0.50
    bBoundToParent=true
    bScaleToParent=true
    OnRendered=OnRendered
}