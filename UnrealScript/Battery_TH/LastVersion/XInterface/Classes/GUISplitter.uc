class GUISplitter extends GUIPanel
    native
    editinlinenew
    instanced;

enum EGUISplitterType
{
    SPLIT_Vertical,                 // 0
    SPLIT_Horizontal                // 1
};

var() GUISplitter.EGUISplitterType SplitOrientation;
var() float SplitPosition;
var() bool bFixedSplitter;
var() bool bDrawSplitter;
var() float SplitAreaSize;
var() string DefaultPanels[2];
var() export editinline GUIComponent Panels[2];
var() float MaxPercentage;
//var delegate<OnReleaseSplitter> __OnReleaseSplitter__Delegate;

delegate OnReleaseSplitter(GUIComponent Sender, float NewPosition)
{
    //return;    
}

function InitComponent(GUIController MyController, GUIComponent myOwner)
{
    super.InitComponent(MyController, myOwner);
    // End:0x61
    if(DefaultPanels[0] != "")
    {
        Panels[0] = AddComponent(DefaultPanels[0], DefaultPanels[1] != "");
        // End:0x61
        if(DefaultPanels[1] != "")
        {
            Panels[1] = AddComponent(DefaultPanels[1]);
        }
    }
    //return;    
}

event GUIComponent AppendComponent(GUIComponent NewComp, optional bool SkipRemap)
{
    OnCreateComponent(NewComp, self);
    Controls[Controls.Length] = NewComp;
    NewComp.InitComponent(Controller, self);
    NewComp.bBoundToParent = true;
    NewComp.bScaleToParent = true;
    // End:0x6A
    if(!SkipRemap)
    {
        RemapComponents();
    }
    return NewComp;
    //return;    
}

// Export UGUISplitter::execSplitterUpdatePositions(FFrame&, void* const)
native function SplitterUpdatePositions();

defaultproperties
{
    SplitPosition=0.5000000
    bDrawSplitter=true
    SplitAreaSize=8.0000000
    StyleName="SquareButton"
    bAcceptsInput=true
    bNeverFocus=true
    bRequiresStyle=true
}