class StreamDirectoryNode extends StreamBase within DirectoryTreeList;

var() StreamDirectoryNode Parent;
var() editconst editinline array<editconst editinline StreamDirectoryNode> Children;
var() editconst editinline array<editconst editinline string> contents;
var() private int NodeRenderCost;
var() private int ChildRenderCost;
var() private editconst string MyPath;
var() private editconst string DirectoryName;
var() private bool bExpanded;
var() private bool bInitialized;

function InitializeNode()
{
    // End:0x0B
    if(Initialized())
    {
        return;
    }
    Clear();
    bInitialized = true;
    // End:0x44
    if(((Parent == none) || MyPath == "") || MyPath == "..")
    {
        return;
    }
    // End:0x6A
    if(Outer.bSimpleFileBrowsing)
    {
        AddChild("..").InitializeNode();
    }
    RefreshNodeContents();
    //return;    
}

function RefreshNodeContents()
{
    local int i;
    local array<string> Directories, Files;

    // End:0x61
    if(Outer.FileManager == none)
    {
        Log(("Cannot refresh node '" $ MyPath) $ "' contents - File Manager not set.", 'MusicPlayer');
        return;
    }
    // End:0xB8
    if(HasChildren())
    {
        i = Children.Length - 1;
        J0x79:

        // End:0xB8 [Loop If]
        if(i >= 0)
        {
            // End:0xAE
            if(Children[i].GetPath() != "..")
            {
                Children.Remove(i, 1);
            }
            i--;
            // [Loop Continue]
            goto J0x79;
        }
    }
    contents.Remove(0, contents.Length);
    Outer.FileManager.GetDirectoryContents(Directories, MyPath, 1);
    i = 0;
    J0xF0:

    // End:0x11B [Loop If]
    if(i < Directories.Length)
    {
        AddChild(Directories[i]);
        i++;
        // [Loop Continue]
        goto J0xF0;
    }
    Outer.FileManager.GetDirectoryContents(Files, MyPath, 4);
    Outer.FileManager.GetDirectoryContents(Files, MyPath, 5);
    i = 0;
    J0x16A:

    // End:0x195 [Loop If]
    if(i < Files.Length)
    {
        AddContent(Files[i]);
        i++;
        // [Loop Continue]
        goto J0x16A;
    }
    UpdateCost();
    //return;    
}

function Clear(optional bool bPropagate)
{
    local int i;

    // End:0x50
    if((HasChildren()) && bPropagate)
    {
        i = 0;
        J0x1B:

        // End:0x50 [Loop If]
        if(i < Children.Length)
        {
            Children[i].Clear(bPropagate);
            i++;
            // [Loop Continue]
            goto J0x1B;
        }
    }
    Children.Remove(0, Children.Length);
    contents.Remove(0, contents.Length);
    UpdateCost();
    bInitialized = false;
    //return;    
}

function string GetIndent()
{
    local string Indent;

    // End:0x15
    if(Outer.bSimpleFileBrowsing)
    {
        return "";
    }
    // End:0x3A
    if(Parent != none)
    {
        Indent = Parent.GetIndent() $ " ";
    }
    return Indent;
    //return;    
}

function string GetNodePrefix(bool bNoPrefix)
{
    // End:0x0C
    if(bNoPrefix)
    {
        return "";
    }
    // End:0x22
    if(IsEmpty())
    {
        return (GetIndent()) $ ". ";
    }
    // End:0x3A
    if(!IsOpen())
    {
        return (GetIndent()) $ "+ ";
    }
    return (GetIndent()) $ "- ";
    //return;    
}

function string NodeText(int VisibleIndex, optional bool bNoPrefix)
{
    local StreamDirectoryNode Node;

    // End:0x1F
    if(!IsOpen())
    {
        return (GetNodePrefix(bNoPrefix)) $ DirectoryName;
    }
    Node = FindVisibleNode(VisibleIndex);
    // End:0x78
    if(Node == self)
    {
        // End:0x64
        if((VisibleIndex >= 0) && VisibleIndex < contents.Length)
        {
            return contents[VisibleIndex];
        }
        return (GetNodePrefix(bNoPrefix)) $ DirectoryName;
    }
    return Node.NodeText(VisibleIndex, bNoPrefix);
    //return;    
}

function StreamDirectoryNode FindVisibleNode(out int idx)
{
    local int Count, i;

    // End:0x0D
    if(!IsOpen())
    {
        return self;
    }
    InitializeNode();
    // End:0xBD
    if(idx > 0)
    {
        Count = Children[0].cost();
        // End:0x80
        if(HasChildren())
        {
            J0x3E:

            // End:0x80 [Loop If]
            if((Count <= idx) && ++i < Children.Length)
            {
                Count += Children[i].cost();
                // [Loop Continue]
                goto J0x3E;
            }
        }
        // End:0xAB
        if((i == Children.Length) || !HasChildren())
        {
            idx -= Count;
            return self;
        }
        idx = Count - idx;
    }
    return Children[i].FindVisibleNode(idx);
    //return;    
}

function int FindVisibleNodeIndex(string Path)
{
    local int i, VisibleIndex;
    local string MyComponent;

    // End:0x0E
    if(Path == "")
    {
        return 1;
    }
    InitializeNode();
    MyComponent = StripPathComponent(Path);
    // End:0x3C
    if(MyComponent == "")
    {
        MyComponent = Path;
    }
    VisibleIndex = 1;
    i = 0;
    J0x4A:

    // End:0xC5 [Loop If]
    if(i < Children.Length)
    {
        // End:0x9F
        if(CompareNames(MyComponent, Children[i].GetName()))
        {
            return VisibleIndex + Children[i].FindVisibleNodeIndex(Path);
        }
        VisibleIndex += Children[i].cost();
        i++;
        // [Loop Continue]
        goto J0x4A;
    }
    i = 0;
    J0xCC:

    // End:0x109 [Loop If]
    if(i < contents.Length)
    {
        // End:0xF8
        if(CompareNames(MyComponent, contents[i]))
        {
            // [Explicit Break]
            goto J0x109;
        }
        VisibleIndex++;
        i++;
        // [Loop Continue]
        goto J0xCC;
    }
    J0x109:

    return VisibleIndex;
    //return;    
}

function int cost()
{
    return NodeRenderCost + ChildRenderCost;
    //return;    
}

function UpdateCost(optional bool bFullUpdate)
{
    local int i;

    NodeRenderCost = 0;
    ChildRenderCost = 0;
    // End:0x23
    if(!IsOpen())
    {
        NodeRenderCost = 1;        
    }
    else
    {
        // End:0x3E
        if(!Outer.bSimpleFileBrowsing)
        {
            NodeRenderCost = 1;
        }
        i = 0;
        J0x45:

        // End:0x9F [Loop If]
        if(i < Children.Length)
        {
            // End:0x79
            if(bFullUpdate)
            {
                Children[i].UpdateCost(bFullUpdate);
            }
            ChildRenderCost += Children[i].cost();
            i++;
            // [Loop Continue]
            goto J0x45;
        }
        NodeRenderCost += contents.Length;
    }
    //return;    
}

function Toggle()
{
    // End:0x12
    if(IsOpen())
    {
        Collapse();        
    }
    else
    {
        Expand();
    }
    //return;    
}

function Expand(optional bool bFullUpdate)
{
    InitializeNode();
    bExpanded = true;
    UpdateCost(bFullUpdate);
    //return;    
}

function Collapse(optional bool bFullUpdate)
{
    InitializeNode();
    bExpanded = false;
    UpdateCost(bFullUpdate);
    //return;    
}

function bool ChangeDirectory(string Path, out StreamDirectoryNode Node, optional bool bRefreshContents)
{
    local int i;
    local string MyComponent;

    InitializeNode();
    // End:0x5C
    if((Path == "") || Path == ".")
    {
        // End:0x3B
        if(bRefreshContents && Initialized())
        {
            RefreshNodeContents();
        }
        // End:0x4D
        if(IsEmpty())
        {
            Node = none;
            return false;
        }
        Expand();
        Node = self;
        return true;
    }
    // End:0xA7
    if(Path == "..")
    {
        // End:0x84
        if(Parent == none)
        {
            Expand();
            Node = self;
            return true;
        }
        Collapse();
        return Parent.ChangeDirectory("", Node, bRefreshContents);
    }
    MyComponent = StripPathComponent(Path);
    // End:0xD7
    if(MyComponent == "")
    {
        MyComponent = Path;
        Path = "";
    }
    i = FindChildIndex(MyComponent);
    // End:0x126
    if(Valid(i))
    {
        // End:0x126
        if(Children[i].ChangeDirectory(Path, Node, bRefreshContents))
        {
            Collapse();
            return true;
        }
    }
    Node = none;
    return false;
    //return;    
}

function bool ExpandPath(string Path)
{
    local int i, idx;
    local string S;

    InitializeNode();
    // End:0x1A
    if(Path == "")
    {
        Expand();
        return true;
    }
    S = StripPathComponent(Path);
    // End:0x42
    if(S == "")
    {
        S = Path;
    }
    // End:0xEC
    if(S != "")
    {
        idx = FindChildIndex(S);
        // End:0xE4
        if(Valid(idx))
        {
            i = 0;
            J0x74:

            // End:0xBE [Loop If]
            if(i < Children.Length)
            {
                // End:0xB4
                if(Children[i] != Children[idx])
                {
                    Children[i].Collapse();
                }
                i++;
                // [Loop Continue]
                goto J0x74;
            }
            // End:0xE4
            if(Path != "")
            {
                Children[idx].ExpandPath(Path);
            }
        }
        Expand();
        return true;
    }
    return false;
    //return;    
}

function StreamDirectoryNode AddChild(string ChildName)
{
    local int i;
    local string S;
    local StreamDirectoryNode Child;

    // End:0x0E
    if(ChildName == "")
    {
        return none;
    }
    InitializeNode();
    J0x14:

    // End:0x7A [Loop If]
    if(i < Children.Length)
    {
        S = Children[i].GetName();
        // End:0x5E
        if(CompareNames(S, ChildName))
        {
            return Children[i];
        }
        // End:0x70
        if(ChildName < S)
        {
            // [Explicit Break]
            goto J0x7A;
        }
        i++;
        // [Loop Continue]
        goto J0x14;
    }
    J0x7A:

    Child = CreateChild(ChildName);
    // End:0xDA
    if(Child == none)
    {
        Log((((GetName()) @ "failed to successfully create child '") $ ChildName) $ "'", 'MusicPlayer');
        return none;
    }
    Children.Insert(i, 1);
    Children[i] = Child;
    UpdateCost();
    return Child;
    //return;    
}

function bool AddContent(string ContentName)
{
    local int i;
    local string S;

    // End:0x0E
    if(ContentName == "")
    {
        return false;
    }
    InitializeNode();
    S = StripPathComponent(ContentName);
    // End:0x6D
    if(S != "")
    {
        i = FindChildIndex(S);
        // End:0x6B
        if(Valid(i))
        {
            return Children[i].AddContent(ContentName);
        }
        return false;
    }
    i = FindFileIndex(ContentName);
    // End:0x9F
    if(i == -1)
    {
        contents[contents.Length] = ContentName;
    }
    return true;
    //return;    
}

function bool RemoveChild(StreamDirectoryNode Child)
{
    local int i;

    // End:0x0D
    if(Child == none)
    {
        return false;
    }
    InitializeNode();
    i = FindChildIndex(Child.GetName());
    return RemoveChildAt(i);
    //return;    
}

function bool RemoveChildAt(int i)
{
    // End:0x23
    if(Valid(i))
    {
        Children.Remove(i, 1);
        UpdateCost(true);
        return true;
    }
    return false;
    //return;    
}

function bool RemoveContent(string Path)
{
    local string S;
    local int i;

    InitializeNode();
    S = StripPathComponent(Path);
    // End:0x5F
    if(S != "")
    {
        i = FindChildIndex(S);
        // End:0x5D
        if(Valid(i))
        {
            return Children[i].RemoveContent(Path);
        }
        return false;
    }
    i = FindFileIndex(Path);
    return RemoveContentAt(i);
    //return;    
}

function bool RemoveContentAt(int i)
{
    // End:0x23
    if(ValidFile(i))
    {
        contents.Remove(i, 1);
        UpdateCost(true);
        return true;
    }
    return false;
    //return;    
}

function int FindFileIndex(string fileName)
{
    local int i;

    // End:0x12
    if(fileName == "")
    {
        return -1;
    }
    InitializeNode();
    i = 0;
    J0x1F:

    // End:0x58 [Loop If]
    if(i < contents.Length)
    {
        // End:0x4E
        if(CompareNames(contents[i], fileName))
        {
            return i;
        }
        i++;
        // [Loop Continue]
        goto J0x1F;
    }
    return -1;
    //return;    
}

function bool SetName(string InName)
{
    // End:0x0E
    if(InName == "")
    {
        return false;
    }
    DirectoryName = InName;
    return true;
    //return;    
}

function bool SetParent(StreamDirectoryNode InParent)
{
    // End:0x1A
    if((InParent == none) || Parent != none)
    {
        return false;
    }
    Parent = InParent;
    return true;
    //return;    
}

function bool SetPath(string InPath)
{
    // End:0x0E
    if(MyPath != "")
    {
        return false;
    }
    // End:0x29
    if(DirectoryName == "..")
    {
        MyPath = DirectoryName;
        return true;
    }
    MyPath = (InPath $ DirectoryName) $ GetPathSeparator();
    return true;
    //return;    
}

function bool Initialized()
{
    return bInitialized;
    //return;    
}

function bool IsEmpty()
{
    return ((Initialized()) && !HasChildren()) && contents.Length == 0;
    //return;    
}

function bool IsOpen()
{
    return bExpanded;
    //return;    
}

function string GetName()
{
    return DirectoryName;
    //return;    
}

function string GetPath()
{
    return MyPath;
    //return;    
}

function StreamDirectoryNode FindChildByPath(out string Path)
{
    local string ChildName;
    local int i;

    InitializeNode();
    // End:0x14
    if(Path == "")
    {
        return self;
    }
    ChildName = StripPathComponent(Path);
    // End:0x33
    if(ChildName == "")
    {
        return self;
    }
    i = FindChildIndex(ChildName);
    // End:0x6D
    if(Valid(i))
    {
        return Children[i].FindChildByPath(Path);
    }
    return none;
    //return;    
}

function StreamDirectoryNode FindChild(string ChildName, optional bool bDeepSearch)
{
    local int i;
    local StreamDirectoryNode Node;

    InitializeNode();
    i = 0;
    J0x0D:

    // End:0x96 [Loop If]
    if(i < Children.Length)
    {
        // End:0x4C
        if(CompareNames(Children[i].GetName(), ChildName))
        {
            return Children[i];
        }
        // End:0x8C
        if(bDeepSearch)
        {
            Node = Children[i].FindChild(ChildName, bDeepSearch);
            // End:0x8C
            if(Node != none)
            {
                return Node;
            }
        }
        i++;
        // [Loop Continue]
        goto J0x0D;
    }
    return none;
    //return;    
}

function int FindChildIndex(string ChildName)
{
    local int i;

    // End:0x12
    if(ChildName == "")
    {
        return -1;
    }
    InitializeNode();
    // End:0x42
    if(Right(ChildName, 1) == GetPathSeparator())
    {
        ChildName = Left(ChildName, Len(ChildName) - 1);
    }
    i = 0;
    J0x49:

    // End:0x8C [Loop If]
    if(i < Children.Length)
    {
        // End:0x82
        if(CompareNames(Children[i].GetName(), ChildName))
        {
            return i;
        }
        i++;
        // [Loop Continue]
        goto J0x49;
    }
    return -1;
    //return;    
}

function bool HasChildren()
{
    // End:0x1C
    if(Outer.bSimpleFileBrowsing)
    {
        return Children.Length > 1;
    }
    return Children.Length > 0;
    //return;    
}

function bool Valid(int i)
{
    return ((i >= 0) && i < Children.Length) && Children[i] != none;
    //return;    
}

function bool ValidFile(int i)
{
    return (i >= 0) && i < contents.Length;
    //return;    
}

protected function StreamDirectoryNode CreateChild(string ChildName)
{
    local StreamDirectoryNode Child;

    // End:0x0E
    if(ChildName == "")
    {
        return none;
    }
    Child = new (Outer) Class'GUI2K4_Decompressed.StreamDirectoryNode';
    assert(Child != none);
    Child.SetParent(self);
    Child.SetName(ChildName);
    Child.SetPath(MyPath);
    return Child;
    //return;    
}

static function string StripPathComponent(out string Path)
{
    local string S;
    local int i;

    // End:0x0F
    if(Path == "")
    {
        return "";
    }
    i = InStr(Path, GetPathSeparator());
    // End:0x34
    if(i == -1)
    {
        return "";
    }
    S = Left(Path, i);
    Path = Mid(Path, i + 1);
    return S;
    //return;    
}

function bool HandleDebugExec(string Command, string Param)
{
    local int i;
    local StreamDirectoryNode Node;

    switch(Command)
    {
        // End:0x34
        case "cwd":
            Log("Current Directory:" $ (GetPath()), 'MusicPlayer');
            return true;
        // End:0x11F
        case "dumpcwd":
            Log("Dumping directory contents for" @ (GetName()), 'MusicPlayer');
            i = 0;
            J0x76:

            // End:0xCA [Loop If]
            if(i < Children.Length)
            {
                Log((((" Child " $ string(i)) @ "'") $ Children[i].GetName()) $ "'", 'MusicPlayer');
                i++;
                // [Loop Continue]
                goto J0x76;
            }
            i = 0;
            J0xD1:

            // End:0x11D [Loop If]
            if(i < contents.Length)
            {
                Log((((" Content " $ string(i)) @ "'") $ contents[i]) $ "'", 'MusicPlayer');
                i++;
                // [Loop Continue]
                goto J0xD1;
            }
            return true;
        // End:0x224
        case "cost":
            // End:0x13E
            if(Param == "")
            {
                Node = self;                
            }
            else
            {
                Node = FindChild(Param);
                // End:0x19B
                if(Node == none)
                {
                    Log((("Couldn't find child '" $ Param) $ "' in directory") @ (GetName()), 'MusicPlayer');
                    return true;
                }
            }
            Log((((((("Cost for directory '" $ Node.GetName()) $ "': ") $ string(Node.cost())) @ "Open:") $ string(Node.IsOpen())) @ "Initialized:") $ string(Node.Initialized()), 'MusicPlayer');
            return true;
        // End:0xFFFF
        default:
            return false;
            break;
    }
    //return;    
}

defaultproperties
{
    NodeRenderCost=1
}