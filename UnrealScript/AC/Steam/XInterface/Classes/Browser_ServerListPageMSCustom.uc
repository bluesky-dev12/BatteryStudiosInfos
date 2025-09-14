/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path XInterface\Classes\Browser_ServerListPageMSCustom.uc
 * Package Imports:
 *	XInterface
 *	Core
 *
 * Stats:
 *	Properties:5
 *	Functions:6
 *
 *******************************************************************************/
class Browser_ServerListPageMSCustom extends Browser_ServerListPageMS
    config(User)
    editinlinenew
    instanced;

var export editinline GUISplitter GameTypeSplit;
var export editinline GUIComboBox GameTypeCombo;
var export editinline GUISplitter MainSplit;
var bool CustomInitialized;
var config string LastGameType;

function ChangeGameType(GUIComponent Sender)
{
    Log("New Game Type:" $ GameTypeCombo.GetText() $ " (" $ GameTypeCombo.GetExtra() $ ")");
    GameType = GameTypeCombo.GetExtra();
    LastGameType = GameType;
    SaveConfig();
    RefreshList();
}

function string MyParseDescStr(string DescStr, int Index)
{
    local string temp;
    local int P, i;

    i = 0;
    J0x07:
    // End:0x93 [While If]
    if(DescStr != "")
    {
        P = InStr(DescStr, "|");
        // End:0x44
        if(P < 0)
        {
            temp = DescStr;
            DescStr = "";
        }
        // End:0x74
        else
        {
            temp = Left(DescStr, P);
            DescStr = Right(DescStr, Len(DescStr) - P - 1);
        }
        // End:0x89
        if(i == Index)
        {
            return temp;
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x07;
    }
}

static function bool IsStandardGameType(string Desc)
{
    // End:0x1c
    if(InStr(Desc, "wDeathMatch") >= 0)
    {
        return true;
    }
    // End:0x36
    if(InStr(Desc, "wTeamGame") >= 0)
    {
        return true;
    }
    // End:0x4f
    if(InStr(Desc, "wCTFGame") >= 0)
    {
        return true;
    }
    // End:0x6b
    if(InStr(Desc, "wBombingRun") >= 0)
    {
        return true;
    }
    // End:0x86
    if(InStr(Desc, "wDoubleDom") >= 0)
    {
        return true;
    }
    // End:0xa2
    if(InStr(Desc, "wMutantGame") >= 0)
    {
        return true;
    }
    // End:0xc3
    if(InStr(Desc, "wLastManStanding") >= 0)
    {
        return true;
    }
    // End:0xdc
    if(InStr(Desc, "Invasion") >= 0)
    {
        return true;
    }
    return false;
}

function string FindGameTypeName(string GameType)
{
    local int i;

    i = 0;
    J0x07:
    // End:0x77 [While If]
    if(i < GameTypeCombo.List.ItemCount)
    {
        // End:0x6d
        if(GameType == GameTypeCombo.List.GetExtraAtIndex(i))
        {
            return GameTypeCombo.List.GetItemAtIndex(i);
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x07;
    }
    Log("CustomTab: Could Not Find Game Type '" $ GameType $ "' In Combo");
    return "";
}

function PopulateGameTypes()
{
    local string Entry, Desc, MyGameType, TypeName;
    local int Index, PeriodPos;

    Index = 0;
    PlayerOwner().GetNextIntDesc("GameInfo", Index, Entry, Desc);
    J0x2d:
    // End:0x103 [While If]
    if(Entry != "")
    {
        Desc = Entry $ "|" $ Desc;
        // End:0xd3
        if(!IsStandardGameType(Desc))
        {
            MyGameType = MyParseDescStr(Desc, 0);
            PeriodPos = InStr(MyGameType, ".");
            // End:0xa6
            if(PeriodPos != -1)
            {
                MyGameType = Mid(MyGameType, PeriodPos + 1);
            }
            TypeName = MyParseDescStr(Desc, 2);
            GameTypeCombo.AddItem(TypeName, none, MyGameType);
        }
        ++ Index;
        PlayerOwner().GetNextIntDesc("GameInfo", Index, Entry, Desc);
        // This is an implied JumpToken; Continue!
        goto J0x2d;
    }
    GameType = LastGameType;
    GameTypeCombo.SetText(FindGameTypeName(LastGameType));
}

function InitComponent(GUIController C, GUIComponent o)
{
    super.InitComponent(C, o);
    // End:0xc6
    if(!CustomInitialized)
    {
        MainSplit = GUISplitter(Controls[0]);
        MainSplit.WinHeight = 1.0;
        GameTypeSplit.Controls[1] = MainSplit;
        Controls[0] = GameTypeSplit;
        GameTypeSplit.InitComponent(C, self);
        GameTypeCombo = GUIComboBox(GUIPanel(GameTypeSplit.Controls[0]).Controls[0]);
        PopulateGameTypes();
        GameTypeCombo.__OnChange__Delegate = ChangeGameType;
        CustomInitialized = true;
    }
    GameTypeCombo.ReadOnly(true);
}

defaultproperties
{
    begin object name=MyGameTypeSplitter class=GUISplitter
        SplitPosition=0.080
        bFixedSplitter=true
        bDrawSplitter=true
        Background=Texture'Engine.DefaultTexture'
        Controls=// Object reference not set to an instance of an object.
        
        WinHeight=0.90
        bBoundToParent=true
        bScaleToParent=true
    object end
    // Reference: GUISplitter'Browser_ServerListPageMSCustom.MyGameTypeSplitter'
    GameTypeSplit=MyGameTypeSplitter
}