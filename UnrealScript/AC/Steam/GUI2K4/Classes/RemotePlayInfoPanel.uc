/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path GUI2K4\Classes\RemotePlayInfoPanel.uc
 * Package Imports:
 *	GUI2K4
 *	XInterface
 *	Core
 *
 * Stats:
 *	Properties:1
 *	Functions:10
 *
 *******************************************************************************/
class RemotePlayInfoPanel extends UT2K4PlayInfoPanel
    config(User)
    editinlinenew
    instanced;

var delegate<SettingChanged> __SettingChanged__Delegate;

delegate SettingChanged(string SettingName, string NewValue);
function InitComponent(GUIController InController, GUIComponent inOwner)
{
    super.InitComponent(InController, inOwner);
    lb_Rules.FillOwner();
}

function PlayInfo GetPlayInfo()
{
    // End:0x1a
    if(GamePI == none)
    {
        GamePI = new (none) class'PlayInfo';
    }
    return GamePI;
}

function ReceivedRule(string PropertyName, string ClassName, string CurrentValue)
{
    local int i;
    local class<Info> OwnerClass;

    GetPlayInfo();
    i = GamePI.FindIndex(PropertyName);
    // End:0xd8
    if(i == -1)
    {
        OwnerClass = class<Info>(DynamicLoadObject(ClassName, class'Class'));
        // End:0xbc
        if(OwnerClass != none)
        {
            OwnerClass.static.FillPlayInfo(GamePI);
            i = GamePI.FindIndex(PropertyName);
            // End:0xb9
            if(i == -1)
            {
                Log("Failed to find PlayInfo Setting " $ PropertyName);
                return;
            }
        }
        // End:0xd8
        else
        {
            Log("Failed to load " $ ClassName);
            return;
        }
    }
    StoreSetting(i, CurrentValue);
    InfoRules[InfoRules.Length] = GamePI.Settings[i];
}

function ReceivedValue(string SettingName, string Value)
{
    local int gidx, ridx, lidx;

    gidx = GamePI.FindIndex(SettingName);
    // End:0xa1
    if(gidx != -1)
    {
        ridx = GetInfoRuleIndex(gidx);
        // End:0xa1
        if(ridx != -1)
        {
            lidx = FindComponentWithTag(ridx);
            // End:0xa1
            if(lidx >= 0 && lidx < li_Rules.Elements.Length)
            {
                li_Rules.Elements[lidx].SetComponentValue(Value, true);
            }
        }
    }
}

function ClearRules()
{
    // End:0x17
    if(GamePI != none)
    {
        GamePI.Clear();
    }
    InfoRules.Remove(0, InfoRules.Length);
}

function Refresh()
{
    ClearRules();
    LoadRules();
}

function LoadRules()
{
    local int i, idx, LastIdx;

    GamePI.Sort(0);
    LastIdx = -1;
    i = 0;
    J0x20:
    // End:0xd7 [While If]
    if(i < GamePI.Settings.Length)
    {
        idx = GetInfoRuleIndex(i);
        // End:0xcd
        if(idx != -1)
        {
            // End:0xac
            if(LastIdx == -1 || InfoRules[idx].Grouping != InfoRules[LastIdx].Grouping)
            {
                AddGroupHeader(idx, li_Rules.Elements.Length == 0);
            }
            AddRule(InfoRules[idx], idx);
            LastIdx = idx;
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x20;
    }
    super.LoadRules();
}

function int GetInfoRuleIndex(int GamePIIndex)
{
    local int i;

    // End:0x39
    if(GamePI == none || GamePIIndex < 0 || GamePIIndex >= GamePI.Settings.Length)
    {
        return -1;
    }
    i = 0;
    J0x40:
    // End:0x8e [While If]
    if(i < InfoRules.Length)
    {
        // End:0x84
        if(InfoRules[i].SettingName ~= GamePI.Settings[GamePIIndex].SettingName)
        {
            return i;
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x40;
    }
    return -1;
}

function UpdateSetting(GUIMenuOption Sender)
{
    local int i, Index;
    local string Value;

    // End:0x0d
    if(Sender == none)
    {
        return;
    }
    i = Sender.Tag;
    // End:0x2e
    if(i < 0)
    {
        return;
    }
    GetPlayInfo();
    // End:0xc4
    if(InfoRules[i].DisplayName != Sender.Caption)
    {
        // End:0xc2
        if(Controller.bModAuthor)
        {
            Log("Corrupt list index detected in component" @ string(Sender.Name), 'ModAuthor');
            DumpListElements(FindComponentIndex(Sender), i);
        }
        return;
    }
    Index = GamePI.FindIndex(InfoRules[i].SettingName);
    // End:0x175
    if(InfoRules[i].DisplayName != Sender.Caption || Index == -1)
    {
        // End:0x173
        if(Controller.bModAuthor)
        {
            Log("Invalid setting requested from PlayInfo!", 'ModAuthor');
            DumpListElements(FindComponentIndex(Sender), i);
        }
        return;
    }
    Value = Sender.GetComponentValue();
    StoreSetting(Index, Value);
    SettingChanged(GamePI.Settings[Index].SettingName, GamePI.Settings[Index].Value);
}

defaultproperties
{
    NumColumns=2
}