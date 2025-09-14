class wSeekingIncenRocket_Nemesis extends wSeekingRocket_Nemesis;

function SplashGrenades(Vector HitLocation)
{
    local int G;
    local wProjectile NewGr;
    local Class<wProjectile> GRClass;
    local Vector RandV;
    local Rotator RandR;

    GRClass = Class<wProjectile>(DynamicLoadObject("WWeapons.wGrenade_Nemesis", Class'Core.Class'));
    G = 0;
    J0x38:

    // End:0x177 [Loop If]
    if(G < BaseParams.i2ndBulletCount)
    {
        NewGr = Spawn(GRClass, self,, HitLocation);
        // End:0x16D
        if(NewGr != none)
        {
            RandV = VRand();
            NewGr.bIncExplosion = false;
            // End:0x150
            if(NewGr.IsA('wGrenade_Nemesis'))
            {
                // End:0xC2
                if(RandV.Z < 0.0000000)
                {
                    RandV.Z *= -1.0000000;
                }
                RandR = Rotator(RandV);
                NewGr.Rotate_Pitch = RandR.Pitch;
                NewGr.Rotate_Yaw = RandR.Yaw;
                NewGr.Rotate_Roll = RandR.Roll;
                // End:0x150
                if(int(Instigator.Role) == int(ROLE_Authority))
                {
                    NewGr.vHostLocation = NewGr.Location;
                }
            }
            NewGr.iWeaponID = BaseParams.iBombWeaponID;
        }
        G++;
        // [Loop Continue]
        goto J0x38;
    }
    NewGr = Spawn(GRClass, self,, Location);
    // End:0x24B
    if(NewGr != none)
    {
        RandV = VRand();
        NewGr.bIncExplosion = false;
        // End:0x22E
        if(NewGr.IsA('wGrenade_Nemesis'))
        {
            NewGr.Rotate_Pitch = 32768;
            NewGr.Rotate_Yaw = 0;
            NewGr.Rotate_Roll = 0;
            // End:0x22E
            if(int(Instigator.Role) == int(ROLE_Authority))
            {
                NewGr.vHostLocation = NewGr.Location;
            }
        }
        NewGr.iWeaponID = BaseParams.iBombWeaponID;
    }
    //return;    
}

simulated function Explode(Vector HitLocation, Vector HitNormal)
{
    // End:0x1B
    if(int(Role) == int(ROLE_Authority))
    {
        SplashGrenades(HitLocation);
    }
    super(wRocket).Explode(HitLocation, HitNormal);
    //return;    
}

defaultproperties
{
    iWeaponID=90033
}