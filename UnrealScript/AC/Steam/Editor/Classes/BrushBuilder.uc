/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path Editor\Classes\BrushBuilder.uc
 * Package Imports:
 *	Editor
 *	Core
 *
 * Stats:
 *	Structs:1
 *	Properties:6
 *	Functions:14
 *
 *******************************************************************************/
class BrushBuilder extends Object
    native
    abstract;

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
native function BeginBrush(bool MergeCoplanars, name Group);
// Export UBrushBuilder::execEndBrush(FFrame&, void* const)
native function bool EndBrush();
// Export UBrushBuilder::execGetVertexCount(FFrame&, void* const)
native function int GetVertexCount();
// Export UBrushBuilder::execGetVertex(FFrame&, void* const)
native function Vector GetVertex(int i);
// Export UBrushBuilder::execGetPolyCount(FFrame&, void* const)
native function int GetPolyCount();
// Export UBrushBuilder::execBadParameters(FFrame&, void* const)
native function bool BadParameters(optional string Msg);
// Export UBrushBuilder::execVertexv(FFrame&, void* const)
native function int Vertexv(Vector V);
// Export UBrushBuilder::execVertex3f(FFrame&, void* const)
native function int Vertex3f(float X, float Y, float Z);
// Export UBrushBuilder::execPoly3i(FFrame&, void* const)
native function Poly3i(int direction, int i, int j, int k, optional name ItemName, optional int PolyFlags);
// Export UBrushBuilder::execPoly4i(FFrame&, void* const)
native function Poly4i(int direction, int i, int j, int k, int L, optional name ItemName, optional int PolyFlags);
// Export UBrushBuilder::execPolyBegin(FFrame&, void* const)
native function PolyBegin(int direction, optional name ItemName, optional int PolyFlags);
// Export UBrushBuilder::execPolyi(FFrame&, void* const)
native function Polyi(int i);
// Export UBrushBuilder::execPolyEnd(FFrame&, void* const)
native function PolyEnd();
event bool Build();

defaultproperties
{
    BitmapFilename="BBGeneric"
    ToolTip="Generic Builder"
}