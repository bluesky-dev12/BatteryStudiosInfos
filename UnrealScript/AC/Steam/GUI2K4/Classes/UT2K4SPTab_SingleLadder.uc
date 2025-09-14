/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path GUI2K4\Classes\UT2K4SPTab_SingleLadder.uc
 * Package Imports:
 *	GUI2K4
 *	XInterface
 *	Core
 *
 * Stats:
 *	Properties:10
 *	Functions:6
 *
 *******************************************************************************/
class UT2K4SPTab_SingleLadder extends UT2K4SPTab_LadderBase
    editinlinenew
    instanced;

var int LadderId;
var float LadderTop;
var float LadderLeft;
var float LadderHeight;
var array<export editinline UT2K4LadderButton> Entries;
var array<export editinline GUILabel> Labels;
var array<AnimData> animEntries;
var array<AnimData> animLabels;
var localized array<localized string> EntryLabels;
var bool bHasAnimated;

function InitComponent(GUIController pMyController, GUIComponent myOwner)
{
    super(UT2K4SPTab_Base).InitComponent(pMyController, myOwner);
    Entries = CreateVButtons(LadderId, LadderTop, LadderLeft, LadderHeight);
    CreateLabels();
    bInit = true;
}

function ShowPanel(bool bShow)
{
    local int i;

    super.ShowPanel(bShow);
    // End:0xb0
    if(bShow)
    {
        // End:0x7e
        if(bInit)
        {
            bInit = false;
            animEntries = InitAnimData(Entries);
            InitAnimLabels();
            i = 0;
            J0x44:
            // End:0x7e [While If]
            if(i < Entries.Length)
            {
                Entries[i].SetState(GetLadderProgress(LadderId));
                ++ i;
                // This is an implied JumpToken; Continue!
                goto J0x44;
            }
        }
        selectNextMatch();
        // End:0xa5
        if(!bHasAnimated)
        {
            DoAnimate(Entries, animEntries);
            AnimateLabels();
        }
        bHasAnimated = true;
    }
    // End:0xd0
    else
    {
        DoAnimate(Entries, animEntries, true);
        AnimateLabels(true);
        bHasAnimated = false;
    }
}

function CreateLabels()
{
    local int i;
    local export editinline GUILabel lbl;

    Labels.Length = Entries.Length;
    i = 0;
    J0x14:
    // End:0x1f4 [While If]
    if(i < Entries.Length)
    {
        lbl = new class'GUILabel';
        lbl.WinLeft = Entries[i].WinLeft + Entries[i].WinWidth * 1.050;
        lbl.WinTop = Entries[i].WinTop;
        lbl.WinHeight = Entries[i].WinHeight * 0.950;
        lbl.WinWidth = WinWidth / float(2) - lbl.WinLeft - LadderLeft;
        lbl.FontScale = 1;
        lbl.ShadowColor.A = 128;
        lbl.ShadowOffsetX = 1.0;
        lbl.ShadowOffsetY = 1.0;
        lbl.StyleName = "NoBackground";
        lbl.bMultiLine = true;
        lbl.bBoundToParent = true;
        lbl.VertAlign = 1;
        // End:0x1bd
        if(i < EntryLabels.Length)
        {
            lbl.Caption = EntryLabels[i];
        }
        // End:0x1ce
        else
        {
            lbl.Caption = "";
        }
        AppendComponent(lbl);
        Labels[i] = lbl;
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x14;
    }
}

function selectNextMatch()
{
    local int offset;

    offset = Min(GetLadderProgress(LadderId), Entries.Length - 1);
    // End:0x3b
    if(offset >= Entries.Length || offset < 0)
    {
        return;
    }
    J0x3b:
    // End:0x99 [While If]
    if(offset >= 0)
    {
        // End:0x8f
        if(GP.getMinimalEntryFeeFor(Entries[offset].MatchInfo) <= GP.Balance)
        {
            onMatchClick(Entries[offset]);
            return;
        }
        -- offset;
        // This is an implied JumpToken; Continue!
        goto J0x3b;
    }
}

function AnimateLabels(optional bool bReset)
{
    local int i;

    i = 0;
    J0x07:
    // End:0xaa [While If]
    if(i < Labels.Length)
    {
        // End:0x53
        if(bReset)
        {
            Labels[i].WinLeft = 0.0 - Labels[i].WinWidth;
        }
        // End:0xa0
        else
        {
            Labels[i].Animate(animLabels[i].X, animLabels[i].Y, AnimTime * float(i) / float(Labels.Length));
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x07;
    }
}

function InitAnimLabels()
{
    local int i;

    animLabels.Length = Labels.Length;
    i = 0;
    J0x14:
    // End:0x78 [While If]
    if(i < Labels.Length)
    {
        animLabels[i].X = Labels[i].WinLeft;
        animLabels[i].Y = Labels[i].WinTop;
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x14;
    }
    AnimateLabels(true);
}

defaultproperties
{
    LadderId=-1
    LadderTop=0.050
    LadderLeft=0.050
    LadderHeight=0.80
}