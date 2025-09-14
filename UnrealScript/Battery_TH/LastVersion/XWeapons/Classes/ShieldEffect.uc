class ShieldEffect extends Actor
    notplaceable;

var float Brightness;
var float DesiredBrightness;

function Flash(int Drain)
{
    Brightness = FMin(Brightness + float(Drain / 2), 250.0000000);
    Skins[0] = Skins[1];
    SetTimer(0.2000000, false);
    //return;    
}

function Timer()
{
    Skins[0] = default.Skins[0];
    //return;    
}

function SetBrightness(int B)
{
    DesiredBrightness = FMin(50.0000000 + float(B * 2), 250.0000000);
    //return;    
}

defaultproperties
{
    Brightness=250.0000000
    DesiredBrightness=250.0000000
    DrawType=8
    bHidden=true
    bOnlyOwnerSee=true
    RemoteRole=0
    DrawScale=1.8000000
    AmbientGlow=250
    bUnlit=true
}