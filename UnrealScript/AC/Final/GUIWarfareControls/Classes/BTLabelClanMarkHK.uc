class BTLabelClanMarkHK extends BTOwnerDrawImageHK
    editinlinenew
    instanced;

var BTROClanMarkHK ro;

function InitComponent(GUIController MyController, GUIComponent myOwner)
{
    super(GUIComponent).InitComponent(MyController, myOwner);
    ro = new Class'GUIWarfareControls_Decompressed.BTROClanMarkHK';
    ro.Init();
    //return;    
}

function SetData(int ClanPattern, int ClanBG, int ClanBL, optional bool bSize128, optional int ClanLevel)
{
    ro.SetData(Controller.ViewportOwner.Actor.Level.GameMgr, ClanPattern, ClanBG, ClanBL, bSize128, ClanLevel);
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
    ro.AWinPos = RWinPos;
    ro.Render(C);
    //return;    
}

defaultproperties
{
    OnRendered=BTLabelClanMarkHK.Internal_OnRendered
}