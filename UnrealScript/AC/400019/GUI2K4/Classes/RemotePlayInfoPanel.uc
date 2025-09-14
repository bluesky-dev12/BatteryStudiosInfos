class RemotePlayInfoPanel extends UT2K4PlayInfoPanel
    config(User)
    editinlinenew
    instanced;

//var delegate<SettingChanged> __SettingChanged__Delegate;

delegate SettingChanged(string SettingName, string NewValue)
{
    //return;    
}

function InitComponent(GUIController InController, GUIComponent inOwner)
{
    super.InitComponent(InController, inOwner);
    lb_Rules.FillOwner();
    //return;    
}

function PlayInfo GetPlayInfo()
{
    // End:0x1A
    if(GamePI == none)
    {
        GamePI = new (none) Class'Engine.PlayInfo';
    }
    return GamePI;
    //return;    
}

function ReceivedRule(string PropertyName, string ClassName, string CurrentValue)
{
    local int i;
    local Class<Info> OwnerClass;

    GetPlayInfo();
    i = GamePI.FindIndex(PropertyName);
    // End:0xD8
    if(i == -1)
    {
        OwnerClass = Class<Info>(DynamicLoadObject(ClassName, Class'Core.Class'));
        // End:0xBC
        if(OwnerClass != none)
        {
            OwnerClass.static.FillPlayInfo(GamePI);
            i = GamePI.FindIndex(PropertyName);
            // End:0xB9
            if(i == -1)
            {
                Log("Failed to find PlayInfo Setting " $ PropertyName);
                return;
            }            
        }
        else
        {
            Log("Failed to load " $ ClassName);
            return;
        }
    }
    StoreSetting(i, CurrentValue);
    InfoRules[InfoRules.Length] = GamePI.Settings[i];
    //return;    
}

function ReceivedValue(string SettingName, string Value)
{
    local int gidx, ridx, lidx;

    gidx = GamePI.FindIndex(SettingName);
    // End:0xA1
    if(gidx != -1)
    {
        ridx = GetInfoRuleIndex(gidx);
        // End:0xA1
        if(ridx != -1)
        {
            lidx = FindComponentWithTag(ridx);
            // End:0xA1
            if((lidx >= 0) && lidx < li_Rules.Elements.Length)
            {
                li_Rules.Elements[lidx].SetComponentValue(Value, true);
            }
        }
    }
    //return;    
}

function ClearRules()
{
    // End:0x17
    if(GamePI != none)
    {
        GamePI.Clear();
    }
    InfoRules.Remove(0, InfoRules.Length);
    //return;    
}

function Refresh()
{
    ClearRules();
    LoadRules();
    //return;    
}

function LoadRules()
{
    local int i, idx, LastIdx;

    GamePI.Sort(0);
    LastIdx = -1;
    i = 0;
    J0x20:

    // End:0xD7 [Loop If]
    if(i < GamePI.Settings.Length)
    {
        idx = GetInfoRuleIndex(i);
        // End:0xCD
        if(idx != -1)
        {
            // End:0xAC
            if((LastIdx == -1) || InfoRules[idx].Grouping != InfoRules[LastIdx].Grouping)
            {
                AddGroupHeader(idx, li_Rules.Elements.Length == 0);
            }
            AddRule(InfoRules[idx], idx);
            LastIdx = idx;
        }
        i++;
        // [Loop Continue]
        goto J0x20;
    }
    super.LoadRules();
    //return;    
}

function int GetInfoRuleIndex(int GamePIIndex)
{
    local int i;

    // End:0x39
    if(((GamePI == none) || GamePIIndex < 0) || GamePIIndex >= GamePI.Settings.Length)
    {
        return -1;
    }
    i = 0;
    J0x40:

    // End:0x8E [Loop If]
    if(i < InfoRules.Length)
    {
        // End:0x84
        if(InfoRules[i].SettingName ~= GamePI.Settings[GamePIIndex].SettingName)
        {
            return i;
        }
        i++;
        // [Loop Continue]
        goto J0x40;
    }
    return -1;
    //return;    
}

function UpdateSetting(GUIMenuOption Sender)
{
    local int i, Index;
    local string Value;

    // End:0x0D
    if(Sender == none)
    {
        return;
    }
    i = Sender.Tag;
    // End:0x2E
    if(i < 0)
    {
        return;
    }
    GetPlayInfo();
    // End:0xC4
    if(InfoRules[i].DisplayName != Sender.Caption)
    {
        // End:0xC2
        if(Controller.bModAuthor)
        {
            Log("Corrupt list index detected in component" @ string(Sender.Name), 'ModAuthor');
            DumpListElements(FindComponentIndex(Sender), i);
        }
        return;
    }
    Index = GamePI.FindIndex(InfoRules[i].SettingName);
    // End:0x175
    if((InfoRules[i].DisplayName != Sender.Caption) || Index == -1)
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
    //return;    
}

defaultproperties
{
    NumColumns=2
}