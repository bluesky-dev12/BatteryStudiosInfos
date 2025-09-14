class UnrealSecurity extends Security
    hidecategories(Movement,Collision,Lighting,LightColor,Karma,Force);

event ServerCallback(int SecType, string Data)
{
    super.ServerCallback(SecType, Data);
    //return;    
}

auto state StartUp
{
    function Timer()
    {
        //return;        
    }
Begin:

    SetTimer(FRand() + float(1), false);
    stop;                    
}
