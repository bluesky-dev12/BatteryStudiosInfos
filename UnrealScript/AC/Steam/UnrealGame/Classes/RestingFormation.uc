/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path UnrealGame\Classes\RestingFormation.uc
 * Package Imports:
 *	UnrealGame
 *	Engine
 *	Core
 *
 * Stats:
 *	Properties:4
 *	Functions:5
 *
 *******************************************************************************/
class RestingFormation extends Info
    hidecategories(Movement,Collision,Lighting,LightColor,Karma,Force);

var Bot Occupant[16];
var Vector offset[16];
var Vector LookDir[16];
var float FormationSize;

function LeaveFormation(Bot B)
{
    // End:0x34
    if(Occupant[B.FormationPosition] == B)
    {
        Occupant[B.FormationPosition] = none;
    }
}

function bool SetFormation(Bot B, int pos, bool bFullCheck)
{
    local Vector HitLocation, HitNormal;
    local Actor HitActor, center;

    center = SquadAI(Owner).FormationCenter();
    // End:0x39
    if(center == none)
    {
        center = B.Pawn;
    }
    // End:0xe2
    if(Occupant[pos] == none || !Occupant[pos].Formation())
    {
        // End:0xc4
        if(bFullCheck)
        {
            HitActor = Trace(HitLocation, HitNormal, center.Location, GetLocationFor(pos, B), false);
            // End:0xc4
            if(HitActor != none && HitNormal.Z < 0.70)
            {
                return false;
            }
        }
        LeaveFormation(B);
        Occupant[pos] = B;
        return true;
    }
}

function int RecommendPositionFor(Bot B)
{
    local int i;

    i = Rand(15);
    // End:0x24
    if(SetFormation(B, i, true))
    {
        return i;
    }
    i = 0;
    J0x2b:
    // End:0x5b [While If]
    if(i < 16)
    {
        // End:0x51
        if(SetFormation(B, i, true))
        {
            return i;
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x2b;
    }
    i = 0;
    J0x62:
    // End:0x92 [While If]
    if(i < 16)
    {
        // End:0x88
        if(SetFormation(B, i, false))
        {
            return i;
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x62;
    }
    return Rand(15);
}

function Vector GetLocationFor(int pos, Bot B)
{
    local Vector loc, X, Y, Z;
    local Actor center;

    center = SquadAI(Owner).FormationCenter();
    // End:0x39
    if(center == none)
    {
        center = B.Pawn;
    }
    GetAxes(SquadAI(Owner).GetFacingRotation(), X, Y, Z);
    loc = center.Location + offset[pos].X * X + offset[pos].Y * Y;
    return loc;
}

function Vector GetViewPointFor(Bot B, int pos)
{
    local Vector ViewPoint;
    local Actor center;
    local int i;
    local Actor Best;

    // End:0x1d5
    if(B.Pawn.Anchor != none)
    {
        i = 0;
        J0x24:
        // End:0x1d5 [While If]
        if(i < B.Pawn.Anchor.PathList.Length)
        {
            // End:0x1cb
            if(B.Pawn.Anchor.PathList[i] != none && VSize(B.Pawn.Location - B.Pawn.Anchor.PathList[i].End.Location) > float(400) && FRand() > 0.30 && VSize(B.FocalPoint - B.Pawn.Anchor.PathList[i].End.Location) > float(100) && FastTrace(B.Pawn.Location, B.Pawn.Anchor.PathList[i].End.Location))
            {
                Best = B.Pawn.Anchor.PathList[i].End;
            }
            ++ i;
            // This is an implied JumpToken; Continue!
            goto J0x24;
        }
    }
    // End:0x21e
    if(Best != none)
    {
        return Best.Location + 0.50 * B.Pawn.CollisionHeight * vect(0.0, 0.0, 1.0);
    }
    // End:0x359
    if(B.Pawn.bStationary || Vehicle(B.Pawn) != none)
    {
        ViewPoint = B.Pawn.Location + float(2000) * VRand();
        ViewPoint.Z = B.Pawn.Location.Z;
        // End:0x31e
        if(ViewPoint - B.Pawn.Location Dot B.FocalPoint - B.Pawn.Location > float(0))
        {
            ViewPoint = float(2) * B.Pawn.Location - ViewPoint;
        }
        // End:0x356
        if(!FastTrace(ViewPoint, B.Pawn.Location))
        {
            ViewPoint = B.FocalPoint;
        }
    }
    // End:0x3fa
    else
    {
        center = SquadAI(Owner).FormationCenter();
        // End:0x3a0
        if(center == none)
        {
            return B.Pawn.Location + float(200) * VRand();
        }
        ViewPoint = float(2) * B.Pawn.Location - center.Location;
        ViewPoint.Z = B.Pawn.Location.Z;
    }
    return ViewPoint;
}

defaultproperties
{
    offset[0]=(X=100.0,Y=300.0,Z=0.0)
    offset[1]=(X=300.0,Y=0.0,Z=0.0)
    offset[2]=(X=100.0,Y=-300.0,Z=0.0)
    offset[3]=(X=-100.0,Y=300.0,Z=0.0)
    offset[4]=(X=-100.0,Y=-300.0,Z=0.0)
    offset[5]=(X=-400.0,Y=0.0,Z=0.0)
    offset[6]=(X=-100.0,Y=-150.0,Z=0.0)
    offset[7]=(X=-100.0,Y=150.0,Z=0.0)
    offset[8]=(X=-400.0,Y=-120.0,Z=0.0)
    offset[9]=(X=-400.0,Y=120.0,Z=0.0)
    offset[10]=(X=-300.0,Y=300.0,Z=0.0)
    offset[11]=(X=-300.0,Y=-300.0,Z=0.0)
    offset[12]=(X=300.0,Y=300.0,Z=0.0)
    offset[13]=(X=300.0,Y=-300.0,Z=0.0)
    offset[14]=(X=-200.0,Y=450.0,Z=0.0)
    offset[15]=(X=-200.0,Y=-450.0,Z=0.0)
    FormationSize=750.0
}