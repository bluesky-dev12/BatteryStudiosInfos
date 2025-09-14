class wAIPawnInfiniteFire extends wAIPawn;

function AddDefaultInventory(optional bool bQuickslotChange)
{
    super.AddDefaultInventory(bQuickslotChange);
    SetInfiniteAmmo();
    //return;    
}
