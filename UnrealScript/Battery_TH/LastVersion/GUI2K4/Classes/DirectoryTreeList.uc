class DirectoryTreeList extends GUIVertList
    config(User)
    editinlinenew
    instanced;

var() editconst StreamInterface FileManager;
var() editconst StreamDirectoryNode root;
var() editconst StreamDirectoryNode current;
var() config bool bSimpleFileBrowsing;

function InitComponent(GUIController MyController, GUIComponent myOwner)
{
    super(GUIListBase).InitComponent(MyController, myOwner);
    CreateRoot();
    SetCurrent(root);
    //return;    
}

function CreateRoot()
{
    // End:0x0D
    if(root != none)
    {
        return;
    }
    root = new (self) Class'GUI2K4_Decompressed.StreamDirectoryNode';
    root.SetName("root");
    root.InitializeNode();
    //return;    
}

function SetCurrent(StreamDirectoryNode Node)
{
    local string Path;

    // End:0x16
    if(Node == none)
    {
        Node = root;
    }
    current = Node;
    Path = current.GetPath();
    // End:0x4B
    if(Path == "")
    {
        Path = "*";
    }
    // End:0x6A
    if(FileManager != none)
    {
        FileManager.ChangeDirectory(Path);
    }
    //return;    
}

function bool InternalOnClick(GUIComponent Sender)
{
    return super.InternalOnClick(Sender);
    //return;    
}

function InternalOnDrawItem(Canvas C, int Item, float X, float Y, float XL, float YL, bool bIsSelected, bool bIsPending)
{
    local string Text;
    local bool bIsDrop;

    Text = VisibleNodeText(Item);
    bIsDrop = (Top + Item) == DropIndex;
    // End:0x1D7
    if(bIsSelected || bIsPending && !bIsDrop)
    {
        // End:0xFC
        if(SelectedStyle != none)
        {
            // End:0xA3
            if(SelectedStyle.Images[int(MenuState)] != none)
            {
                SelectedStyle.Draw(C, MenuState, X, Y, XL, YL);                
            }
            else
            {
                C.SetPos(X, Y);
                C.DrawTile(Controller.DefaultPens[0], XL, YL, 0.0000000, 0.0000000, 32.0000000, 32.0000000);
            }            
        }
        else
        {
            // End:0x1D7
            if((int(MenuState) == int(2)) || int(MenuState) == int(3))
            {
                C.SetPos(X, Y);
                // End:0x182
                if(SelectedImage == none)
                {
                    C.DrawTile(Controller.DefaultPens[0], XL, YL, 0.0000000, 0.0000000, 32.0000000, 32.0000000);                    
                }
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
        if(OutlineStyle.Images[int(MenuState)] != none)
        {
            // End:0x258
            if(bIsDrop)
            {
                OutlineStyle.Draw(C, MenuState, X + float(1), Y + float(1), XL - float(2), YL - float(2));                
            }
            else
            {
                OutlineStyle.Draw(C, MenuState, X, Y, XL, YL);
                // End:0x302
                if(int(DropState) == int(1))
                {
                    OutlineStyle.Draw(C, MenuState, Controller.MouseX - MouseOffset[0], ((Controller.MouseY - MouseOffset[1]) + Y) - ClientBounds[1], MouseOffset[2] + MouseOffset[0], ItemHeight);
                }
            }
        }
    }
    // End:0x354
    if(bIsSelected && SelectedStyle != none)
    {
        SelectedStyle.DrawText(C, MenuState, X, Y, XL, YL, 0, Text, FontScale);        
    }
    else
    {
        Style.DrawText(C, MenuState, X, Y, XL, YL, 0, Text, FontScale);
    }
    //return;    
}

function int FindVisibleItemIndex(string Path)
{
    return current.FindVisibleNodeIndex(Path);
    //return;    
}

function string Get(optional bool bFullPath)
{
    local string Path, File;

    // End:0x93
    if(IsValid())
    {
        // End:0x7D
        if(bFullPath)
        {
            File = current.NodeText(Index, true);
            Path = current.GetPath();
            // End:0x70
            if(((Path == "") || File == ".") || File == "..")
            {
                return "";
            }
            return Path $ File;
        }
        return current.NodeText(Index, true);
    }
    return "";
    //return;    
}

function array<string> GetPendingItems(optional bool bGuarantee)
{
    local int i;
    local array<string> items;
    local string str;

    // End:0xDC
    if(((int(DropState) == int(1)) && Controller.DropSource == self) || bGuarantee)
    {
        i = 0;
        J0x38:

        // End:0x9B [Loop If]
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
            i++;
            // [Loop Continue]
            goto J0x38;
        }
        // End:0xDC
        if((items.Length == 0) && IsValid())
        {
            str = GetItemAtIndex(Index);
            // End:0xDC
            if(str != "")
            {
                items[0] = str;
            }
        }
    }
    return items;
    //return;    
}

function string GetItemAtIndex(int idx)
{
    local string Path, File;
    local StreamDirectoryNode Node;

    // End:0xAA
    if(IsValidIndex(idx))
    {
        Node = VisibleNode(idx);
        File = Node.NodeText(idx, true);
        Path = Node.GetPath();
        // End:0x7D
        if(((Path == "") || File == ".") || File == "..")
        {
            return "";
        }
        // End:0xA4
        if(Class'Engine.StreamBase'.static.HasExtension(File))
        {
            return Path $ File;            
        }
        else
        {
            return Path;
        }
    }
    return "";
    //return;    
}

function string GetCurrentNode()
{
    return current.GetName();
    //return;    
}

function string GetCurrentNodePath()
{
    return current.GetPath();
    //return;    
}

function string GetPath()
{
    return GetPathAt(Index);
    //return;    
}

function string GetPathAt(int idx)
{
    local StreamDirectoryNode Node;

    // End:0x3A
    if(IsValidIndex(idx))
    {
        Node = VisibleNode(idx);
        // End:0x3A
        if(Node != none)
        {
            return Node.GetPath();
        }
    }
    return "";
    //return;    
}

function bool ChDir(string Path)
{
    local StreamDirectoryNode Node;

    // End:0x60
    if(current.ChangeDirectory(Path, Node) || root.ChangeDirectory(Path, Node, true))
    {
        SetCurrent(Node);
        UpdateItemCount();
        SetTopItem(0);
        SetIndex(-1);
        return true;
    }
    return false;
    //return;    
}

function bool ExpandNode(string Path)
{
    local StreamDirectoryNode Node;

    // End:0x0E
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
    Log(("ExpandNode() Error: node not found '" $ Path) $ "'", 'MusicPlayer');
    return false;
    //return;    
}

private function StreamDirectoryNode VisibleNode(int VisibleItemIndex)
{
    return current.FindVisibleNode(VisibleItemIndex);
    //return;    
}

private function string VisibleNodeText(int VisibleItemIndex)
{
    return current.NodeText(VisibleItemIndex);
    //return;    
}

function UpdateItemCount(optional bool bFullUpdate)
{
    current.UpdateCost(bFullUpdate);
    ItemCount = current.cost();
    //return;    
}

function bool AddNode(StreamDirectoryNode Parent, string InName, optional bool bIsFile)
{
    // End:0x3C
    if(Parent == none)
    {
        // End:0x31
        if((Right(InName, 1) != ":") && Right(InName, 2) != ":\\")
        {
            return false;
        }
        Parent = root;
    }
    // End:0x5A
    if(bIsFile)
    {
        return Parent.AddContent(InName);
    }
    return Parent.AddChild(InName) != none;
    //return;    
}

function bool RemoveNode(StreamDirectoryNode Parent, StreamDirectoryNode Child)
{
    // End:0x16
    if(Parent == none)
    {
        Parent = root;
    }
    return Parent.RemoveChild(Child);
    //return;    
}

function bool RemoveFile(StreamDirectoryNode Parent, string InFileName)
{
    // End:0x16
    if(Parent == none)
    {
        Parent = root;
    }
    return Parent.RemoveContent(InFileName);
    //return;    
}

function StreamDirectoryNode FindNode(string Path)
{
    return root.FindChildByPath(Path);
    //return;    
}

function MakeVisible(float perc)
{
    UpdateItemCount();
    SetTopItem(int(float(ItemCount - ItemsPerPage) * perc));
    //return;    
}

function SetTopItem(int Item)
{
    super(GUIListBase).SetTopItem(Item);
    //return;    
}

function bool IsValid()
{
    UpdateItemCount();
    return super(GUIListBase).IsValid();
    //return;    
}

function bool IsValidIndex(int i)
{
    UpdateItemCount();
    return super(GUIListBase).IsValidIndex(i);
    //return;    
}

function Clear()
{
    root.Clear(true);
    UpdateItemCount();
    super(GUIListBase).Clear();
    //return;    
}

function bool HandleDebugExec(string Command, string params)
{
    switch(Command)
    {
        // End:0x35
        case "selected":
            Log("Selected item:" $ (Get()), 'MusicPlayer');
            return true;
        // End:0x67
        case "selectedpath":
            Log("Selected path:" $ (GetPath()), 'MusicPlayer');
            return true;
        // End:0xAF
        case "visiblenode":
            Log(((("Visible Node" @ params) $ " '") $ (VisibleNodeText(int(params)))) $ "'", 'MusicPlayer');
            return true;
        // End:0xFFFF
        default:
            return current.HandleDebugExec(Command, params);
            break;
    }
    //return;    
}

function InternalOnEndDrag(GUIComponent Accepting, bool bAccepted)
{
    // End:0x1E
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
    // End:0x4D
    if(bNotify)
    {
        CheckLinkedObjects(self);
    }
    //return;    
}

defaultproperties
{
    bSimpleFileBrowsing=true
    OnDrawItem=DirectoryTreeList.InternalOnDrawItem
    OnEndDrag=DirectoryTreeList.InternalOnEndDrag
}