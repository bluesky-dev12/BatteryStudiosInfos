class BTOwnerDrawTextArrayHK extends BTOwnerDrawImageHK
    editinlinenew
    instanced;

var localized string strUpArrow;
var localized string strDownArrow;
var array<Text> tarray;
var BTCustomDrawHK.TextArrayDrawType tArrayDrawType;

function InitComponent(GUIController MyController, GUIComponent myOwner)
{
    super(GUIComponent).InitComponent(MyController, myOwner);
    BackgroundImage = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.panel_5;
    CaptionDrawType = 3;
    tArrayDrawType = 2;
    tarray.Length = 2;
    tarray[0] = Class'Engine.BTCustomDrawHK'.static.MakeText(10, 3, "");
    tarray[1] = Class'Engine.BTCustomDrawHK'.static.MakeText(9, 3, "");
    tarray[1].DrawColor = Class'GUIWarfareControls_Decompressed.BTUIColorPoolHK'.static.LabelWarning();
    CaptionPadding[0] = 5;
    //return;    
}

function SetData(string t0, optional string t1)
{
    tarray[0].Text = t0;
    tarray[1].Text = t1;
    //return;    
}

function SetRankData(string t0, int t1)
{
    tarray[0].Text = t0;
    // End:0x63
    if(t1 > 0)
    {
        tarray[1].Text = (("  (" $ strDownArrow) $ string(t1)) $ ")";
        tarray[1].DrawColor = Class'GUIWarfareControls_Decompressed.BTUIColorPoolHK'.static.InverseLabelWarning();        
    }
    else
    {
        // End:0xB6
        if(t1 < 0)
        {
            tarray[1].Text = (("  (" $ strUpArrow) $ string(-t1)) $ ")";
            tarray[1].DrawColor = Class'GUIWarfareControls_Decompressed.BTUIColorPoolHK'.static.LabelWarning();            
        }
        else
        {
            tarray[1].Text = "  (-)";
            tarray[1].DrawColor = Class'GUIWarfareControls_Decompressed.BTUIColorPoolHK'.static.ChatSelf();
        }
    }
    //return;    
}

function Internal_OnRendered(Canvas C)
{
    // End:0x0E
    if(bVisible == false)
    {
        return;
    }
    C.Style = 5;
    // End:0x66
    if(BackgroundImage.Image != none)
    {
        Class'Engine.BTCustomDrawHK'.static.DrawImage(C, BackgroundImage, Bounds[0], Bounds[1], Bounds[2], Bounds[3]);
    }
    // End:0x113
    if(Caption != "")
    {
        C.DrawColor = FontColor[int(self.MenuState)];
        Class'Engine.BTCustomDrawHK'.static.DrawStringPaddingOffset(C, Caption, CaptionDrawType, float(FontSize[int(self.MenuState)]), Bounds[0], Bounds[1], Bounds[2], Bounds[3], CaptionPadding[0], CaptionPadding[1], CaptionPadding[2], CaptionPadding[3], FontShadowColor[int(self.MenuState)]);
    }
    // End:0x18E
    if(tarray.Length > 0)
    {
        Class'Engine.BTCustomDrawHK'.static.DrawTextArray(C, tarray, CaptionDrawType, tArrayDrawType, Bounds[0] + float(CaptionPadding[0]), Bounds[1] + float(CaptionPadding[1]), Bounds[2] - float(CaptionPadding[2]), Bounds[3] - float(CaptionPadding[3]));
    }
    //return;    
}

defaultproperties
{
    strUpArrow="+"
    strDownArrow="-"
    OnRendered=BTOwnerDrawTextArrayHK.Internal_OnRendered
}