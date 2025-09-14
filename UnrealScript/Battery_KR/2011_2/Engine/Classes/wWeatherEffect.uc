class wWeatherEffect extends Actor
    native
    exportstructs
    placeable;

enum EWeatherType
{
    WT_Rain,                        // 0
    WT_Snow,                        // 1
    WT_Dust                         // 2
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
    deviation=0.4000000
    maxPclEyeDist=590.0000000
    numCols=4.0000000
    numRows=4.0000000
    spawnVel=(X=0.0000000,Y=0.0000000,Z=-1.0000000)
    Position=(X=(Min=-300.0000000,Max=300.0000000),Y=(Min=-300.0000000,Max=300.0000000),Z=(Min=-100.0000000,Max=300.0000000))
    Speed=(Min=100.0000000,Max=200.0000000)
    Life=(Min=3.0000000,Max=4.0000000)
    Size=(Min=4.0000000,Max=5.0000000)
    DrawType=10
    bNoDelete=true
    bHighDetail=true
    RemoteRole=2
    DrawScale=4.0000000
    Style=3
    bUnlit=true
    bGameRelevant=true
}