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
    Log(((("New Game Type:" $ GameTypeCombo.GetText()) $ " (") $ GameTypeCombo.GetExtra()) $ ")");
    GameType = GameTypeCombo.GetExtra();
    LastGameType = GameType;
    SaveConfig();
    RefreshList();
    //return;    
}

function string MyParseDescStr(string DescStr, int Index)
{
    local string Temp;
    local int P, i;

    i = 0;
    J0x07:

    // End:0x93 [Loop If]
    if(DescStr != "")
    {
        P = InStr(DescStr, "|");
        // End:0x44
        if(P < 0)
        {
            Temp = DescStr;
            DescStr = "";            
        }
        else
        {
            Temp = Left(DescStr, P);
            DescStr = Right(DescStr, (Len(DescStr) - P) - 1);
        }
        // End:0x89
        if(i == Index)
        {
            return Temp;
        }
        i++;
        // [Loop Continue]
        goto J0x07;
    }
    //return;    
}

static function bool IsStandardGameType(string Desc)
{
    // End:0x1C
    if(InStr(Desc, "wDeathMatch") >= 0)
    {
        return true;
    }
    // End:0x36
    if(InStr(Desc, "wTeamGame") >= 0)
    {
        return true;
    }
    // End:0x4F
    if(InStr(Desc, "wCTFGame") >= 0)
    {
        return true;
    }
    // End:0x6B
    if(InStr(Desc, "wBombingRun") >= 0)
    {
        return true;
    }
    // End:0x86
    if(InStr(Desc, "wDoubleDom") >= 0)
    {
        return true;
    }
    // End:0xA2
    if(InStr(Desc, "wMutantGame") >= 0)
    {
        return true;
    }
    // End:0xC3
    if(InStr(Desc, "wLastManStanding") >= 0)
    {
        return true;
    }
    // End:0xDC
    if(InStr(Desc, "Invasion") >= 0)
    {
        return true;
    }
    return false;
    //return;    
}

function string FindGameTypeName(string GameType)
{
    local int i;

    i = 0;
    J0x07:

    // End:0x77 [Loop If]
    if(i < GameTypeCombo.List.ItemCount)
    {
        // End:0x6D
        if(GameType == GameTypeCombo.List.GetExtraAtIndex(i))
        {
            return GameTypeCombo.List.GetItemAtIndex(i);
        }
        i++;
        // [Loop Continue]
        goto J0x07;
    }
    Log(("CustomTab: Could Not Find Game Type '" $ GameType) $ "' In Combo");
    return "";
    //return;    
}

function PopulateGameTypes()
{
    local string Entry, Desc, MyGameType, TypeName;
    local int Index, PeriodPos;

    Index = 0;
    PlayerOwner().GetNextIntDesc("GameInfo", Index, Entry, Desc);
    J0x2D:

    // End:0x103 [Loop If]
    if(Entry != "")
    {
        Desc = (Entry $ "|") $ Desc;
        // End:0xD3
        if(!IsStandardGameType(Desc))
        {
            MyGameType = MyParseDescStr(Desc, 0);
            PeriodPos = InStr(MyGameType, ".");
            // End:0xA6
            if(PeriodPos != -1)
            {
                MyGameType = Mid(MyGameType, PeriodPos + 1);
            }
            TypeName = MyParseDescStr(Desc, 2);
            GameTypeCombo.AddItem(TypeName, none, MyGameType);
        }
        Index++;
        PlayerOwner().GetNextIntDesc("GameInfo", Index, Entry, Desc);
        // [Loop Continue]
        goto J0x2D;
    }
    GameType = LastGameType;
    GameTypeCombo.SetText(FindGameTypeName(LastGameType));
    //return;    
}

function InitComponent(GUIController C, GUIComponent o)
{
    super.InitComponent(C, o);
    // End:0xC6
    if(!CustomInitialized)
    {
        MainSplit = GUISplitter(Controls[0]);
        MainSplit.WinHeight = 1.0000000;
        GameTypeSplit.Controls[1] = MainSplit;
        Controls[0] = GameTypeSplit;
        GameTypeSplit.InitComponent(C, self);
        GameTypeCombo = GUIComboBox(GUIPanel(GameTypeSplit.Controls[0]).Controls[0]);
        PopulateGameTypes();
        GameTypeCombo.__OnChange__Delegate = ChangeGameType;
        CustomInitialized = true;
    }
    GameTypeCombo.ReadOnly(true);
    //return;    
}

defaultproperties
{
    // Reference: GUISplitter'XInterface_Decompressed.Browser_ServerListPageMSCustom.MyGameTypeSplitter'
    begin object name="MyGameTypeSplitter" class=XInterface_Decompressed.GUISplitter
        SplitPosition=0.0800000
        bFixedSplitter=true
        bDrawSplitter=false
        Background=Texture'Engine.DefaultTexture'
        Controls[0]=GUIPanel'XInterface_Decompressed.Browser_ServerListPageMSCustom.GameTypePanel'
        WinHeight=0.9000000
        bBoundToParent=true
        bScaleToParent=true
    end object
    GameTypeSplit=MyGameTypeSplitter
}