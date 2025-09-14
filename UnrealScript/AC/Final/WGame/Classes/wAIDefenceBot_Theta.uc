class wAIDefenceBot_Theta extends wAIDefenceBot;

function NotifyAddDefaultInventory()
{
    Pawn.SwitchWeapon(4);
    //return;    
}

defaultproperties
{
    PawnClass=Class'WGame_Decompressed.wAIDefencePawn_Theta'
}