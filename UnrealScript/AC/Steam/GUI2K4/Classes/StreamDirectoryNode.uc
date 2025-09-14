/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path GUI2K4\Classes\StreamDirectoryNode.uc
 * Package Imports:
 *	GUI2K4
 *	Engine
 *	Core
 *
 * Stats:
 *	Properties:9
 *	Functions:39
 *
 *******************************************************************************/
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
    // End:0x0b
    if(Initialized())
    {
        return;
    }
    Clear();
    bInitialized = true;
    // End:0x44
    if(Parent == none || MyPath == "" || MyPath == "..")
    {
        return;
    }
    // End:0x6a
    if(Outer.bSimpleFileBrowsing)
    {
        AddChild("..").InitializeNode();
    }
    RefreshNodeContents();
}

function RefreshNodeContents()
{
    local int i;
    local array<string> Directories, Files;

    // End:0x61
    if(Outer.FileManager == none)
    {
        Log("Cannot refresh node '" $ MyPath $ "' contents - File Manager not set.", 'MusicPlayer');
        return;
    }
    // End:0xb8
    if(HasChildren())
    {
        i = Children.Length - 1;
        J0x79:
        // End:0xb8 [While If]
        if(i >= 0)
        {
            // End:0xae
            if(Children[i].GetPath() != "..")
            {
                Children.Remove(i, 1);
            }
            -- i;
            // This is an implied JumpToken; Continue!
            goto J0x79;
        }
    }
    contents.Remove(0, contents.Length);
    Outer.FileManager.GetDirectoryContents(Directories, MyPath, 1);
    i = 0;
    J0xf0:
    // End:0x11b [While If]
    if(i < Directories.Length)
    {
        AddChild(Directories[i]);
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0xf0;
    }
    Outer.FileManager.GetDirectoryContents(Files, MyPath, 4);
    Outer.FileManager.GetDirectoryContents(Files, MyPath, 5);
    i = 0;
    J0x16a:
    // End:0x195 [While If]
    if(i < Files.Length)
    {
        AddContent(Files[i]);
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x16a;
    }
    UpdateCost();
}

function Clear(optional bool bPropagate)
{
    local int i;

    // End:0x50
    if(HasChildren() && bPropagate)
    {
        i = 0;
        J0x1b:
        // End:0x50 [While If]
        if(i < Children.Length)
        {
            Children[i].Clear(bPropagate);
            ++ i;
            // This is an implied JumpToken; Continue!
            goto J0x1b;
        }
    }
    Children.Remove(0, Children.Length);
    contents.Remove(0, contents.Length);
    UpdateCost();
    bInitialized = false;
}

function string GetIndent()
{
    local string Indent;

    // End:0x15
    if(Outer.bSimpleFileBrowsing)
    {
        return "";
    }
    // End:0x3a
    if(Parent != none)
    {
        Indent = Parent.GetIndent() $ " ";
    }
    return Indent;
}

function string GetNodePrefix(bool bNoPrefix)
{
    // End:0x0c
    if(bNoPrefix)
    {
        return "";
    }
    // End:0x22
    if(IsEmpty())
    {
        return GetIndent() $ ". ";
    }
    // End:0x3a
    if(!IsOpen())
    {
        return GetIndent() $ "+ ";
    }
    return GetIndent() $ "- ";
}

function string NodeText(int VisibleIndex, optional bool bNoPrefix)
{
    local StreamDirectoryNode Node;

    // End:0x1f
    if(!IsOpen())
    {
        return GetNodePrefix(bNoPrefix) $ DirectoryName;
    }
    Node = FindVisibleNode(VisibleIndex);
    // End:0x78
    if(Node == self)
    {
        // End:0x64
        if(VisibleIndex >= 0 && VisibleIndex < contents.Length)
        {
            return contents[VisibleIndex];
        }
        return GetNodePrefix(bNoPrefix) $ DirectoryName;
    }
    return Node.NodeText(VisibleIndex, bNoPrefix);
}

function StreamDirectoryNode FindVisibleNode(out int idx)
{
    local int Count, i;

    // End:0x0d
    if(!IsOpen())
    {
        return self;
    }
    InitializeNode();
    // End:0xbd
    if(idx > 0)
    {
        Count = Children[0].cost();
        // End:0x80
        if(HasChildren())
        {
            J0x3e:
            // End:0x80 [While If]
            if(Count <= idx && ++ i < Children.Length)
            {
                Count += Children[i].cost();
                // This is an implied JumpToken; Continue!
                goto J0x3e;
            }
        }
        // End:0xab
        if(i == Children.Length || !HasChildren())
        {
            idx -= Count;
            return self;
        }
        idx = Count - idx;
    }
    return Children[i].FindVisibleNode(idx);
}

function int FindVisibleNodeIndex(string Path)
{
    local int i, VisibleIndex;
    local string MyComponent;

    // End:0x0e
    if(Path == "")
    {
        return 1;
    }
    InitializeNode();
    MyComponent = StripPathComponent(Path);
    // End:0x3c
    if(MyComponent == "")
    {
        MyComponent = Path;
    }
    VisibleIndex = 1;
    i = 0;
    J0x4a:
    // End:0xc5 [While If]
    if(i < Children.Length)
    {
        // End:0x9f
        if(CompareNames(MyComponent, Children[i].GetName()))
        {
            return VisibleIndex + Children[i].FindVisibleNodeIndex(Path);
        }
        VisibleIndex += Children[i].cost();
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x4a;
    }
    i = 0;
    J0xcc:
    // End:0x109 [While If]
    if(i < contents.Length)
    {
        // End:0xf8
        if(CompareNames(MyComponent, contents[i]))
        {
        }
        // End:0x109
        else
        {
            ++ VisibleIndex;
            ++ i;
            // This is an implied JumpToken; Continue!
            goto J0xcc;
        }
    }
    return VisibleIndex;
}

function int cost()
{
    return NodeRenderCost + ChildRenderCost;
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
    // End:0xac
    else
    {
        // End:0x3e
        if(!Outer.bSimpleFileBrowsing)
        {
            NodeRenderCost = 1;
        }
        i = 0;
        J0x45:
        // End:0x9f [While If]
        if(i < Children.Length)
        {
            // End:0x79
            if(bFullUpdate)
            {
                Children[i].UpdateCost(bFullUpdate);
            }
            ChildRenderCost += Children[i].cost();
            ++ i;
            // This is an implied JumpToken; Continue!
            goto J0x45;
        }
        NodeRenderCost += contents.Length;
    }
}

function Toggle()
{
    // End:0x12
    if(IsOpen())
    {
        Collapse();
    }
    // End:0x18
    else
    {
        Expand();
    }
}

function Expand(optional bool bFullUpdate)
{
    InitializeNode();
    bExpanded = true;
    UpdateCost(bFullUpdate);
}

function Collapse(optional bool bFullUpdate)
{
    InitializeNode();
    bExpanded = false;
    UpdateCost(bFullUpdate);
}

function bool ChangeDirectory(string Path, out StreamDirectoryNode Node, optional bool bRefreshContents)
{
    local int i;
    local string MyComponent;

    InitializeNode();
    // End:0x5c
    if(Path == "" || Path == ".")
    {
        // End:0x3b
        if(bRefreshContents && Initialized())
        {
            RefreshNodeContents();
        }
        // End:0x4d
        if(IsEmpty())
        {
            Node = none;
            return false;
        }
        Expand();
        Node = self;
        return true;
    }
    // End:0xa7
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
    // End:0xd7
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
}

function bool ExpandPath(string Path)
{
    local int i, idx;
    local string S;

    InitializeNode();
    // End:0x1a
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
    // End:0xec
    if(S != "")
    {
        idx = FindChildIndex(S);
        // End:0xe4
        if(Valid(idx))
        {
            i = 0;
            J0x74:
            // End:0xbe [While If]
            if(i < Children.Length)
            {
                // End:0xb4
                if(Children[i] != Children[idx])
                {
                    Children[i].Collapse();
                }
                ++ i;
                // This is an implied JumpToken; Continue!
                goto J0x74;
            }
            // End:0xe4
            if(Path != "")
            {
                Children[idx].ExpandPath(Path);
            }
        }
        Expand();
        return true;
    }
    return false;
}

function StreamDirectoryNode AddChild(string ChildName)
{
    local int i;
    local string S;
    local StreamDirectoryNode Child;

    // End:0x0e
    if(ChildName == "")
    {
        return none;
    }
    InitializeNode();
    J0x14:
    // End:0x7a [While If]
    if(i < Children.Length)
    {
        S = Children[i].GetName();
        // End:0x5e
        if(CompareNames(S, ChildName))
        {
            return Children[i];
        }
        // End:0x70
        if(ChildName < S)
        {
        }
        // End:0x7a
        else
        {
            ++ i;
            // This is an implied JumpToken; Continue!
            goto J0x14;
        }
    }
    Child = CreateChild(ChildName);
    // End:0xda
    if(Child == none)
    {
        Log(GetName() @ "failed to successfully create child '" $ ChildName $ "'", 'MusicPlayer');
        return none;
    }
    Children.Insert(i, 1);
    Children[i] = Child;
    UpdateCost();
    return Child;
}

function bool AddContent(string ContentName)
{
    local int i;
    local string S;

    // End:0x0e
    if(ContentName == "")
    {
        return false;
    }
    InitializeNode();
    S = StripPathComponent(ContentName);
    // End:0x6d
    if(S != "")
    {
        i = FindChildIndex(S);
        // End:0x6b
        if(Valid(i))
        {
            return Children[i].AddContent(ContentName);
        }
        return false;
    }
    i = FindFileIndex(ContentName);
    // End:0x9f
    if(i == -1)
    {
        contents[contents.Length] = ContentName;
    }
    return true;
}

function bool RemoveChild(StreamDirectoryNode Child)
{
    local int i;

    // End:0x0d
    if(Child == none)
    {
        return false;
    }
    InitializeNode();
    i = FindChildIndex(Child.GetName());
    return RemoveChildAt(i);
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
}

function bool RemoveContent(string Path)
{
    local string S;
    local int i;

    InitializeNode();
    S = StripPathComponent(Path);
    // End:0x5f
    if(S != "")
    {
        i = FindChildIndex(S);
        // End:0x5d
        if(Valid(i))
        {
            return Children[i].RemoveContent(Path);
        }
        return false;
    }
    i = FindFileIndex(Path);
    return RemoveContentAt(i);
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
    J0x1f:
    // End:0x58 [While If]
    if(i < contents.Length)
    {
        // End:0x4e
        if(CompareNames(contents[i], fileName))
        {
            return i;
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x1f;
    }
    return -1;
}

function bool SetName(string InName)
{
    // End:0x0e
    if(InName == "")
    {
        return false;
    }
    DirectoryName = InName;
    return true;
}

function bool SetParent(StreamDirectoryNode InParent)
{
    // End:0x1a
    if(InParent == none || Parent != none)
    {
        return false;
    }
    Parent = InParent;
    return true;
}

function bool SetPath(string InPath)
{
    // End:0x0e
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
    MyPath = InPath $ DirectoryName $ GetPathSeparator();
    return true;
}

function bool Initialized()
{
    return bInitialized;
}

function bool IsEmpty()
{
    return Initialized() && !HasChildren() && contents.Length == 0;
}

function bool IsOpen()
{
    return bExpanded;
}

function string GetName()
{
    return DirectoryName;
}

function string GetPath()
{
    return MyPath;
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
    // End:0x6d
    if(Valid(i))
    {
        return Children[i].FindChildByPath(Path);
    }
    return none;
}

function StreamDirectoryNode FindChild(string ChildName, optional bool bDeepSearch)
{
    local int i;
    local StreamDirectoryNode Node;

    InitializeNode();
    i = 0;
    J0x0d:
    // End:0x96 [While If]
    if(i < Children.Length)
    {
        // End:0x4c
        if(CompareNames(Children[i].GetName(), ChildName))
        {
            return Children[i];
        }
        // End:0x8c
        if(bDeepSearch)
        {
            Node = Children[i].FindChild(ChildName, bDeepSearch);
            // End:0x8c
            if(Node != none)
            {
                return Node;
            }
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x0d;
    }
    return none;
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
    // End:0x8c [While If]
    if(i < Children.Length)
    {
        // End:0x82
        if(CompareNames(Children[i].GetName(), ChildName))
        {
            return i;
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x49;
    }
    return -1;
}

function bool HasChildren()
{
    // End:0x1c
    if(Outer.bSimpleFileBrowsing)
    {
        return Children.Length > 1;
    }
    return Children.Length > 0;
}

function bool Valid(int i)
{
    return i >= 0 && i < Children.Length && Children[i] != none;
}

function bool ValidFile(int i)
{
    return i >= 0 && i < contents.Length;
}

protected function StreamDirectoryNode CreateChild(string ChildName)
{
    local StreamDirectoryNode Child;

    // End:0x0e
    if(ChildName == "")
    {
        return none;
    }
    Child = new (Outer) class'StreamDirectoryNode';
    assert(Child != none);
    Child.SetParent(self);
    Child.SetName(ChildName);
    Child.SetPath(MyPath);
    return Child;
}

static function string StripPathComponent(out string Path)
{
    local string S;
    local int i;

    // End:0x0f
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
}

function bool HandleDebugExec(string Command, string Param)
{
    local int i;
    local StreamDirectoryNode Node;

    switch(Command)
    {
        // End:0x34
        case "cwd":
            Log("Current Directory:" $ GetPath(), 'MusicPlayer');
            return true;
        // End:0x11f
        case "dumpcwd":
            Log("Dumping directory contents for" @ GetName(), 'MusicPlayer');
            i = 0;
            J0x76:
            // End:0xca [While If]
            if(i < Children.Length)
            {
                Log(" Child " $ string(i) @ "'" $ Children[i].GetName() $ "'", 'MusicPlayer');
                ++ i;
                // This is an implied JumpToken; Continue!
                goto J0x76;
            }
            i = 0;
            J0xd1:
            // End:0x11d [While If]
            if(i < contents.Length)
            {
                Log(" Content " $ string(i) @ "'" $ contents[i] $ "'", 'MusicPlayer');
                ++ i;
                // This is an implied JumpToken; Continue!
                goto J0xd1;
            }
            return true;
        // End:0x224
        case "cost":
            // End:0x13e
            if(Param == "")
            {
                Node = self;
            }
            // End:0x19b
            else
            {
                Node = FindChild(Param);
                // End:0x19b
                if(Node == none)
                {
                    Log("Couldn't find child '" $ Param $ "' in directory" @ GetName(), 'MusicPlayer');
                    return true;
                }
            }
            Log("Cost for directory '" $ Node.GetName() $ "': " $ string(Node.cost()) @ "Open:" $ string(Node.IsOpen()) @ "Initialized:" $ string(Node.Initialized()), 'MusicPlayer');
            return true;
        // End:0xffff
        default:
            return false;
    }
}

defaultproperties
{
    NodeRenderCost=1
}