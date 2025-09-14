/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path GUI2K4\Classes\TeamSymbolConfig.uc
 * Package Imports:
 *	GUI2K4
 *	XInterface
 *	Core
 *
 * Stats:
 *	Properties:12
 *	Functions:9
 *
 *******************************************************************************/
class TeamSymbolConfig extends LockedFloatingWindow
    editinlinenew
    instanced;

var() /*0x00000000-0x80000000*/ databinding export editinlinenotify GUIImage i_RedPreview;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify GUIImage i_BluePreview;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify GUISectionBackground sb_Bk2;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify AltSectionBackground sb_Bk3;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify GUIVertImageListBox lb_Symbols;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify GUIHorzScrollButton b_AddRed;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify GUIHorzScrollButton b_AddBlue;
var export editinline GUIVertImageList li_Sym;
var Material InitialRed;
var Material InitialBlue;
var localized string ResetString;
var localized string RedString;

function InitComponent(GUIController MyController, GUIComponent myOwner)
{
    local array<string> TeamSymbols;
    local Material M;
    local int i;

    super.InitComponent(MyController, myOwner);
    Controller.GetTeamSymbolList(TeamSymbols, false);
    li_Sym = lb_Symbols.List;
    li_Sym.bDropSource = true;
    li_Sym.__OnEndDrag__Delegate = EndSymbolDrag;
    i = 0;
    J0x65:
    // End:0xbf [While If]
    if(i < TeamSymbols.Length)
    {
        M = Material(DynamicLoadObject(TeamSymbols[i], class'Material'));
        // End:0xb5
        if(M != none)
        {
            lb_Symbols.AddImage(M);
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x65;
    }
    b_OK.SetPosition(0.7898290, 0.880, 0.1596490, 0.050);
    b_Cancel.SetPosition(0.5990110, 0.880, 0.1596490, 0.050);
    sb_Main.SetPosition(0.6510780, 0.0503170, 0.2647690, 0.3132030);
    sb_Main.ManageComponent(i_RedPreview);
    sb_Main.Caption = RedString;
    sb_Main.bFillClient = true;
    sb_Bk2.ManageComponent(i_BluePreview);
    sb_Bk3.ManageComponent(lb_Symbols);
    b_Cancel.Caption = ResetString;
    b_Cancel.__OnClick__Delegate = ResetClick;
}

function HandleParameters(string RedSymbol, string BlueSymbol)
{
    local int i;
    local Material M;
    local bool GotRed, GotBlue;

    // End:0x14
    if(RedSymbol == "")
    {
        GotRed = true;
    }
    // End:0x28
    if(BlueSymbol == "")
    {
        GotBlue = true;
    }
    J0x28:
    // End:0x100 [While If]
    if(i < li_Sym.ItemCount && !GotRed && GotBlue)
    {
        M = li_Sym.GetImageAtIndex(i);
        // End:0xb4
        if(!GotRed && string(M) ~= RedSymbol)
        {
            InitialRed = M;
            GotRed = true;
            // End:0xb4
            if(SetRedImage(M))
            {
            }
            // End:0xfd
            else
            {
            }
            // End:0xf6
            if(!GotBlue && string(M) ~= BlueSymbol)
            {
                InitialBlue = M;
                GotBlue = true;
                // End:0xf6
                if(SetBlueImage(M))
                {
                }
                // End:0xfd
                else
                {
                }
                ++ i;
            }
        }
        // This is an implied JumpToken; Continue!
        goto J0x28;
    }
}

function bool ResetClick(GUIComponent Sender)
{
    // End:0x25
    if(Sender == b_Cancel)
    {
        SetRedImage(InitialRed);
        SetBlueImage(InitialBlue);
    }
    return true;
}

function EndSymbolDrag(GUIComponent Accepting, bool bAccepted)
{
    local int i;
    local array<ImageListElem> Pending;

    // End:0xaa
    if(bAccepted && Accepting != none)
    {
        Pending = li_Sym.GetPendingElements();
        i = 0;
        J0x32:
        // End:0x99 [While If]
        if(i < Pending.Length)
        {
            // End:0x6a
            if(Accepting == i_RedPreview)
            {
                SetRedImage(Pending[i].Image);
            }
            // End:0x8f
            else
            {
                // End:0x8f
                if(Accepting == i_BluePreview)
                {
                    SetBlueImage(Pending[i].Image);
                }
            }
            ++ i;
            // This is an implied JumpToken; Continue!
            goto J0x32;
        }
        li_Sym.bRepeatClick = false;
    }
    // End:0xc6
    if(Accepting == none)
    {
        li_Sym.bRepeatClick = true;
    }
    li_Sym.SetOutlineAlpha(255);
    // End:0x101
    if(li_Sym.bNotify)
    {
        li_Sym.CheckLinkedObjects(li_Sym);
    }
}

function bool DragDropped(GUIComponent Sender)
{
    local Material mat;

    mat = li_Sym.Get();
    return mat != none && mat != GUIImage(Sender).Image;
}

function bool SetRedImage(Material mat)
{
    local int i;
    local bool bResult;

    // End:0x80
    if(mat == none)
    {
        // End:0x6e
        if(i_RedPreview.Image != none)
        {
            i = li_Sym.FindImage(i_RedPreview.Image);
            // End:0x6e
            if(i == -1)
            {
                li_Sym.Add(i_RedPreview.Image);
            }
        }
        i_RedPreview.Image = none;
        return false;
    }
    i = li_Sym.FindImage(mat);
    // End:0x12c
    if(i != -1)
    {
        // End:0xfc
        if(i_RedPreview.Image != none && i_RedPreview.Image != mat)
        {
            li_Sym.Replace(i, i_RedPreview.Image);
        }
        // End:0x118
        else
        {
            li_Sym.Remove(i);
            bResult = true;
        }
        i_RedPreview.Image = mat;
    }
    return bResult;
}

function bool SetBlueImage(Material mat)
{
    local int i;
    local bool bResult;

    // End:0x80
    if(mat == none)
    {
        // End:0x6e
        if(i_BluePreview.Image != none)
        {
            i = li_Sym.FindImage(i_BluePreview.Image);
            // End:0x6e
            if(i == -1)
            {
                li_Sym.Add(i_BluePreview.Image);
            }
        }
        i_BluePreview.Image = none;
        return false;
    }
    i = li_Sym.FindImage(mat);
    // End:0x12c
    if(i != -1)
    {
        // End:0xfc
        if(i_BluePreview.Image != none && i_BluePreview.Image != mat)
        {
            li_Sym.Replace(i, i_BluePreview.Image);
        }
        // End:0x118
        else
        {
            li_Sym.Remove(i);
            bResult = true;
        }
        i_BluePreview.Image = mat;
    }
    return bResult;
}

function bool AddOnPredraw(Canvas C)
{
    b_AddRed.WinLeft = sb_Main.WinLeft - b_AddRed.WinWidth;
    b_AddRed.WinLeft = sb_Bk2.WinLeft - b_AddRed.WinWidth;
    return false;
}

function bool butClick(GUIComponent Sender)
{
    local Material M;

    M = li_Sym.Get();
    // End:0x57
    if(M != none)
    {
        // End:0x3d
        if(Sender == b_AddRed)
        {
            SetRedImage(M);
        }
        // End:0x57
        else
        {
            // End:0x57
            if(Sender == b_AddBlue)
            {
                SetBlueImage(M);
            }
        }
    }
    return true;
}

defaultproperties
{
    begin object name=RedPreview class=GUIImage
        ImageColor=(R=245,G=0,B=0,A=255)
        ImageStyle=2
        DropShadowY=-1
        WinTop=0.1480050
        WinLeft=0.1055020
        WinWidth=0.2401190
        WinHeight=0.4074970
        bBoundToParent=true
        bScaleToParent=true
        bAcceptsInput=true
        bDropTarget=true
        OnDragDrop=DragDropped
    object end
    // Reference: GUIImage'TeamSymbolConfig.RedPreview'
    i_RedPreview=RedPreview
    begin object name=BluePreview class=GUIImage
        ImageColor=(R=0,G=0,B=245,A=255)
        ImageStyle=2
        DropShadowY=-1
        WinTop=0.1528730
        WinLeft=0.6531490
        WinWidth=0.2401190
        WinHeight=0.4001950
        bBoundToParent=true
        bScaleToParent=true
        bAcceptsInput=true
        bDropTarget=true
        OnDragDrop=DragDropped
    object end
    // Reference: GUIImage'TeamSymbolConfig.BluePreview'
    i_BluePreview=BluePreview
    begin object name=back2 class=GUISectionBackground
        bFillClient=true
        Caption="??"
        WinTop=0.4721920
        WinLeft=0.6510780
        WinWidth=0.2647690
        WinHeight=0.3132030
        OnPreDraw=InternalPreDraw
    object end
    // Reference: GUISectionBackground'TeamSymbolConfig.back2'
    sb_Bk2=back2
    begin object name=back3 class=AltSectionBackground
        bFillClient=true
        Caption="?? ??? ? ??"
        LeftPadding=0.0
        RightPadding=0.0
        WinTop=0.0503170
        WinLeft=0.030960
        WinWidth=0.4942610
        WinHeight=0.6989450
        OnPreDraw=InternalPreDraw
    object end
    // Reference: AltSectionBackground'TeamSymbolConfig.back3'
    sb_Bk3=back3
    begin object name=SymbList class=GUIVertImageListBox
        CellStyle=1
        NoVisibleRows=5
        NoVisibleCols=5
        OnCreateComponent=InternalOnCreateComponent
        WinTop=0.4721920
        WinLeft=0.6510780
        WinWidth=0.2647690
        WinHeight=0.3132030
    object end
    // Reference: GUIVertImageListBox'TeamSymbolConfig.SymbList'
    lb_Symbols=SymbList
    begin object name=bAddRed class=GUIHorzScrollButton
        bIncreaseButton=true
        StyleName="AltComboButton"
        WinTop=0.20
        WinLeft=0.6199220
        WinWidth=0.0339840
        WinHeight=0.043750
        OnPreDraw=AddOnPredraw
        OnClick=butClick
        OnKeyEvent=InternalOnKeyEvent
    object end
    // Reference: GUIHorzScrollButton'TeamSymbolConfig.bAddRed'
    b_AddRed=bAddRed
    begin object name=bAddBlue class=GUIHorzScrollButton
        bIncreaseButton=true
        StyleName="AltComboButton"
        WinTop=0.6348960
        WinLeft=0.6150390
        WinWidth=0.0339840
        WinHeight=0.043750
        OnClick=butClick
        OnKeyEvent=InternalOnKeyEvent
    object end
    // Reference: GUIHorzScrollButton'TeamSymbolConfig.bAddBlue'
    b_AddBlue=bAddBlue
    ResetString="???"
    RedString="??"
    WindowName="? ?? ??"
    WinTop=0.0919270
    WinLeft=0.0556640
    WinWidth=0.8857420
    WinHeight=0.8023440
}