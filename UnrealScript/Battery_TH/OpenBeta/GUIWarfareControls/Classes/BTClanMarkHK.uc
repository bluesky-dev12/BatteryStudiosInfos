class BTClanMarkHK extends BTOwnerDrawImageHK
    editinlinenew
    instanced;

var BTROCreateClanMarkHK ro;

function InitComponent(GUIController MyController, GUIComponent myOwner)
{
    super(GUIComponent).InitComponent(MyController, myOwner);
    ro = new Class'GUIWarfareControls_Decompressed.BTROCreateClanMarkHK';
    //return;    
}

function bool Internal_OnDraw(Canvas C)
{
    // End:0x0D
    if(ro == none)
    {
        return false;
    }
    ro.AWinPos = self.RWinPos;
    ro.Render(C);
    return false;
    //return;    
}

defaultproperties
{
    OnDraw=BTClanMarkHK.Internal_OnDraw
}