/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path GUI2K4\Classes\DirectoryTreeList.uc
 * Package Imports:
 *	GUI2K4
 *	XInterface
 *	Core
 *
 * Stats:
 *	Properties:4
 *	Functions:29
 *
 *******************************************************************************/
class DirectoryTreeList extends GUIVertList
    config(User)
    editinlinenew
    instanced;

var() editconst StreamInterface FileManager;
var() editconst StreamDirectoryNode root;
var() editconst StreamDirectoryNode Current;
var() config bool bSimpleFileBrowsing;

function InitComponent(GUIController MyController, GUIComponent myOwner)
{
    super(GUIListBase).InitComponent(MyController, myOwner);
    CreateRoot();
    SetCurrent(root);
}

function CreateRoot()
{
    // End:0x0d
    if(root != none)
    {
        return;
    }
    root = new (self) class'StreamDirectoryNode';
    root.SetName("root");
    root.InitializeNode();
}

function SetCurrent(StreamDirectoryNode Node)
{
    local string Path;

    // End:0x16
    if(Node == none)
    {
        Node = root;
    }
    Current = Node;
    Path = Current.GetPath();
    // End:0x4b
    if(Path == "")
    {
        Path = "*";
    }
    // End:0x6a
    if(FileManager != none)
    {
        FileManager.ChangeDirectory(Path);
    }
}

function bool InternalOnClick(GUIComponent Sender)
{
    return super.InternalOnClick(Sender);
}

function InternalOnDrawItem(Canvas C, int Item, float X, float Y, float XL, float YL, bool bIsSelected, bool bIsPending)
{
    local string Text;
    local bool bIsDrop;

    Text = VisibleNodeText(Item);
    bIsDrop = Top + Item == DropIndex;
    // End:0x1d7
    if(bIsSelected || bIsPending && !bIsDrop)
    {
        // End:0xfc
        if(SelectedStyle != none)
        {
            // End:0xa3
            if(SelectedStyle.Images[MenuState] != none)
            {
                SelectedStyle.Draw(C, MenuState, X, Y, XL, YL);
            }
            // End:0xf9
            else
            {
                C.SetPos(X, Y);
                C.DrawTile(Controller.DefaultPens[0], XL, YL, 0.0, 0.0, 32.0, 32.0);
            }
        }
        // End:0x1d7
        else
        {
            // End:0x1d7
            if(MenuState == 2 || MenuState == 3)
            {
                C.SetPos(X, Y);
                // End:0x182
                if(SelectedImage == none)
                {
                    C.DrawTile(Controller.DefaultPens[0], XL, YL, 0.0, 0.0, 32.0, 32.0);
                }
                // End:0x1d7
                else
                {
                    C.SetDrawColor(SelectedBKColor.R, SelectedBKColor.G, SelectedBKColor.B, SelectedBKColor.A);
                    C.DrawTileStretched(SelectedImage, XL, YL);
                }
            }
        }
    }
    // End:0x302
    if(bIsPending && OutlineStyle != none)
    {
        // End:0x302
        if(OutlineStyle.Images[MenuState] != none)
        {
            // End:0x258
            if(bIsDrop)
            {
                OutlineStyle.Draw(C, MenuState, X + float(1), Y + float(1), XL - float(2), YL - float(2));
            }
            // End:0x302
            else
            {
                OutlineStyle.Draw(C, MenuState, X, Y, XL, YL);
                // End:0x302
                if(DropState == 1)
                {
                    OutlineStyle.Draw(C, MenuState, Controller.MouseX - MouseOffset[0], Controller.MouseY - MouseOffset[1] + Y - ClientBounds[1], MouseOffset[2] + MouseOffset[0], ItemHeight);
                }
            }
        }
    }
    // End:0x354
    if(bIsSelected && SelectedStyle != none)
    {
        SelectedStyle.DrawText(C, MenuState, X, Y, XL, YL, 0, Text, FontScale);
    }
    // End:0x38d
    else
    {
        Style.DrawText(C, MenuState, X, Y, XL, YL, 0, Text, FontScale);
    }
}

function int FindVisibleItemIndex(string Path)
{
    return Current.FindVisibleNodeIndex(Path);
}

function string Get(optional bool bFullPath)
{
    local string Path, File;

    // End:0x93
    if(IsValid())
    {
        // End:0x7d
        if(bFullPath)
        {
            File = Current.NodeText(Index, true);
            Path = Current.GetPath();
            // End:0x70
            if(Path == "" || File == "." || File == "..")
            {
                return "";
            }
            return Path $ File;
        }
        return Current.NodeText(Index, true);
    }
    return "";
}

function array<string> GetPendingItems(optional bool bGuarantee)
{
    local int i;
    local array<string> items;
    local string str;

    // End:0xdc
    if(DropState == 1 && Controller.DropSource == self || bGuarantee)
    {
        i = 0;
        J0x38:
        // End:0x9b [While If]
        if(i < SelectedItems.Length)
        {
            // End:0x91
            if(IsValidIndex(SelectedItems[i]))
            {
                str = GetItemAtIndex(SelectedItems[i]);
                // End:0x91
                if(str != "")
                {
                    items[items.Length] = str;
                }
            }
            ++ i;
            // This is an implied JumpToken; Continue!
            goto J0x38;
        }
        // End:0xdc
        if(items.Length == 0 && IsValid())
        {
            str = GetItemAtIndex(Index);
            // End:0xdc
            if(str != "")
            {
                items[0] = str;
            }
        }
    }
    return items;
}

function string GetItemAtIndex(int idx)
{
    local string Path, File;
    local StreamDirectoryNode Node;

    // End:0xaa
    if(IsValidIndex(idx))
    {
        Node = VisibleNode(idx);
        File = Node.NodeText(idx, true);
        Path = Node.GetPath();
        // End:0x7d
        if(Path == "" || File == "." || File == "..")
        {
            return "";
        }
        // End:0xa4
        if(class'StreamBase'.static.HasExtension(File))
        {
            return Path $ File;
        }
        // End:0xaa
        else
        {
            return Path;
        }
    }
    return "";
}

function string GetCurrentNode()
{
    return Current.GetName();
}

function string GetCurrentNodePath()
{
    return Current.GetPath();
}

function string GetPath()
{
    return GetPathAt(Index);
}

function string GetPathAt(int idx)
{
    local StreamDirectoryNode Node;

    // End:0x3a
    if(IsValidIndex(idx))
    {
        Node = VisibleNode(idx);
        // End:0x3a
        if(Node != none)
        {
            return Node.GetPath();
        }
    }
    return "";
}

function bool ChDir(string Path)
{
    local StreamDirectoryNode Node;

    // End:0x60
    if(Current.ChangeDirectory(Path, Node) || root.ChangeDirectory(Path, Node, true))
    {
        SetCurrent(Node);
        UpdateItemCount();
        SetTopItem(0);
        SetIndex(-1);
        return true;
    }
    return false;
}

function bool ExpandNode(string Path)
{
    local StreamDirectoryNode Node;

    // End:0x0e
    if(Path == "")
    {
        return false;
    }
    Node = FindNode(Path);
    // End:0x42
    if(Node != none)
    {
        Node.Toggle();
        UpdateItemCount(true);
        return true;
    }
    Log("ExpandNode() Error: node not found '" $ Path $ "'", 'MusicPlayer');
    return false;
}

private function StreamDirectoryNode VisibleNode(int VisibleItemIndex)
{
    return Current.FindVisibleNode(VisibleItemIndex);
}

private function string VisibleNodeText(int VisibleItemIndex)
{
    return Current.NodeText(VisibleItemIndex);
}

function UpdateItemCount(optional bool bFullUpdate)
{
    Current.UpdateCost(bFullUpdate);
    ItemCount = Current.cost();
}

function bool AddNode(StreamDirectoryNode Parent, string InName, optional bool bIsFile)
{
    // End:0x3c
    if(Parent == none)
    {
        // End:0x31
        if(Right(InName, 1) != ":" && Right(InName, 2) != ":\\")
        {
            return false;
        }
        Parent = root;
    }
    // End:0x5a
    if(bIsFile)
    {
        return Parent.AddContent(InName);
    }
    return Parent.AddChild(InName) != none;
}

function bool RemoveNode(StreamDirectoryNode Parent, StreamDirectoryNode Child)
{
    // End:0x16
    if(Parent == none)
    {
        Parent = root;
    }
    return Parent.RemoveChild(Child);
}

function bool RemoveFile(StreamDirectoryNode Parent, string InFileName)
{
    // End:0x16
    if(Parent == none)
    {
        Parent = root;
    }
    return Parent.RemoveContent(InFileName);
}

function StreamDirectoryNode FindNode(string Path)
{
    return root.FindChildByPath(Path);
}

function MakeVisible(float perc)
{
    UpdateItemCount();
    SetTopItem(int(float(ItemCount - ItemsPerPage) * perc));
}

function SetTopItem(int Item)
{
    super(GUIListBase).SetTopItem(Item);
}

function bool IsValid()
{
    UpdateItemCount();
    return super(GUIListBase).IsValid();
}

function bool IsValidIndex(int i)
{
    UpdateItemCount();
    return super(GUIListBase).IsValidIndex(i);
}

function Clear()
{
    root.Clear(true);
    UpdateItemCount();
    super(GUIListBase).Clear();
}

function bool HandleDebugExec(string Command, string params)
{
    switch(Command)
    {
        // End:0x35
        case "selected":
            Log("Selected item:" $ Get(), 'MusicPlayer');
            return true;
        // End:0x67
        case "selectedpath":
            Log("Selected path:" $ GetPath(), 'MusicPlayer');
            return true;
        // End:0xaf
        case "visiblenode":
            Log("Visible Node" @ params $ " '" $ VisibleNodeText(int(params)) $ "'", 'MusicPlayer');
            return true;
        // End:0xffff
        default:
            return Current.HandleDebugExec(Command, params);
    }
}

function InternalOnEndDrag(GUIComponent Accepting, bool bAccepted)
{
    // End:0x1e
    if(bAccepted && Accepting != none)
    {
        bRepeatClick = false;
    }
    // End:0x31
    if(Accepting == none)
    {
        bRepeatClick = true;
    }
    SetOutlineAlpha(255);
    // End:0x4d
    if(bNotify)
    {
        CheckLinkedObjects(self);
    }
}

defaultproperties
{
    bSimpleFileBrowsing=true
    OnDrawItem=InternalOnDrawItem
    OnEndDrag=InternalOnEndDrag
}