/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path GUI2K4\Classes\ComponentGroup.uc
 * Package Imports:
 *	GUI2K4
 *	XInterface
 *	Core
 *
 * Stats:
 *	Properties:2
 *	Functions:6
 *
 *******************************************************************************/
class ComponentGroup extends GUIMultiComponent
    editinlinenew
    instanced;

var() /*0x00000000-0x80000000*/ databinding export editinlinenotify GUISectionBackground i_Background;
var localized string Caption;

function InitComponent(GUIController InController, GUIComponent inOwner)
{
    super.InitComponent(InController, inOwner);
    SetCaption(Caption);
}

function GUIComponent ManageComponent(GUIComponent C)
{
    // End:0x1f
    if(C != none)
    {
        i_Background.ManageComponent(C);
    }
    return C;
}

function GUIComponent AppendComponent(GUIComponent NewComp, optional bool bSkipRemap)
{
    return ManageComponent(super.AppendComponent(NewComp, bSkipRemap));
}

function GUIComponent InsertComponent(GUIComponent NewComp, int Index, optional bool bSkipRemap)
{
    return ManageComponent(super.InsertComponent(NewComp, Index, bSkipRemap));
}

function bool RemoveComponent(GUIComponent Comp, optional bool bSkipRemap)
{
    i_Background.UnmanageComponent(Comp);
    return super.RemoveComponent(Comp, bSkipRemap);
}

function SetCaption(string NewCaption)
{
    Caption = NewCaption;
    i_Background.Caption = Caption;
}

defaultproperties
{
    begin object name=CGBackground class=GUISectionBackground
        bBoundToParent=true
        bScaleToParent=true
        OnPreDraw=InternalPreDraw
    object end
    // Reference: GUISectionBackground'ComponentGroup.CGBackground'
    i_Background=CGBackground
}