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
    //return;    
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
    // End:0xE2
    if((Occupant[pos] == none) || !Occupant[pos].Formation())
    {
        // End:0xC4
        if(bFullCheck)
        {
            HitActor = Trace(HitLocation, HitNormal, center.Location, GetLocationFor(pos, B), false);
            // End:0xC4
            if((HitActor != none) && HitNormal.Z < 0.7000000)
            {
                return false;
            }
        }
        LeaveFormation(B);
        Occupant[pos] = B;
        return true;
    }
    //return;    
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
    J0x2B:

    // End:0x5B [Loop If]
    if(i < 16)
    {
        // End:0x51
        if(SetFormation(B, i, true))
        {
            return i;
        }
        i++;
        // [Loop Continue]
        goto J0x2B;
    }
    i = 0;
    J0x62:

    // End:0x92 [Loop If]
    if(i < 16)
    {
        // End:0x88
        if(SetFormation(B, i, false))
        {
            return i;
        }
        i++;
        // [Loop Continue]
        goto J0x62;
    }
    return Rand(15);
    //return;    
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
    loc = (center.Location + (offset[pos].X * X)) + (offset[pos].Y * Y);
    return loc;
    //return;    
}

function Vector GetViewPointFor(Bot B, int pos)
{
    local Vector ViewPoint;
    local Actor center;
    local int i;
    local Actor Best;

    // End:0x1D5
    if(B.Pawn.Anchor != none)
    {
        i = 0;
        J0x24:

        // End:0x1D5 [Loop If]
        if(i < B.Pawn.Anchor.PathList.Length)
        {
            // End:0x1CB
            if(((((B.Pawn.Anchor.PathList[i] != none) && VSize(B.Pawn.Location - B.Pawn.Anchor.PathList[i].End.Location) > float(400)) && FRand() > 0.3000000) && VSize(B.FocalPoint - B.Pawn.Anchor.PathList[i].End.Location) > float(100)) && FastTrace(B.Pawn.Location, B.Pawn.Anchor.PathList[i].End.Location))
            {
                Best = B.Pawn.Anchor.PathList[i].End;
            }
            i++;
            // [Loop Continue]
            goto J0x24;
        }
    }
    // End:0x21E
    if(Best != none)
    {
        return Best.Location + ((0.5000000 * B.Pawn.CollisionHeight) * vect(0.0000000, 0.0000000, 1.0000000));
    }
    // End:0x359
    if(B.Pawn.bStationary || Vehicle(B.Pawn) != none)
    {
        ViewPoint = B.Pawn.Location + (float(2000) * VRand());
        ViewPoint.Z = B.Pawn.Location.Z;
        // End:0x31E
        if(((ViewPoint - B.Pawn.Location) Dot (B.FocalPoint - B.Pawn.Location)) > float(0))
        {
            ViewPoint = (float(2) * B.Pawn.Location) - ViewPoint;
        }
        // End:0x356
        if(!FastTrace(ViewPoint, B.Pawn.Location))
        {
            ViewPoint = B.FocalPoint;
        }        
    }
    else
    {
        center = SquadAI(Owner).FormationCenter();
        // End:0x3A0
        if(center == none)
        {
            return B.Pawn.Location + (float(200) * VRand());
        }
        ViewPoint = (float(2) * B.Pawn.Location) - center.Location;
        ViewPoint.Z = B.Pawn.Location.Z;
    }
    return ViewPoint;
    //return;    
}

defaultproperties
{
    offset[0]=(X=100.0000000,Y=300.0000000,Z=0.0000000)
    offset[1]=(X=300.0000000,Y=0.0000000,Z=0.0000000)
    offset[2]=(X=100.0000000,Y=-300.0000000,Z=0.0000000)
    offset[3]=(X=-100.0000000,Y=300.0000000,Z=0.0000000)
    offset[4]=(X=-100.0000000,Y=-300.0000000,Z=0.0000000)
    offset[5]=(X=-400.0000000,Y=0.0000000,Z=0.0000000)
    offset[6]=(X=-100.0000000,Y=-150.0000000,Z=0.0000000)
    offset[7]=(X=-100.0000000,Y=150.0000000,Z=0.0000000)
    offset[8]=(X=-400.0000000,Y=-120.0000000,Z=0.0000000)
    offset[9]=(X=-400.0000000,Y=120.0000000,Z=0.0000000)
    offset[10]=(X=-300.0000000,Y=300.0000000,Z=0.0000000)
    offset[11]=(X=-300.0000000,Y=-300.0000000,Z=0.0000000)
    offset[12]=(X=300.0000000,Y=300.0000000,Z=0.0000000)
    offset[13]=(X=300.0000000,Y=-300.0000000,Z=0.0000000)
    offset[14]=(X=-200.0000000,Y=450.0000000,Z=0.0000000)
    offset[15]=(X=-200.0000000,Y=-450.0000000,Z=0.0000000)
    FormationSize=750.0000000
}