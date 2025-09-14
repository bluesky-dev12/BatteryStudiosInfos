class BTLabelLevelHK extends BTOwnerDrawImageHK
    editinlinenew
    instanced;

var BTROLevelHK Ro;

function InitComponent(GUIController MyController, GUIComponent myOwner)
{
    super(GUIComponent).InitComponent(MyController, myOwner);
    Ro = new Class'GUIWarfareControls_Decompressed.BTROLevelHK';
    Ro.Init();
    //return;    
}

function SetData(int Level, int LevelMarkID)
{
    Ro.SetData(Controller.ViewportOwner.Actor.Level.GameMgr, Level, LevelMarkID);
    //return;    
}

function Internal_OnRendered(Canvas C)
{
    // End:0x0E
    if(bVisible == false)
    {
        return;
    }
    C.Style = byte(CanvasStyle);
    Ro.AWinPos = RWinPos;
    Ro.Render(C);
    //return;    
}

defaultproperties
{
    OnRendered=BTLabelLevelHK.Internal_OnRendered
}