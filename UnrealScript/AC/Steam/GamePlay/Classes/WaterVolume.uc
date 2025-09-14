/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path GamePlay\Classes\WaterVolume.uc
 * Package Imports:
 *	Gameplay
 *	Engine
 *	Core
 *
 * Stats:
 *	Properties:4
 *	Functions:1
 *
 *******************************************************************************/
class WaterVolume extends PhysicsVolume;

var string EntrySoundName;
var string ExitSoundName;
var string EntryActorName;
var string PawnEntryActorName;

function PostBeginPlay()
{
    super.PostBeginPlay();
    // End:0x3a
    if(EntrySound == none && EntrySoundName != "")
    {
        EntrySound = Sound(DynamicLoadObject(EntrySoundName, class'Sound'));
    }
    // End:0x6e
    if(ExitSound == none && ExitSoundName != "")
    {
        ExitSound = Sound(DynamicLoadObject(ExitSoundName, class'Sound'));
    }
    // End:0xa2
    if(EntryActor == none && EntryActorName != "")
    {
        EntryActor = class<Actor>(DynamicLoadObject(EntryActorName, class'Class'));
    }
    // End:0xd6
    if(PawnEntryActor == none && PawnEntryActorName != "")
    {
        PawnEntryActor = class<Actor>(DynamicLoadObject(PawnEntryActorName, class'Class'));
    }
}

defaultproperties
{
    EntryActorName="wGame.WaterSplash"
    PawnEntryActorName="wGame.WaterRing"
    FluidFriction=2.40
    bWaterVolume=true
    bDistanceFog=true
    DistanceFogColor=(R=32,G=64,B=128,A=64)
    DistanceFogStart=8.0
    DistanceFogEnd=2000.0
    KExtraLinearDamping=2.50
    KExtraAngularDamping=0.40
    LocationName="? ?"
}