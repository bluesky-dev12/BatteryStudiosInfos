class BTExpBarHK extends FloatingImage
    editinlinenew
    instanced;

var BTROExpBarHK ro;
var array<Text> taExpbar;

function InitComponent(GUIController MyController, GUIComponent myOwner)
{
    super(GUIComponent).InitComponent(MyController, myOwner);
    ro = new Class'GUIWarfareControls_Decompressed.BTROExpBarHK';
    ro.Init();
    ro.bRenderText = false;
    taExpbar[0] = Class'Engine.BTCustomDrawHK'.static.MakeText(10, 3, "");
    taExpbar[1] = Class'Engine.BTCustomDrawHK'.static.MakeText(8, 3, "");
    taExpbar[1].DrawColor = Class'Engine.Canvas'.static.MakeColor(byte(255), byte(255), 0, byte(255));
    //return;    
}

function SetData(int A, int B, string aText, string bText)
{
    taExpbar[0].Text = aText;
    taExpbar[1].Text = bText;
    ro.SetData(A, B);
    //return;    
}

function OnRendered(Canvas C)
{
    // End:0x0E
    if(bVisible == false)
    {
        return;
    }
    ro.AWinPos = RWinPos;
    ro.Render(C);
    Class'Engine.BTCustomDrawHK'.static.DrawTextArray(C, taExpbar, 4, 0, RWinPos.X1, RWinPos.Y1, RWinPos.X2, RWinPos.Y2);
    //return;    
}

defaultproperties
{
    bUseAWinPos=true
    RenderWeight=0.5000000
    bBoundToParent=false
    bScaleToParent=false
    OnRendered=BTExpBarHK.OnRendered
}