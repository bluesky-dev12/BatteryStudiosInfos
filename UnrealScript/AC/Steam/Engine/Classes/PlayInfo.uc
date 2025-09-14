/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path Engine\Classes\PlayInfo.uc
 * Package Imports:
 *	Engine
 *	Core
 *
 * Stats:
 *	Enums:1
 *	Structs:1
 *	Properties:5
 *	Functions:14
 *
 *******************************************************************************/
class PlayInfo extends Object
    native;

enum EPlayInfoType
{
    PIT_Check,
    PIT_Select,
    PIT_Text,
    PIT_Custom
};

struct native init PlayInfoData
{
    var const Property ThisProp;
    var const class<Info> ClassFrom;
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
var const array< class<Info> > InfoClasses;
var const array<int> ClassStack;
var const array<string> Groups;
var const string LastError;

// Export UPlayInfo::execClear(FFrame&, void* const)
native(700) final function bool Clear();
// Export UPlayInfo::execAddClass(FFrame&, void* const)
native(701) final function bool AddClass(class<Info> AddingClass);
// Export UPlayInfo::execRemoveClass(FFrame&, void* const)
native(702) final function bool RemoveClass(class<Info> RemovingClass);
// Export UPlayInfo::execPopClass(FFrame&, void* const)
native(703) final function bool PopClass();
// Export UPlayInfo::execAddSetting(FFrame&, void* const)
native(704) final function bool AddSetting(string Group, string PropertyName, string Description, byte SecLevel, byte Weight, string RenderType, optional string Extras, optional string ExtraPrivs, optional bool bMultiPlayerOnly, optional bool bAdvanced);
// Export UPlayInfo::execSaveSettings(FFrame&, void* const)
native(705) final function bool SaveSettings();
// Export UPlayInfo::execStoreSetting(FFrame&, void* const)
native(706) final function bool StoreSetting(int Index, coerce string NewVal, optional string RangeData);
// Export UPlayInfo::execGetSettings(FFrame&, void* const)
native(707) final function bool GetSettings(string GroupName, out array<PlayInfoData> GroupSettings);
// Export UPlayInfo::execFindIndex(FFrame&, void* const)
native(708) final function int FindIndex(string SettingName);
// Export UPlayInfo::execSort(FFrame&, void* const)
native(709) final function Sort(byte SortingMethod);
final function Dump(optional string Group)
{
    local int i;

    Log("** Dumping settings array for PlayInfo object '" $ string(Name) $ "' **");
    Log("** Classes:" @ string(InfoClasses.Length));
    i = 0;
    J0x64:
    // End:0xab [While If]
    if(i < InfoClasses.Length)
    {
        Log("   " $ string(i) $ ")" @ string(InfoClasses[i].Name));
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x64;
    }
    Log("");
    Log("** Groups:" @ string(Groups.Length));
    i = 0;
    J0xce:
    // End:0x10a [While If]
    if(i < Groups.Length)
    {
        Log("   " $ string(i) $ ")" @ Groups[i]);
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0xce;
    }
    Log("");
    Log("** Settings:" @ string(Settings.Length));
    i = 0;
    J0x12f:
    // End:0x43c [While If]
    if(i < Settings.Length)
    {
        // End:0x432
        if(Group == "" || Group ~= Settings[i].Grouping)
        {
            Log(string(i) $ ")" @ Settings[i].SettingName);
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
            Log("             RenderType:" @ string(GetEnum(enum'EPlayInfoType', Settings[i].RenderType)));
            Log("");
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x12f;
    }
}

final function bool Init(array< class<Info> > Classes, optional bool bStrict)
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
    // End:0xcd [While If]
    if(i < Classes.Length)
    {
        // End:0xad
        if(Classes[i] == none)
        {
            Log("Call in PlayInfo.Init() with 'None' value for Class array member.  Index:" $ string(i));
            Classes.Remove(-- i, 1);
        }
        // End:0xc3
        else
        {
            Classes[i].static.FillPlayInfo(self);
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x25;
    }
    // End:0x16c
    if(bStrict)
    {
        i = InfoClasses.Length - 1;
        J0xe5:
        // End:0x16c [While If]
        if(i >= 0)
        {
            j = 0;
            J0xf7:
            // End:0x12f [While If]
            if(j < Classes.Length)
            {
                // End:0x125
                if(InfoClasses[i] == Classes[j])
                {
                }
                // End:0x12f
                else
                {
                    ++ j;
                    // This is an implied JumpToken; Continue!
                    goto J0xf7;
                }
            }
            // End:0x142
            if(j < Classes.Length)
            {
            }
            // End:0x162
            else
            {
                B = B && RemoveClass(InfoClasses[i]);
            }
            -- i;
            // This is an implied JumpToken; Continue!
            goto J0xe5;
        }
    }
    return B;
}

final function class<GameInfo> GetGameInfo()
{
    local int i;

    i = 0;
    J0x07:
    // End:0x48 [While If]
    if(i < InfoClasses.Length)
    {
        // End:0x3e
        if(class<GameInfo>(InfoClasses[i]) != none)
        {
            return class<GameInfo>(InfoClasses[i]);
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x07;
    }
    return none;
}

final function SplitStringToArray(out array<string> Parts, string Source, string Delim)
{
    Split(Source, Delim, Parts);
}
