class WaterVolume extends PhysicsVolume;

var string EntrySoundName;
var string ExitSoundName;
var string EntryActorName;
var string PawnEntryActorName;

function PostBeginPlay()
{
    super.PostBeginPlay();
    // End:0x3A
    if((EntrySound == none) && EntrySoundName != "")
    {
        EntrySound = Sound(DynamicLoadObject(EntrySoundName, Class'Engine.Sound'));
    }
    // End:0x6E
    if((ExitSound == none) && ExitSoundName != "")
    {
        ExitSound = Sound(DynamicLoadObject(ExitSoundName, Class'Engine.Sound'));
    }
    // End:0xA2
    if((EntryActor == none) && EntryActorName != "")
    {
        EntryActor = Class<Actor>(DynamicLoadObject(EntryActorName, Class'Core.Class'));
    }
    // End:0xD6
    if((PawnEntryActor == none) && PawnEntryActorName != "")
    {
        PawnEntryActor = Class<Actor>(DynamicLoadObject(PawnEntryActorName, Class'Core.Class'));
    }
    //return;    
}

defaultproperties
{
    EntryActorName="wGame.WaterSplash"
    PawnEntryActorName="wGame.WaterRing"
    FluidFriction=2.4000001
    bWaterVolume=true
    bDistanceFog=true
    DistanceFogColor=(R=32,G=64,B=128,A=64)
    DistanceFogStart=8.0000000
    DistanceFogEnd=2000.0000000
    KExtraLinearDamping=2.5000000
    KExtraAngularDamping=0.4000000
    LocationName="? ?"
}