class BTPageOption_Base extends GUITabPanel
    editinlinenew
    instanced;

function InitComponent(GUIController MyController, GUIComponent myOwner)
{
    super(GUIPanel).InitComponent(MyController, myOwner);
    //return;    
}

function string GetNativeClassName(string VarName)
{
    local int i;
    local string str;

    str = PlayerOwner().ConsoleCommand(("get ini:" $ VarName) @ "Class");
    i = InStr(str, "'");
    // End:0x7D
    if(i != -1)
    {
        str = Mid(str, InStr(str, "'") + 1);
        str = Left(str, Len(str) - 1);
    }
    return str;
    //return;    
}

function bool SaveSettings()
{
    //return;    
}

function ResetSettings()
{
    //return;    
}

defaultproperties
{
    SetControlsBoundToParent=false
    SetControlsScaleToParent=false
    WinTop=0.2434896
    WinLeft=0.2822266
    WinWidth=0.4345703
    WinHeight=0.4921875
}