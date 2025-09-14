class BTClanMarkHK extends BTOwnerDrawImageHK
    editinlinenew
    instanced;

var BTROCreateClanMarkHK Ro;

function InitComponent(GUIController MyController, GUIComponent myOwner)
{
    super(GUIComponent).InitComponent(MyController, myOwner);
    Ro = new Class'GUIWarfareControls_Decompressed.BTROCreateClanMarkHK';
    //return;    
}

function bool Internal_OnDraw(Canvas C)
{
    // End:0x0D
    if(Ro == none)
    {
        return false;
    }
    Ro.AWinPos = self.RWinPos;
    Ro.Render(C);
    return false;
    //return;    
}

defaultproperties
{
    OnDraw=BTClanMarkHK.Internal_OnDraw
}