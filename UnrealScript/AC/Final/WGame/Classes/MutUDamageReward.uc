class MutUDamageReward extends Mutator
    hidecategories(Movement,Collision,Lighting,LightColor,Karma,Force);

event PostBeginPlay()
{
    super(Actor).PostBeginPlay();
    // End:0x31
    if(!bDeleteMe)
    {
        Level.Game.AddGameModifier(Spawn(Class'WGame_Decompressed.UDamageRules'));
    }
    //return;    
}

defaultproperties
{
    FriendlyName="UDamage ???"
    Description="?? ???? ??, ?? ????? UDamege(?: ?? ???) ???? ???? ?? ??? ?? ??? ???."
}