class ComboInvis extends Combo
    hidecategories(Movement,Collision,Lighting,LightColor,Karma,Force);

function StartEffect(wPawn P)
{
    P.SetInvisibility(60.0000000);
    //return;    
}

function StopEffect(wPawn P)
{
    P.SetInvisibility(0.0000000);
    //return;    
}

defaultproperties
{
    ExecMessage="??!"
    ComboAnnouncementName="Invisible"
    keys[0]=8
    keys[1]=8
    keys[2]=4
    keys[3]=4
}