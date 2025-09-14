class TeamSymbolConfig extends LockedFloatingWindow
    editinlinenew
    instanced;

var() automated GUIImage i_RedPreview;
var() automated GUIImage i_BluePreview;
var() automated GUISectionBackground sb_Bk2;
var() automated AltSectionBackground sb_Bk3;
var() automated GUIVertImageListBox lb_Symbols;
var() automated GUIHorzScrollButton b_AddRed;
var() automated GUIHorzScrollButton b_AddBlue;
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

    // End:0xBF [Loop If]
    if(i < TeamSymbols.Length)
    {
        M = Material(DynamicLoadObject(TeamSymbols[i], Class'Engine.Material'));
        // End:0xB5
        if(M != none)
        {
            lb_Symbols.AddImage(M);
        }
        i++;
        // [Loop Continue]
        goto J0x65;
    }
    b_OK.SetPosition(0.7898290, 0.8800000, 0.1596490, 0.0500000);
    b_Cancel.SetPosition(0.5990110, 0.8800000, 0.1596490, 0.0500000);
    sb_Main.SetPosition(0.6510780, 0.0503170, 0.2647690, 0.3132030);
    sb_Main.ManageComponent(i_RedPreview);
    sb_Main.Caption = RedString;
    sb_Main.bFillClient = true;
    sb_Bk2.ManageComponent(i_BluePreview);
    sb_Bk3.ManageComponent(lb_Symbols);
    b_Cancel.Caption = ResetString;
    b_Cancel.__OnClick__Delegate = ResetClick;
    //return;    
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

    // End:0x100 [Loop If]
    if((i < li_Sym.ItemCount) && !GotRed && GotBlue)
    {
        M = li_Sym.GetImageAtIndex(i);
        // End:0xB4
        if(!GotRed && string(M) ~= RedSymbol)
        {
            InitialRed = M;
            GotRed = true;
            // End:0xB4
            if(SetRedImage(M))
            {
                // [Explicit Continue]
                goto J0xFD;
            }
        }
        // End:0xF6
        if(!GotBlue && string(M) ~= BlueSymbol)
        {
            InitialBlue = M;
            GotBlue = true;
            // End:0xF6
            if(SetBlueImage(M))
            {
                // [Explicit Continue]
                goto J0xFD;
            }
        }
        i++;
        J0xFD:

        // [Loop Continue]
        goto J0x28;
    }
    //return;    
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
    //return;    
}

function EndSymbolDrag(GUIComponent Accepting, bool bAccepted)
{
    local int i;
    local array<ImageListElem> Pending;

    // End:0xAA
    if(bAccepted && Accepting != none)
    {
        Pending = li_Sym.GetPendingElements();
        i = 0;
        J0x32:

        // End:0x99 [Loop If]
        if(i < Pending.Length)
        {
            // End:0x6A
            if(Accepting == i_RedPreview)
            {
                SetRedImage(Pending[i].Image);
                // [Explicit Continue]
                goto J0x8F;
            }
            // End:0x8F
            if(Accepting == i_BluePreview)
            {
                SetBlueImage(Pending[i].Image);
            }
            J0x8F:

            i++;
            // [Loop Continue]
            goto J0x32;
        }
        li_Sym.bRepeatClick = false;
    }
    // End:0xC6
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
    //return;    
}

function bool DragDropped(GUIComponent Sender)
{
    local Material mat;

    mat = li_Sym.Get();
    return (mat != none) && mat != GUIImage(Sender).Image;
    //return;    
}

function bool SetRedImage(Material mat)
{
    local int i;
    local bool bResult;

    // End:0x80
    if(mat == none)
    {
        // End:0x6E
        if(i_RedPreview.Image != none)
        {
            i = li_Sym.FindImage(i_RedPreview.Image);
            // End:0x6E
            if(i == -1)
            {
                li_Sym.Add(i_RedPreview.Image);
            }
        }
        i_RedPreview.Image = none;
        return false;
    }
    i = li_Sym.FindImage(mat);
    // End:0x12C
    if(i != -1)
    {
        // End:0xFC
        if((i_RedPreview.Image != none) && i_RedPreview.Image != mat)
        {
            li_Sym.Replace(i, i_RedPreview.Image);            
        }
        else
        {
            li_Sym.Remove(i);
            bResult = true;
        }
        i_RedPreview.Image = mat;
    }
    return bResult;
    //return;    
}

function bool SetBlueImage(Material mat)
{
    local int i;
    local bool bResult;

    // End:0x80
    if(mat == none)
    {
        // End:0x6E
        if(i_BluePreview.Image != none)
        {
            i = li_Sym.FindImage(i_BluePreview.Image);
            // End:0x6E
            if(i == -1)
            {
                li_Sym.Add(i_BluePreview.Image);
            }
        }
        i_BluePreview.Image = none;
        return false;
    }
    i = li_Sym.FindImage(mat);
    // End:0x12C
    if(i != -1)
    {
        // End:0xFC
        if((i_BluePreview.Image != none) && i_BluePreview.Image != mat)
        {
            li_Sym.Replace(i, i_BluePreview.Image);            
        }
        else
        {
            li_Sym.Remove(i);
            bResult = true;
        }
        i_BluePreview.Image = mat;
    }
    return bResult;
    //return;    
}

function bool AddOnPredraw(Canvas C)
{
    b_AddRed.WinLeft = sb_Main.WinLeft - b_AddRed.WinWidth;
    b_AddRed.WinLeft = sb_Bk2.WinLeft - b_AddRed.WinWidth;
    return false;
    //return;    
}

function bool butClick(GUIComponent Sender)
{
    local Material M;

    M = li_Sym.Get();
    // End:0x57
    if(M != none)
    {
        // End:0x3D
        if(Sender == b_AddRed)
        {
            SetRedImage(M);            
        }
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
    //return;    
}

defaultproperties
{
    // Reference: GUIImage'GUI2K4_Decompressed.TeamSymbolConfig.RedPreview'
    begin object name="RedPreview" class=XInterface.GUIImage
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
        OnDragDrop=TeamSymbolConfig.DragDropped
    end object
    i_RedPreview=RedPreview
    // Reference: GUIImage'GUI2K4_Decompressed.TeamSymbolConfig.BluePreview'
    begin object name="BluePreview" class=XInterface.GUIImage
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
        OnDragDrop=TeamSymbolConfig.DragDropped
    end object
    i_BluePreview=BluePreview
    // Reference: GUISectionBackground'GUI2K4_Decompressed.TeamSymbolConfig.back2'
    begin object name="back2" class=XInterface.GUISectionBackground
        bFillClient=true
        Caption="??"
        WinTop=0.4721920
        WinLeft=0.6510780
        WinWidth=0.2647690
        WinHeight=0.3132030
        OnPreDraw=back2.InternalPreDraw
    end object
    sb_Bk2=back2
    // Reference: AltSectionBackground'GUI2K4_Decompressed.TeamSymbolConfig.back3'
    begin object name="back3" class=GUI2K4_Decompressed.AltSectionBackground
        bFillClient=true
        Caption="?? ??? ? ??"
        LeftPadding=0.0000000
        RightPadding=0.0000000
        WinTop=0.0503170
        WinLeft=0.0309600
        WinWidth=0.4942610
        WinHeight=0.6989450
        OnPreDraw=back3.InternalPreDraw
    end object
    sb_Bk3=back3
    // Reference: GUIVertImageListBox'GUI2K4_Decompressed.TeamSymbolConfig.SymbList'
    begin object name="SymbList" class=XInterface.GUIVertImageListBox
        CellStyle=1
        NoVisibleRows=5
        NoVisibleCols=5
        OnCreateComponent=SymbList.InternalOnCreateComponent
        WinTop=0.4721920
        WinLeft=0.6510780
        WinWidth=0.2647690
        WinHeight=0.3132030
    end object
    lb_Symbols=SymbList
    // Reference: GUIHorzScrollButton'GUI2K4_Decompressed.TeamSymbolConfig.bAddRed'
    begin object name="bAddRed" class=XInterface.GUIHorzScrollButton
        bIncreaseButton=true
        StyleName="AltComboButton"
        WinTop=0.2000000
        WinLeft=0.6199220
        WinWidth=0.0339840
        WinHeight=0.0437500
        OnPreDraw=TeamSymbolConfig.AddOnPredraw
        OnClick=TeamSymbolConfig.butClick
        OnKeyEvent=bAddRed.InternalOnKeyEvent
    end object
    b_AddRed=bAddRed
    // Reference: GUIHorzScrollButton'GUI2K4_Decompressed.TeamSymbolConfig.bAddBlue'
    begin object name="bAddBlue" class=XInterface.GUIHorzScrollButton
        bIncreaseButton=true
        StyleName="AltComboButton"
        WinTop=0.6348960
        WinLeft=0.6150390
        WinWidth=0.0339840
        WinHeight=0.0437500
        OnClick=TeamSymbolConfig.butClick
        OnKeyEvent=bAddBlue.InternalOnKeyEvent
    end object
    b_AddBlue=bAddBlue
    ResetString="???"
    RedString="??"
    WindowName="? ?? ??"
    WinTop=0.0919270
    WinLeft=0.0556640
    WinWidth=0.8857420
    WinHeight=0.8023440
}