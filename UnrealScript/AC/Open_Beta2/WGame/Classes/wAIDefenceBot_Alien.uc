class wAIDefenceBot_Alien extends wAIDefenceBot;

function NotifyAddDefaultInventory()
{
    // End:0x31
    if(9014 != wAIDefencePawn(Pawn).iNpcID)
    {
        Pawn.SwitchWeapon(1);        
    }
    else
    {
        Pawn.SwitchWeapon(5);
    }
    //return;    
}

function SetupWeapons(Pawn aPawn)
{
    super.SetupWeapons(aPawn);
    //return;    
}

defaultproperties
{
    PawnClass=Class'WGame_Decompressed.wAIDefencePawn_Alien'
}