class ComboDefensive extends Combo
    hidecategories(Movement,Collision,Lighting,LightColor,Karma,Force);

var wEmitter Effect;

function StartEffect(wPawn P)
{
    // End:0x49
    if(int(P.Role) == int(ROLE_Authority))
    {
        Effect = Spawn(Class'XEffects.RegenCrosses', P,, P.Location, P.Rotation);
    }
    SetTimer(0.9000000, true);
    Timer();
    //return;    
}

function Timer()
{
    // End:0x8C
    if(int(Pawn(Owner).Role) == int(ROLE_Authority))
    {
        Pawn(Owner).GiveHealth(5, int(Pawn(Owner).SuperHealthMax));
        // End:0x8C
        if(float(Pawn(Owner).Health) == Pawn(Owner).SuperHealthMax)
        {
            Pawn(Owner).AddShieldStrength(5);
        }
    }
    //return;    
}

function StopEffect(wPawn P)
{
    // End:0x17
    if(Effect != none)
    {
        Effect.Destroy();
    }
    //return;    
}

defaultproperties
{
    ExecMessage="???!"
    ComboAnnouncementName="Booster"
    keys[0]=2
    keys[1]=2
    keys[2]=2
    keys[3]=2
}