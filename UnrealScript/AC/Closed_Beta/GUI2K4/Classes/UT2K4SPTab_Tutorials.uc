class UT2K4SPTab_Tutorials extends UT2K4SPTab_Base
    config(User)
    editinlinenew
    instanced;

struct SPTutorial
{
    var string GameClass;
    var string Preview;
    var string PreviewLocked;
    var string Map;
    var bool unLocked;
};

var config array<SPTutorial> Tutorials;
var Material BorderMat;
var Material ShadowMat;
var localized string StartTutorial;
var array<export editinline GUIImage> TutImages;

function InitComponent(GUIController MyController, GUIComponent myOwner)
{
    super.InitComponent(MyController, myOwner);
    CreateButtons();
    //return;    
}

function CreateButtons()
{
    local int i, Cols, Rows, N;
    local float colWidth, rowHeight, CellWidth, cellHeight, spacingHeight, spacingWidth,
	    X, Y;

    local export editinline GUIImage img;
    local export editinline GUISectionBackground sbg;
    local export editinline GUIButton btn;
    local GameRecord GR;

    Rows = int(Round(Sqrt(float(Tutorials.Length))));
    Cols = int(Ceil(float(Tutorials.Length) / float(Rows)));
    colWidth = WinWidth / float(Cols);
    rowHeight = WinHeight / float(Rows);
    CellWidth = colWidth * 0.9000000;
    cellHeight = rowHeight * 0.9000000;
    X = FMin(CellWidth, cellHeight);
    CellWidth = X;
    cellHeight = X;
    spacingHeight = ((rowHeight - cellHeight) / 2.0000000) + 0.0050000;
    spacingWidth = ((colWidth - CellWidth) / 2.0000000) + 0.0050000;
    i = 0;
    J0xEB:

    // End:0x493 [Loop If]
    if(i < Tutorials.Length)
    {
        X = (((float(i) % float(Cols)) * colWidth) + spacingWidth) + WinLeft;
        Y = ((float(i / Cols) * rowHeight) + spacingHeight) + WinTop;
        // End:0x1BD
        if((((i / Cols) + 1) == Rows) && (Rows * Cols) > Tutorials.Length)
        {
            N = (Rows * Cols) - Tutorials.Length;
            X = X + ((colWidth * float(N)) / 2.0000000);
        }
        GR = Class'Engine.CacheManager'.static.GetGameRecord(Tutorials[i].GameClass);
        btn = new Class'XInterface.GUIButton';
        btn.StyleName = "NoBackground";
        btn.bFocusOnWatch = true;
        btn.WinHeight = CellWidth;
        btn.WinWidth = cellHeight;
        btn.WinTop = Y;
        btn.WinLeft = X;
        btn.__OnClick__Delegate = OnTutorialClick;
        btn.Tag = i;
        btn.Hint = StartTutorial @ GR.GameName;
        btn.RenderWeight = 0.4000000;
        btn.TabOrder = Controls.Length + 1;
        AppendComponent(btn, true);
        sbg = new Class'GUI2K4_Decompressed.AltSectionBackground';
        sbg.WinHeight = cellHeight;
        sbg.WinWidth = CellWidth;
        sbg.WinTop = Y;
        sbg.WinLeft = X;
        sbg.RenderWeight = 0.1000000;
        sbg.Caption = GR.GameName;
        AppendComponent(sbg, true);
        img = new Class'XInterface.GUIImage';
        img.ImageStyle = 2;
        img.WinHeight = cellHeight - 0.0960500;
        img.WinWidth = CellWidth - 0.0262500;
        img.WinTop = Y + 0.0466670;
        img.WinLeft = X + 0.0137500;
        img.X1 = 0;
        img.Y1 = 0;
        img.X2 = 1023;
        img.Y2 = 767;
        img.RenderWeight = 0.1700000;
        AppendComponent(img, true);
        TutImages[i] = img;
        i++;
        // [Loop Continue]
        goto J0xEB;
    }
    //return;    
}

function ShowPanel(bool bShow)
{
    local int i;
    local Material ss;

    super.ShowPanel(bShow);
    // End:0x1C
    if(bShow)
    {
        btnPlayEnabled(false);
    }
    // End:0x29
    if(!bShow)
    {
        return;
    }
    i = 0;
    J0x30:

    // End:0xFA [Loop If]
    if(i < Tutorials.Length)
    {
        // End:0xF0
        if(TutImages[i].Image == none)
        {
            // End:0xB0
            if(Tutorials[i].unLocked || Tutorials[i].PreviewLocked == "")
            {
                ss = Material(DynamicLoadObject(Tutorials[i].Preview, Class'Engine.Material'));                
            }
            else
            {
                ss = Material(DynamicLoadObject(Tutorials[i].PreviewLocked, Class'Engine.Material'));
            }
            TutImages[i].Image = ss;
        }
        i++;
        // [Loop Continue]
        goto J0x30;
    }
    //return;    
}

function bool OnTutorialClick(GUIComponent Sender)
{
    GP = UT2K4GameProfile(PlayerOwner().Level.Game.CurrentGameProfile);
    // End:0x110
    if(GP != none)
    {
        GP.bInLadderGame = true;
        GP.SpecialEvent = "";
        GP.lmdFreshInfo = false;
        PlayerOwner().Level.Game.SavePackage(GP.PackageName);
        PlayerOwner().ConsoleCommand((("START" @ Tutorials[Sender.Tag].Map) $ "?quickstart=true?TeamScreen=false?NumBots=0?savegame=") $ GP.PackageName);        
    }
    else
    {
        PlayerOwner().ConsoleCommand(("START" @ Tutorials[Sender.Tag].Map) $ "?quickstart=true?TeamScreen=false?NumBots=0");
    }
    MainWindow.bAllowedAsLast = true;
    Controller.CloseAll(false, true);
    return true;
    //return;    
}

static function unlockButton(string Tag)
{
    // End:0x21
    if(Tag ~= "TDM")
    {
        default.Tutorials[0].unLocked = true;        
    }
    else
    {
        // End:0x42
        if(Tag ~= "CTF")
        {
            default.Tutorials[1].unLocked = true;            
        }
        else
        {
            // End:0x64
            if(Tag ~= "DOM")
            {
                default.Tutorials[2].unLocked = true;                
            }
            else
            {
                // End:0x82
                if(Tag ~= "BR")
                {
                    default.Tutorials[3].unLocked = true;
                }
            }
        }
    }
    StaticSaveConfig();
    //return;    
}

defaultproperties
{
    Tutorials[0]=(GameClass="wGame.wDeathMatch",Preview="LadderShots.TeamDMMoneyShot",PreviewLocked="LadderShots.TeamDMShot",Map="TUT-DM",unLocked=false)
    Tutorials[1]=(GameClass="wGame.wCTFGame",Preview="LadderShots.CTFMoneyShot",PreviewLocked="LadderShots.CTFShot",Map="TUT-CTF",unLocked=false)
    Tutorials[2]=(GameClass="wGame.wDoubleDom",Preview="LadderShots.DOMMoneyShot",PreviewLocked="LadderShots.DOMShot",Map="TUT-DOM2",unLocked=false)
    Tutorials[3]=(GameClass="wGame.wBombingRun",Preview="LadderShots.BRMoneyShot",PreviewLocked="LadderShots.BRShot",Map="TUT-BR",unLocked=false)
    StartTutorial="?? ?? ??? ????? ??? ?? ??? ??????."
    PanelCaption="????"
}