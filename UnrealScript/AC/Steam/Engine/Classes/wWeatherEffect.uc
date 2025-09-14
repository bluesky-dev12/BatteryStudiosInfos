/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path Engine\Classes\wWeatherEffect.uc
 * Package Imports:
 *	Engine
 *	Core
 *
 * Stats:
 *	Enums:1
 *	Structs:1
 *	Properties:28
 *
 *******************************************************************************/
class wWeatherEffect extends Actor
    native
    exportstructs
    placeable;

enum EWeatherType
{
    WT_Rain,
    WT_Snow,
    WT_Dust
};

struct WeatherPcl
{
    var Vector pos;
    var Vector Vel;
    var float Life;
    var float Size;
    var float HitTime;
    var float InvLifeSpan;
    var float DistAtten;
    var byte frame;
    var byte Dummy1;
    var byte Visible;
    var byte Dummy2;
};

var() wWeatherEffect.EWeatherType WeatherType;
var() int numParticles;
var transient int numActive;
var transient Box Box;
var transient Vector eyePos;
var transient Vector eyeDir;
var transient Vector spawnOrigin;
var transient Vector eyeMoveVec;
var transient float eyeVel;
var() float deviation;
var() float maxPclEyeDist;
var() float numCols;
var() float numRows;
var transient float numFrames;
var transient float texU;
var transient float texV;
var transient bool noReference;
var Vector spawnVecU;
var Vector spawnVecV;
var() Vector spawnVel;
var() RangeVector Position;
var() Range Speed;
var() Range Life;
var() Range Size;
var() Range EyeSizeClamp;
var(Force) bool bForceAffected;
var transient array<WeatherPcl> pcl;
var transient array<Volume> pclBlockers;

defaultproperties
{
    WeatherType=1
    numParticles=1024
    deviation=0.40
    maxPclEyeDist=590.0
    numCols=4.0
    numRows=4.0
    spawnVel=(X=0.0,Y=0.0,Z=-1.0)
    Position=(X=(Min=-300.0,Max=300.0),Y=(Min=-300.0,Max=300.0),Z=(Min=-100.0,Max=300.0))
    Speed=(Min=100.0,Max=200.0)
    Life=(Min=3.0,Max=4.0)
    Size=(Min=4.0,Max=5.0)
    DrawType=10
    bNoDelete=true
    bHighDetail=true
    RemoteRole=2
    DrawScale=4.0
    Style=3
    bUnlit=true
    bGameRelevant=true
}