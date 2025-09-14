class BTLabelClanMarkHK extends BTOwnerDrawImageHK
    editinlinenew
    instanced;

var BTROClanMarkHK Ro;

function InitComponent(GUIController MyController, GUIComponent myOwner)
{
    super(GUIComponent).InitComponent(MyController, myOwner);
    Ro = new Class'GUIWarfareControls_Decompressed.BTROClanMarkHK';
    Ro.Init();
    //return;    
}

function SetData(int ClanPattern, int ClanBG, int ClanBL, optional bool bSize128, optional int ClanLevel)
{
    Ro.SetData(Controller.ViewportOwner.Actor.Level.GameMgr, ClanPattern, ClanBG, ClanBL, bSize128, ClanLevel);
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
    OnRendered=BTLabelClanMarkHK.Internal_OnRendered
}