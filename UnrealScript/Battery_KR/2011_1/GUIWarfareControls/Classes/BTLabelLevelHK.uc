class BTLabelLevelHK extends BTOwnerDrawImageHK
    editinlinenew
    instanced;

var BTROLevelHK ro;

function InitComponent(GUIController MyController, GUIComponent myOwner)
{
    super(GUIComponent).InitComponent(MyController, myOwner);
    ro = new Class'GUIWarfareControls_Decompressed.BTROLevelHK';
    ro.Init();
    //return;    
}

function SetData(int Level, int LevelMarkID)
{
    ro.SetData(Controller.ViewportOwner.Actor.Level.GameMgr, Level, LevelMarkID);
    //return;    
}

function Internal_OnRendered(Canvas C)
{
    local float OldValueX, OldValueY;

    // End:0x0E
    if(bVisible == false)
    {
        return;
    }
    C.Style = byte(CanvasStyle);
    ro.AWinPos = RWinPos;
    ro.Render(C);
    //return;    
}

defaultproperties
{
    OnRendered=BTLabelLevelHK.Internal_OnRendered
}