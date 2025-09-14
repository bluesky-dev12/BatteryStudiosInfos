class DefaultPhysicsVolume extends PhysicsVolume
    native
    notplaceable;

function Destroyed()
{
    Log(string(self) $ " destroyed!");
    assert(false);
    //return;    
}

defaultproperties
{
    bStatic=false
    bNoDelete=false
}