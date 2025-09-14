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
    //return;    
}

function ShowPanel(bool bShow)
{
    local int i;

    super.ShowPanel(bShow);
    // End:0xB0
    if(bShow)
    {
        // End:0x7E
        if(bInit)
        {
            bInit = false;
            animEntries = InitAnimData(Entries);
            InitAnimLabels();
            i = 0;
            J0x44:

            // End:0x7E [Loop If]
            if(i < Entries.Length)
            {
                Entries[i].SetState(GetLadderProgress(LadderId));
                i++;
                // [Loop Continue]
                goto J0x44;
            }
        }
        selectNextMatch();
        // End:0xA5
        if(!bHasAnimated)
        {
            DoAnimate(Entries, animEntries);
            AnimateLabels();
        }
        bHasAnimated = true;        
    }
    else
    {
        DoAnimate(Entries, animEntries, true);
        AnimateLabels(true);
        bHasAnimated = false;
    }
    //return;    
}

function CreateLabels()
{
    local int i;
    local export editinline GUILabel lbl;

    Labels.Length = Entries.Length;
    i = 0;
    J0x14:

    // End:0x1F4 [Loop If]
    if(i < Entries.Length)
    {
        lbl = new Class'XInterface.GUILabel';
        lbl.WinLeft = (Entries[i].WinLeft + Entries[i].WinWidth) * 1.0500000;
        lbl.WinTop = Entries[i].WinTop;
        lbl.WinHeight = Entries[i].WinHeight * 0.9500000;
        lbl.WinWidth = ((WinWidth / float(2)) - lbl.WinLeft) - LadderLeft;
        lbl.FontScale = 1;
        lbl.ShadowColor.A = 128;
        lbl.ShadowOffsetX = 1.0000000;
        lbl.ShadowOffsetY = 1.0000000;
        lbl.StyleName = "NoBackground";
        lbl.bMultiLine = true;
        lbl.bBoundToParent = true;
        lbl.VertAlign = 1;
        // End:0x1BD
        if(i < EntryLabels.Length)
        {
            lbl.Caption = EntryLabels[i];            
        }
        else
        {
            lbl.Caption = "";
        }
        AppendComponent(lbl);
        Labels[i] = lbl;
        i++;
        // [Loop Continue]
        goto J0x14;
    }
    //return;    
}

function selectNextMatch()
{
    local int offset;

    offset = Min(GetLadderProgress(LadderId), Entries.Length - 1);
    // End:0x3B
    if((offset >= Entries.Length) || offset < 0)
    {
        return;
    }
    J0x3B:

    // End:0x99 [Loop If]
    if(offset >= 0)
    {
        // End:0x8F
        if(GP.getMinimalEntryFeeFor(Entries[offset].MatchInfo) <= GP.Balance)
        {
            onMatchClick(Entries[offset]);
            return;
        }
        offset--;
        // [Loop Continue]
        goto J0x3B;
    }
    //return;    
}

function AnimateLabels(optional bool bReset)
{
    local int i;

    i = 0;
    J0x07:

    // End:0xAA [Loop If]
    if(i < Labels.Length)
    {
        // End:0x53
        if(bReset)
        {
            Labels[i].WinLeft = 0.0000000 - Labels[i].WinWidth;
            // [Explicit Continue]
            goto J0xA0;
        }
        Labels[i].Animate(animLabels[i].X, animLabels[i].Y, AnimTime * (float(i) / float(Labels.Length)));
        J0xA0:

        i++;
        // [Loop Continue]
        goto J0x07;
    }
    //return;    
}

function InitAnimLabels()
{
    local int i;

    animLabels.Length = Labels.Length;
    i = 0;
    J0x14:

    // End:0x78 [Loop If]
    if(i < Labels.Length)
    {
        animLabels[i].X = Labels[i].WinLeft;
        animLabels[i].Y = Labels[i].WinTop;
        i++;
        // [Loop Continue]
        goto J0x14;
    }
    AnimateLabels(true);
    //return;    
}

defaultproperties
{
    LadderId=-1
    LadderTop=0.0500000
    LadderLeft=0.0500000
    LadderHeight=0.8000000
}