class UT2K4PhantomRoster extends UT2K4TeamRoster
    abstract
    hidecategories(Movement,Collision,Lighting,LightColor,Karma,Force);

function Initialize(int TeamBots)
{
    Error("Tried to use a UT2K4PhantomRoster in game");
    //return;    
}
