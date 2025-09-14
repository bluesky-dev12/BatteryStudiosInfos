class ComboBerserk extends Combo
    hidecategories(Movement,Collision,Lighting,LightColor,Karma,Force);

var wEmitter Effect;

function StartEffect(wPawn P)
{
    //return;    
}

function StopEffect(wPawn P)
{
    //return;    
}

defaultproperties
{
    ExecMessage="???!"
    ComboAnnouncementName="Berzerk"
    keys[0]=2
    keys[1]=2
    keys[2]=1
    keys[3]=1
}