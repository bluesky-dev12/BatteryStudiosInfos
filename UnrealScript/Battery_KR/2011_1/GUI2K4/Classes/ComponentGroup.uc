class ComponentGroup extends GUIMultiComponent
    editinlinenew
    instanced;

var() automated GUISectionBackground i_Background;
var localized string Caption;

function InitComponent(GUIController InController, GUIComponent inOwner)
{
    super.InitComponent(InController, inOwner);
    SetCaption(Caption);
    //return;    
}

function GUIComponent ManageComponent(GUIComponent C)
{
    // End:0x1F
    if(C != none)
    {
        i_Background.ManageComponent(C);
    }
    return C;
    //return;    
}

function GUIComponent AppendComponent(GUIComponent NewComp, optional bool bSkipRemap)
{
    return ManageComponent(super.AppendComponent(NewComp, bSkipRemap));
    //return;    
}

function GUIComponent InsertComponent(GUIComponent NewComp, int Index, optional bool bSkipRemap)
{
    return ManageComponent(super.InsertComponent(NewComp, Index, bSkipRemap));
    //return;    
}

function bool RemoveComponent(GUIComponent Comp, optional bool bSkipRemap)
{
    i_Background.UnmanageComponent(Comp);
    return super.RemoveComponent(Comp, bSkipRemap);
    //return;    
}

function SetCaption(string NewCaption)
{
    Caption = NewCaption;
    i_Background.Caption = Caption;
    //return;    
}

defaultproperties
{
    // Reference: GUISectionBackground'GUI2K4_Decompressed.ComponentGroup.CGBackground'
    begin object name="CGBackground" class=XInterface.GUISectionBackground
        bBoundToParent=true
        bScaleToParent=true
        OnPreDraw=CGBackground.InternalPreDraw
    end object
    i_Background=CGBackground
}