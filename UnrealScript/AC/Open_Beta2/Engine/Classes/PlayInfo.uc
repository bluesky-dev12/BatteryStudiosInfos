class PlayInfo extends Object
    native;

enum EPlayInfoType
{
    PIT_Check,                      // 0
    PIT_Select,                     // 1
    PIT_Text,                       // 2
    PIT_Custom                      // 3
};

struct native init PlayInfoData
{
    var const Property ThisProp;
    var const Class<Info> ClassFrom;
    var const string SettingName;
    var const string DisplayName;
    var const string Description;
    var const string Grouping;
    var const string Data;
    var const string ExtraPriv;
    var const string Value;
    var const PlayInfo.EPlayInfoType RenderType;
    var const byte SecLevel;
    var const byte Weight;
    var const bool bMPOnly;
    var const bool bAdvanced;
    var const bool bGlobal;
    var const bool bStruct;
    var const int ArrayDim;
};

var const array<PlayInfoData> Settings;
var const array< Class<Info> > InfoClasses;
var const array<int> ClassStack;
var const array<string> Groups;
var const string LastError;

// Export UPlayInfo::execClear(FFrame&, void* const)
native(700) final function bool Clear();

// Export UPlayInfo::execAddClass(FFrame&, void* const)
native(701) final function bool AddClass(Class<Info> AddingClass)
{
    //native.AddingClass;        
}

// Export UPlayInfo::execRemoveClass(FFrame&, void* const)
native(702) final function bool RemoveClass(Class<Info> RemovingClass)
{
    //native.RemovingClass;        
}

// Export UPlayInfo::execPopClass(FFrame&, void* const)
native(703) final function bool PopClass();

// Export UPlayInfo::execAddSetting(FFrame&, void* const)
native(704) final function bool AddSetting(string Group, string PropertyName, string Description, byte SecLevel, byte Weight, string RenderType, optional string Extras, optional string ExtraPrivs, optional bool bMultiPlayerOnly, optional bool bAdvanced)
{
    //native.Group;
    //native.PropertyName;
    //native.Description;
    //native.SecLevel;
    //native.Weight;
    //native.RenderType;
    //native.Extras;
    //native.ExtraPrivs;
    //native.bMultiPlayerOnly;
    //native.bAdvanced;        
}

// Export UPlayInfo::execSaveSettings(FFrame&, void* const)
native(705) final function bool SaveSettings();

// Export UPlayInfo::execStoreSetting(FFrame&, void* const)
native(706) final function bool StoreSetting(int Index, coerce string NewVal, optional string RangeData)
{
    //native.Index;
    //native.NewVal;
    //native.RangeData;        
}

// Export UPlayInfo::execGetSettings(FFrame&, void* const)
native(707) final function bool GetSettings(string GroupName, out array<PlayInfoData> GroupSettings)
{
    //native.GroupName;
    //native.GroupSettings;        
}

// Export UPlayInfo::execFindIndex(FFrame&, void* const)
native(708) final function int FindIndex(string SettingName)
{
    //native.SettingName;        
}

// Export UPlayInfo::execSort(FFrame&, void* const)
native(709) final function Sort(byte SortingMethod)
{
    //native.SortingMethod;        
}

final function Dump(optional string Group)
{
    local int i;

    Log(("** Dumping settings array for PlayInfo object '" $ string(Name)) $ "' **");
    Log("** Classes:" @ string(InfoClasses.Length));
    i = 0;
    J0x64:

    // End:0xAB [Loop If]
    if(i < InfoClasses.Length)
    {
        Log((("   " $ string(i)) $ ")") @ string(InfoClasses[i].Name));
        i++;
        // [Loop Continue]
        goto J0x64;
    }
    Log("");
    Log("** Groups:" @ string(Groups.Length));
    i = 0;
    J0xCE:

    // End:0x10A [Loop If]
    if(i < Groups.Length)
    {
        Log((("   " $ string(i)) $ ")") @ Groups[i]);
        i++;
        // [Loop Continue]
        goto J0xCE;
    }
    Log("");
    Log("** Settings:" @ string(Settings.Length));
    i = 0;
    J0x12F:

    // End:0x43C [Loop If]
    if(i < Settings.Length)
    {
        // End:0x432
        if((Group == "") || Group ~= Settings[i].Grouping)
        {
            Log((string(i) $ ")") @ Settings[i].SettingName);
            Log("            DisplayName:" @ Settings[i].DisplayName);
            Log("              ClassFrom:" @ string(Settings[i].ClassFrom));
            Log("                  Group:" @ Settings[i].Grouping);
            Log("                  Value:" @ Settings[i].Value);
            Log("                   Data:" @ Settings[i].Data);
            Log("                 Weight:" @ string(Settings[i].Weight));
            Log("                 Struct:" @ string(Settings[i].bStruct));
            Log("                 Global:" @ string(Settings[i].bGlobal));
            Log("                 MPOnly:" @ string(Settings[i].bMPOnly));
            Log("               SecLevel:" @ string(Settings[i].SecLevel));
            Log("               ArrayDim:" @ string(Settings[i].ArrayDim));
            Log("              bAdvanced:" @ string(Settings[i].bAdvanced));
            Log("              ExtraPriv:" @ Settings[i].ExtraPriv);
            Log("             RenderType:" @ string(GetEnum(Enum'Engine_Decompressed.PlayInfo.EPlayInfoType', int(Settings[i].RenderType))));
            Log("");
        }
        i++;
        // [Loop Continue]
        goto J0x12F;
    }
    //return;    
}

final function bool Init(array< Class<Info> > Classes, optional bool bStrict)
{
    local int i, j;
    local bool B;

    // End:0x13
    if(Classes.Length == 0)
    {
        return B;
    }
    B = true;
    Clear();
    i = 0;
    J0x25:

    // End:0xCD [Loop If]
    if(i < Classes.Length)
    {
        // End:0xAD
        if(Classes[i] == none)
        {
            Log("Call in PlayInfo.Init() with 'None' value for Class array member.  Index:" $ string(i));
            Classes.Remove(i--, 1);
            // [Explicit Continue]
            goto J0xC3;
        }
        Classes[i].static.FillPlayInfo(self);
        J0xC3:

        i++;
        // [Loop Continue]
        goto J0x25;
    }
    // End:0x16C
    if(bStrict)
    {
        i = InfoClasses.Length - 1;
        J0xE5:

        // End:0x16C [Loop If]
        if(i >= 0)
        {
            j = 0;
            J0xF7:

            // End:0x12F [Loop If]
            if(j < Classes.Length)
            {
                // End:0x125
                if(InfoClasses[i] == Classes[j])
                {
                    // [Explicit Break]
                    goto J0x12F;
                }
                j++;
                // [Loop Continue]
                goto J0xF7;
            }
            J0x12F:

            // End:0x142
            if(j < Classes.Length)
            {
                // [Explicit Continue]
                goto J0x162;
            }
            B = B && RemoveClass(InfoClasses[i]);
            J0x162:

            i--;
            // [Loop Continue]
            goto J0xE5;
        }
    }
    return B;
    //return;    
}

final function Class<GameInfo> GetGameInfo()
{
    local int i;

    i = 0;
    J0x07:

    // End:0x48 [Loop If]
    if(i < InfoClasses.Length)
    {
        // End:0x3E
        if(Class<GameInfo>(InfoClasses[i]) != none)
        {
            return Class<GameInfo>(InfoClasses[i]);
        }
        i++;
        // [Loop Continue]
        goto J0x07;
    }
    return none;
    //return;    
}

final function SplitStringToArray(out array<string> Parts, string Source, string Delim)
{
    Split(Source, Delim, Parts);
    //return;    
}
