/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path GUI2K4\Classes\UT2K4SPTab_Tutorials.uc
 * Package Imports:
 *	GUI2K4
 *	XInterface
 *	Core
 *
 * Stats:
 *	Structs:1
 *	Properties:5
 *	Functions:5
 *
 *******************************************************************************/
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
    CellWidth = colWidth * 0.90;
    cellHeight = rowHeight * 0.90;
    X = FMin(CellWidth, cellHeight);
    CellWidth = X;
    cellHeight = X;
    spacingHeight = rowHeight - cellHeight / 2.0 + 0.0050;
    spacingWidth = colWidth - CellWidth / 2.0 + 0.0050;
    i = 0;
    J0xeb:
    // End:0x493 [While If]
    if(i < Tutorials.Length)
    {
        X = float(i) % float(Cols) * colWidth + spacingWidth + WinLeft;
        Y = float(i / Cols) * rowHeight + spacingHeight + WinTop;
        // End:0x1bd
        if(i / Cols + 1 == Rows && Rows * Cols > Tutorials.Length)
        {
            N = Rows * Cols - Tutorials.Length;
            X = X + colWidth * float(N) / 2.0;
        }
        GR = class'CacheManager'.static.GetGameRecord(Tutorials[i].GameClass);
        btn = new class'GUIButton';
        btn.StyleName = "NoBackground";
        btn.bFocusOnWatch = true;
        btn.WinHeight = CellWidth;
        btn.WinWidth = cellHeight;
        btn.WinTop = Y;
        btn.WinLeft = X;
        btn.__OnClick__Delegate = OnTutorialClick;
        btn.Tag = i;
        btn.Hint = StartTutorial @ GR.GameName;
        btn.RenderWeight = 0.40;
        btn.TabOrder = Controls.Length + 1;
        AppendComponent(btn, true);
        sbg = new class'AltSectionBackground';
        sbg.WinHeight = cellHeight;
        sbg.WinWidth = CellWidth;
        sbg.WinTop = Y;
        sbg.WinLeft = X;
        sbg.RenderWeight = 0.10;
        sbg.Caption = GR.GameName;
        AppendComponent(sbg, true);
        img = new class'GUIImage';
        img.ImageStyle = 2;
        img.WinHeight = cellHeight - 0.096050;
        img.WinWidth = CellWidth - 0.026250;
        img.WinTop = Y + 0.0466670;
        img.WinLeft = X + 0.013750;
        img.X1 = 0;
        img.Y1 = 0;
        img.X2 = 1023;
        img.Y2 = 767;
        img.RenderWeight = 0.170;
        AppendComponent(img, true);
        TutImages[i] = img;
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0xeb;
    }
}

function ShowPanel(bool bShow)
{
    local int i;
    local Material ss;

    super.ShowPanel(bShow);
    // End:0x1c
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
    // End:0xfa [While If]
    if(i < Tutorials.Length)
    {
        // End:0xf0
        if(TutImages[i].Image == none)
        {
            // End:0xb0
            if(Tutorials[i].unLocked || Tutorials[i].PreviewLocked == "")
            {
                ss = Material(DynamicLoadObject(Tutorials[i].Preview, class'Material'));
            }
            // End:0xd6
            else
            {
                ss = Material(DynamicLoadObject(Tutorials[i].PreviewLocked, class'Material'));
            }
            TutImages[i].Image = ss;
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x30;
    }
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
        PlayerOwner().ConsoleCommand("START" @ Tutorials[Sender.Tag].Map $ "?quickstart=true?TeamScreen=false?NumBots=0?savegame=" $ GP.PackageName);
    }
    // End:0x16f
    else
    {
        PlayerOwner().ConsoleCommand("START" @ Tutorials[Sender.Tag].Map $ "?quickstart=true?TeamScreen=false?NumBots=0");
    }
    MainWindow.bAllowedAsLast = true;
    Controller.CloseAll(false, true);
    return true;
}

static function unlockButton(string Tag)
{
    // End:0x21
    if(Tag ~= "TDM")
    {
        default.Tutorials[0].unLocked = true;
    }
    // End:0x82
    else
    {
        // End:0x42
        if(Tag ~= "CTF")
        {
            default.Tutorials[1].unLocked = true;
        }
        // End:0x82
        else
        {
            // End:0x64
            if(Tag ~= "DOM")
            {
                default.Tutorials[2].unLocked = true;
            }
            // End:0x82
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
}

defaultproperties
{
    Tutorials=// Object reference not set to an instance of an object.
    
    StartTutorial="?? ?? ??? ????? ??? ?? ??? ??????."
    PanelCaption="????"
}