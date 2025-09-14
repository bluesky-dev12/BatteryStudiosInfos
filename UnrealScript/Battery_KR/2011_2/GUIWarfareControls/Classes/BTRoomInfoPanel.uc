class BTRoomInfoPanel extends GUITabPanel
    editinlinenew
    instanced;

var() automated BTInputImage BorderTitleMapInfo;
var() automated FloatingImage TitleMapInfo;
var() automated GUILabel LabelMapName;
var() automated BTBoxImage MapImageSectionBG;
var() automated FloatingImage MapImage;
var() automated BTBoxImage DetailSectionBG;
var() automated GUILabel LabelMode;
var localized string LabelModeCaption;
var() automated GUILabel Mode;
var() automated GUILabel LabelWeaponRestriction;
var localized string LabelWeaponRestrictionCaption;
var() automated GUILabel WeaponRestriction;
var() automated GUILabel LabelHardcore;
var localized string LabelHardcoreCaption;
var() automated GUILabel HardCore;
var() automated GUILabel LabelCapacity;
var localized string LabelCapacityCaption;
var() automated GUILabel Capacity;
var() automated GUILabel LabelGameTime;
var localized string LabelGameTimeCaption;
var() automated GUILabel GameTime;
var() automated GUILabel LabelObjective;
var localized string LabelObjectiveCaption;
var() automated GUILabel Objective;

function InitComponent(GUIController MyController, GUIComponent myOwner)
{
    super(GUIPanel).InitComponent(MyController, myOwner);
    ApplyLocalizedStrings();
    //return;    
}

function ApplyLocalizedStrings()
{
    LabelMode.Caption = LabelModeCaption;
    LabelWeaponRestriction.Caption = LabelWeaponRestrictionCaption;
    LabelHardcore.Caption = LabelHardcoreCaption;
    LabelCapacity.Caption = LabelCapacityCaption;
    LabelGameTime.Caption = LabelGameTimeCaption;
    LabelObjective.Caption = LabelObjectiveCaption;
    //return;    
}

function SetMapName(string Value)
{
    LabelMapName.Caption = Value;
    //return;    
}

function SetMapImage(Material Value)
{
    MapImage.Image = Value;
    //return;    
}

function SetMode(string ClassName)
{
    local int lp1;
    local array<GameModeInfo> modes;

    modes = Class'Engine.wGameSettings'.static.GetAllGameModes();
    lp1 = 0;
    J0x1C:

    // End:0x76 [Loop If]
    if(lp1 < modes.Length)
    {
        // End:0x6C
        if(Caps(modes[lp1].ClassName) == Caps(ClassName))
        {
            Mode.Caption = modes[lp1].UserFriendlyName;
            // [Explicit Break]
            goto J0x76;
        }
        lp1++;
        // [Loop Continue]
        goto J0x1C;
    }
    J0x76:

    //return;    
}

function SetTime(int Min)
{
    GameTime.Caption = ("" $ string(Min)) $ ":00";
    //return;    
}

function SetCapacity(int Max)
{
    Capacity.Caption = (("" $ string(Max / 2)) $ " vs ") $ string(Max / 2);
    //return;    
}

function SetObjective(coerce string val)
{
    Objective.Caption = val;
    //return;    
}

function bool InternalOnDraw(Canvas C)
{
    return false;
    //return;    
}

defaultproperties
{
    LabelModeCaption="??"
    LabelWeaponRestrictionCaption="????"
    LabelHardcoreCaption="----"
    LabelCapacityCaption="???"
    LabelGameTimeCaption="????"
    LabelObjectiveCaption="????"
    SetControlsBoundToParent=false
    SetControlsScaleToParent=false
    OnDraw=BTRoomInfoPanel.InternalOnDraw
}