class BrushBuilder extends Object
    abstract
    native;

struct BuilderPoly
{
    var array<int> VertexIndices;
    var int direction;
    var name Item;
    var int PolyFlags;
};

var() string BitmapFilename;
var() string ToolTip;
var private array<Vector> Vertices;
var private array<BuilderPoly> Polys;
var private name Group;
var private bool MergeCoplanars;

// Export UBrushBuilder::execBeginBrush(FFrame&, void* const)
native function BeginBrush(bool MergeCoplanars, name Group)
{
    //native.MergeCoplanars;
    //native.Group;        
}

// Export UBrushBuilder::execEndBrush(FFrame&, void* const)
native function bool EndBrush();

// Export UBrushBuilder::execGetVertexCount(FFrame&, void* const)
native function int GetVertexCount();

// Export UBrushBuilder::execGetVertex(FFrame&, void* const)
native function Vector GetVertex(int i)
{
    //native.i;        
}

// Export UBrushBuilder::execGetPolyCount(FFrame&, void* const)
native function int GetPolyCount();

// Export UBrushBuilder::execBadParameters(FFrame&, void* const)
native function bool BadParameters(optional string Msg)
{
    //native.Msg;        
}

// Export UBrushBuilder::execVertexv(FFrame&, void* const)
native function int Vertexv(Vector V)
{
    //native.V;        
}

// Export UBrushBuilder::execVertex3f(FFrame&, void* const)
native function int Vertex3f(float X, float Y, float Z)
{
    //native.X;
    //native.Y;
    //native.Z;        
}

// Export UBrushBuilder::execPoly3i(FFrame&, void* const)
native function Poly3i(int direction, int i, int j, int k, optional name ItemName, optional int PolyFlags)
{
    //native.direction;
    //native.i;
    //native.j;
    //native.k;
    //native.ItemName;
    //native.PolyFlags;        
}

// Export UBrushBuilder::execPoly4i(FFrame&, void* const)
native function Poly4i(int direction, int i, int j, int k, int L, optional name ItemName, optional int PolyFlags)
{
    //native.direction;
    //native.i;
    //native.j;
    //native.k;
    //native.L;
    //native.ItemName;
    //native.PolyFlags;        
}

// Export UBrushBuilder::execPolyBegin(FFrame&, void* const)
native function PolyBegin(int direction, optional name ItemName, optional int PolyFlags)
{
    //native.direction;
    //native.ItemName;
    //native.PolyFlags;        
}

// Export UBrushBuilder::execPolyi(FFrame&, void* const)
native function Polyi(int i)
{
    //native.i;        
}

// Export UBrushBuilder::execPolyEnd(FFrame&, void* const)
native function PolyEnd();

event bool Build()
{
    //return;    
}

defaultproperties
{
    BitmapFilename="BBGeneric"
    ToolTip="Generic Builder"
}