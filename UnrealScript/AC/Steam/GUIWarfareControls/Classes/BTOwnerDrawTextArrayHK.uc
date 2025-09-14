/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path GUIWarfareControls\Classes\BTOwnerDrawTextArrayHK.uc
 * Package Imports:
 *	GUIWarfareControls
 *	XInterface
 *	Core
 *
 * Stats:
 *	Properties:4
 *	Functions:4
 *
 *******************************************************************************/
class BTOwnerDrawTextArrayHK extends BTOwnerDrawImageHK
    editinlinenew
    instanced;

var localized string strUpArrow;
var localized string strDownArrow;
var array<Text> tarray;
var Engine.BTCustomDrawHK.TextArrayDrawType tArrayDrawType;

function InitComponent(GUIController MyController, GUIComponent myOwner)
{
    super(GUIComponent).InitComponent(MyController, myOwner);
    BackgroundImage = class'BTUIResourcePoolHK'.default.panel_5;
    CaptionDrawType = 3;
    tArrayDrawType = 2;
    tarray.Length = 2;
    tarray[0] = class'BTCustomDrawHK'.static.MakeText(10, 3, "");
    tarray[1] = class'BTCustomDrawHK'.static.MakeText(9, 3, "");
    tarray[1].DrawColor = class'BTUIColorPoolHK'.static.LabelWarning();
    CaptionPadding[0] = 5;
}

function SetData(string t0, optional string t1)
{
    tarray[0].Text = t0;
    tarray[1].Text = t1;
}

function SetRankData(string t0, int t1)
{
    tarray[0].Text = t0;
    // End:0x63
    if(t1 > 0)
    {
        tarray[1].Text = "  (" $ strDownArrow $ string(t1) $ ")";
        tarray[1].DrawColor = class'BTUIColorPoolHK'.static.InverseLabelWarning();
    }
    // End:0xe6
    else
    {
        // End:0xb6
        if(t1 < 0)
        {
            tarray[1].Text = "  (" $ strUpArrow $ string(-t1) $ ")";
            tarray[1].DrawColor = class'BTUIColorPoolHK'.static.LabelWarning();
        }
        // End:0xe6
        else
        {
            tarray[1].Text = "  (-)";
            tarray[1].DrawColor = class'BTUIColorPoolHK'.static.ChatSelf();
        }
    }
}

function Internal_OnRendered(Canvas C)
{
    // End:0x0e
    if(bVisible == false)
    {
        return;
    }
    C.Style = 5;
    // End:0x66
    if(BackgroundImage.Image != none)
    {
        class'BTCustomDrawHK'.static.DrawImage(C, BackgroundImage, Bounds[0], Bounds[1], Bounds[2], Bounds[3]);
    }
    // End:0x113
    if(Caption != "")
    {
        C.DrawColor = FontColor[self.MenuState];
        class'BTCustomDrawHK'.static.DrawStringPaddingOffset(C, Caption, CaptionDrawType, float(FontSize[self.MenuState]), Bounds[0], Bounds[1], Bounds[2], Bounds[3], CaptionPadding[0], CaptionPadding[1], CaptionPadding[2], CaptionPadding[3], FontShadowColor[self.MenuState]);
    }
    // End:0x18e
    if(tarray.Length > 0)
    {
        class'BTCustomDrawHK'.static.DrawTextArray(C, tarray, CaptionDrawType, tArrayDrawType, Bounds[0] + float(CaptionPadding[0]), Bounds[1] + float(CaptionPadding[1]), Bounds[2] - float(CaptionPadding[2]), Bounds[3] - float(CaptionPadding[3]));
    }
}

defaultproperties
{
    strUpArrow="?"
    strDownArrow="?"
    OnRendered=Internal_OnRendered
}